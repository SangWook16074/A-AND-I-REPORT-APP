import 'dart:async';

import 'package:a_and_i_report_web_server/src/core/auth/role_policy.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_write_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/presentation/widgets/article_editor_markdown_actions.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/presentation/widgets/article_editor_panel.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/presentation/widgets/article_preview_panel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web/web.dart' as web;

const String articleWriteDefaultTitle = '';
const String articleWriteDefaultMarkdown = '';

class ArticleWriteView extends ConsumerStatefulWidget {
  const ArticleWriteView({super.key});

  @override
  ConsumerState<ArticleWriteView> createState() => ArticleWriteViewState();
}

class ArticleWriteViewState extends ConsumerState<ArticleWriteView> {
  static const Duration _autoSaveInterval = Duration(minutes: 1);

  late final TextEditingController titleController;
  late final TextEditingController contentController;
  late final FocusNode contentFocusNode;
  late final UndoHistoryController contentUndoController;
  Timer? _autoSaveTimer;
  bool _isAutoSaving = false;

  @override
  void initState() {
    super.initState();
    final composeState = ref.read(articleWriteViewModelProvider);
    final initialTitle = composeState.title.isEmpty
        ? articleWriteDefaultTitle
        : composeState.title;
    final initialMarkdown = composeState.contentMarkdown.isEmpty
        ? articleWriteDefaultMarkdown
        : composeState.contentMarkdown;
    titleController = TextEditingController(text: initialTitle);
    contentController = TextEditingController(text: initialMarkdown);
    contentFocusNode = FocusNode();
    contentUndoController = UndoHistoryController();
    _startAutoSaveTimer();
  }

  @override
  void dispose() {
    _autoSaveTimer?.cancel();
    titleController.dispose();
    contentController.dispose();
    contentFocusNode.dispose();
    contentUndoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);
    if (userState.status == UserStatus.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final canManageArticles = canManageArticlesWithRole(userState.resolvedRole);
    if (!canManageArticles) {
      return const _ArticleWritePermissionDeniedView();
    }

    final composeState = ref.watch(articleWriteViewModelProvider);
    final isEditingPublished = composeState.postId.trim().isNotEmpty &&
        composeState.editingPostStatus.trim().toLowerCase() == 'published';
    final width = MediaQuery.of(context).size.width;
    final split = width >= 1100;
    final livePreviewPanel = _buildLivePreviewPanel();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Shortcuts(
          shortcuts: const <ShortcutActivator, Intent>{
            SingleActivator(LogicalKeyboardKey.keyZ, control: true):
                ArticleUndoIntent(),
            SingleActivator(LogicalKeyboardKey.keyZ, meta: true):
                ArticleUndoIntent(),
            SingleActivator(LogicalKeyboardKey.keyZ,
                control: true, shift: true): ArticleRedoIntent(),
            SingleActivator(LogicalKeyboardKey.keyZ, meta: true, shift: true):
                ArticleRedoIntent(),
            SingleActivator(LogicalKeyboardKey.keyS, control: true):
                ArticleSaveDraftIntent(),
            SingleActivator(LogicalKeyboardKey.keyS, meta: true):
                ArticleSaveDraftIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              ArticleUndoIntent: CallbackAction<ArticleUndoIntent>(
                onInvoke: (intent) {
                  if (contentFocusNode.hasFocus &&
                      contentUndoController.value.canUndo) {
                    contentUndoController.undo();
                  }
                  return null;
                },
              ),
              ArticleRedoIntent: CallbackAction<ArticleRedoIntent>(
                onInvoke: (intent) {
                  if (contentFocusNode.hasFocus &&
                      contentUndoController.value.canRedo) {
                    contentUndoController.redo();
                  }
                  return null;
                },
              ),
              ArticleSaveDraftIntent: CallbackAction<ArticleSaveDraftIntent>(
                onInvoke: (intent) {
                  unawaited(_onShortcutSaveDraft(context));
                  return null;
                },
              ),
            },
            child: Stack(
              children: [
                if (split)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Color(0xFFE5E7EB)),
                            ),
                          ),
                          child: ArticleEditorPanel(
                            titleController: titleController,
                            contentController: contentController,
                            contentFocusNode: contentFocusNode,
                            contentUndoController: contentUndoController,
                            onExit: () => context.go('/articles'),
                            onBold: onTapBold,
                            onItalic: onTapItalic,
                            onStrikethrough: onTapStrikethrough,
                            onQuote: onTapQuote,
                            onCodeBlock: onTapCodeBlock,
                            onImage: () => onTapImage(context),
                            onLink: onTapLink,
                            markdownAreaKey: _markdownAreaKey,
                            isMarkdownDragOver: _isMarkdownDragOver,
                          ),
                        ),
                      ),
                      Expanded(child: livePreviewPanel),
                    ],
                  )
                else
                  Column(
                    children: [
                      Expanded(
                        child: ArticleEditorPanel(
                          titleController: titleController,
                          contentController: contentController,
                          contentFocusNode: contentFocusNode,
                          contentUndoController: contentUndoController,
                          onExit: () => context.go('/articles'),
                          onBold: onTapBold,
                          onItalic: onTapItalic,
                          onStrikethrough: onTapStrikethrough,
                          onQuote: onTapQuote,
                          onCodeBlock: onTapCodeBlock,
                          onImage: () => onTapImage(context),
                          onLink: onTapLink,
                          markdownAreaKey: _markdownAreaKey,
                          isMarkdownDragOver: _isMarkdownDragOver,
                        ),
                      ),
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                      Expanded(child: livePreviewPanel),
                    ],
                  ),
                Positioned(
                  right: split ? 32 : 16,
                  bottom: split ? 24 : 16,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: composeState.isSubmitting ||
                                composeState.isUploadingImage
                            ? null
                            : () => onTapSaveDraft(context),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFF3F4F6),
                          foregroundColor: const Color(0xFF374151),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isEditingPublished ? '수정 저장' : '임시저장',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(width: 10),
                      FilledButton(
                        onPressed: composeState.isSubmitting ||
                                composeState.isUploadingImage
                            ? null
                            : () => onTapGoConfirm(context),
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF111827),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isEditingPublished ? '수정 완료' : '출간하기',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                if (composeState.isUploadingImage || composeState.isSubmitting)
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(minHeight: 2),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLivePreviewPanel() {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: titleController,
      builder: (context, titleValue, _) {
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: contentController,
          builder: (context, contentValue, __) {
            return RepaintBoundary(
              child: ArticlePreviewPanel(
                title: titleValue.text.trim(),
                markdown: contentValue.text,
              ),
            );
          },
        );
      },
    );
  }

  void _bindWebDropListeners() {
    if (!kIsWeb) {
      return;
    }
    if (_webDragOverListener != null || _webDropListener != null) {
      return;
    }

    _webDragOverListener = (web.DragEvent event) {
      final hasFilePayload = _hasFilePayload(event.dataTransfer);
      final shouldHandle =
          hasFilePayload && _isPointerInsideMarkdownArea(event);
      if (hasFilePayload) {
        event.preventDefault();
        event.stopPropagation();
      }
      _setMarkdownDragOver(shouldHandle);
    }.toJS;

    _webDropListener = (web.DragEvent event) {
      final hasFilePayload = _hasFilePayload(event.dataTransfer);
      final shouldHandle =
          hasFilePayload && _isPointerInsideMarkdownArea(event);
      if (hasFilePayload) {
        event.preventDefault();
        event.stopPropagation();
      }
      if (shouldHandle) {
        unawaited(_handleDroppedImages(event));
      }
      _setMarkdownDragOver(false);
    }.toJS;

    web.document.addEventListener('dragover', _webDragOverListener);
    web.document.addEventListener('drop', _webDropListener);
  }

  void _unbindWebDropListeners() {
    if (!kIsWeb) {
      return;
    }

    if (_webDragOverListener != null) {
      web.document.removeEventListener('dragover', _webDragOverListener);
      _webDragOverListener = null;
    }
    if (_webDropListener != null) {
      web.document.removeEventListener('drop', _webDropListener);
      _webDropListener = null;
    }
  }

  bool _hasFilePayload(web.DataTransfer? dataTransfer) {
    if (dataTransfer == null) {
      return false;
    }

    final files = dataTransfer.files;
    if (files.length > 0) {
      return true;
    }

    final typesObject = dataTransfer.types.dartify();
    if (typesObject is List<Object?>) {
      for (final type in typesObject) {
        if (type?.toString().toLowerCase() == 'files') {
          return true;
        }
      }
    }

    return false;
  }

  bool _isPointerInsideMarkdownArea(web.DragEvent event) {
    final buildContext = _markdownAreaKey.currentContext;
    if (buildContext == null) {
      return false;
    }

    final renderObject = buildContext.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return false;
    }

    final topLeft = renderObject.localToGlobal(Offset.zero);
    final right = topLeft.dx + renderObject.size.width;
    final bottom = topLeft.dy + renderObject.size.height;
    final pointerX = event.clientX.toDouble();
    final pointerY = event.clientY.toDouble();

    return pointerX >= topLeft.dx &&
        pointerX <= right &&
        pointerY >= topLeft.dy &&
        pointerY <= bottom;
  }

  List<web.File> _extractImageFiles(web.DragEvent event) {
    final files = event.dataTransfer?.files;
    if (files == null || files.length == 0) {
      return const <web.File>[];
    }

    final imageFiles = <web.File>[];
    for (int index = 0; index < files.length; index++) {
      final file = files.item(index);
      if (file == null) {
        continue;
      }
      if (_isImageFile(file)) {
        imageFiles.add(file);
      }
    }
    return imageFiles;
  }

  bool _isImageFile(web.File file) {
    final type = file.type.trim().toLowerCase();
    if (type.startsWith('image/')) {
      return true;
    }

    final lowerName = file.name.toLowerCase();
    return lowerName.endsWith('.png') ||
        lowerName.endsWith('.jpg') ||
        lowerName.endsWith('.jpeg') ||
        lowerName.endsWith('.gif') ||
        lowerName.endsWith('.webp') ||
        lowerName.endsWith('.bmp') ||
        lowerName.endsWith('.svg');
  }

  Future<void> _handleDroppedImages(web.DragEvent event) async {
    final imageFiles = _extractImageFiles(event);
    if (!mounted) {
      return;
    }
    if (imageFiles.isEmpty) {
      _showMessage(context, '이미지 파일만 드롭할 수 있습니다.');
      return;
    }

    int successCount = 0;
    int failureCount = 0;

    for (final file in imageFiles) {
      try {
        final bytes = await _readWebFileBytes(file);
        if (!mounted) {
          return;
        }

        final uploadedImageUrl =
            await ref.read(articleWriteViewModelProvider.notifier).uploadImage(
                  fileName: _resolveDroppedFileName(file, bytes),
                  bytes: bytes,
                );
        if (!mounted) {
          return;
        }

        if (uploadedImageUrl == null || uploadedImageUrl.isEmpty) {
          failureCount += 1;
          continue;
        }

        ArticleEditorMarkdownActions.applyUploadedImage(
          contentController,
          contentFocusNode,
          imageUrl: uploadedImageUrl,
          altText: '이미지',
        );
        successCount += 1;
      } catch (_) {
        failureCount += 1;
      }
    }

    if (!mounted) {
      return;
    }

    if (successCount > 0 && failureCount == 0) {
      final message = successCount == 1
          ? '이미지 업로드 후 본문에 삽입했습니다.'
          : '$successCount개의 이미지를 업로드해 본문에 삽입했습니다.';
      _showMessage(context, message);
      return;
    }

    if (successCount > 0 && failureCount > 0) {
      _showMessage(
        context,
        '$successCount개 삽입 완료, $failureCount개는 업로드에 실패했습니다.',
      );
      return;
    }

    final errorMsg = ref.read(articleWriteViewModelProvider).errorMsg;
    _showMessage(
      context,
      errorMsg.isEmpty ? '이미지 업로드에 실패했습니다.' : errorMsg,
    );
  }

  Future<Uint8List> _readWebFileBytes(web.File file) async {
    final jsArrayBuffer = await file.arrayBuffer().toDart;
    return Uint8List.view(jsArrayBuffer.toDart);
  }

  String _resolveDroppedFileName(web.File file, Uint8List bytes) {
    final trimmedName = file.name.trim();
    if (trimmedName.isNotEmpty) {
      return trimmedName;
    }

    return 'image_${DateTime.now().millisecondsSinceEpoch}_${bytes.length}.png';
  }

  void _setMarkdownDragOver(bool value) {
    if (!mounted || _isMarkdownDragOver == value) {
      return;
    }
    setState(() {
      _isMarkdownDragOver = value;
    });
  }

  void onTapBold() {
    ArticleEditorMarkdownActions.applyBold(contentController, contentFocusNode);
  }

  void onTapItalic() {
    ArticleEditorMarkdownActions.applyItalic(
        contentController, contentFocusNode);
  }

  void onTapStrikethrough() {
    ArticleEditorMarkdownActions.applyStrikethrough(
      contentController,
      contentFocusNode,
    );
  }

  void onTapQuote() {
    ArticleEditorMarkdownActions.applyQuote(
        contentController, contentFocusNode);
  }

  void onTapCodeBlock() {
    ArticleEditorMarkdownActions.applyCodeBlock(
      contentController,
      contentFocusNode,
    );
  }

  Future<void> onTapImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }

    final bytes = await pickedFile.readAsBytes();
    if (!context.mounted) {
      return;
    }

    final uploadedImageUrl =
        await ref.read(articleWriteViewModelProvider.notifier).uploadImage(
              fileName: _resolveFileName(pickedFile, bytes),
              bytes: bytes,
            );

    if (!context.mounted) {
      return;
    }

    if (uploadedImageUrl == null || uploadedImageUrl.isEmpty) {
      final errorMsg = ref.read(articleWriteViewModelProvider).errorMsg;
      _showMessage(
        context,
        errorMsg.isEmpty ? '이미지 업로드에 실패했습니다.' : errorMsg,
      );
      return;
    }

    ArticleEditorMarkdownActions.applyUploadedImage(
      contentController,
      contentFocusNode,
      imageUrl: uploadedImageUrl,
      altText: '이미지',
    );
    _showMessage(context, '이미지 업로드 후 본문에 삽입했습니다.');
  }

  void onTapLink() {
    ArticleEditorMarkdownActions.applyLink(contentController, contentFocusNode);
  }

  Future<void> onTapSaveDraft(BuildContext context) async {
    final success =
        await ref.read(articleWriteViewModelProvider.notifier).saveDraft(
              title: titleController.text,
              contentMarkdown: contentController.text,
            );
    if (!context.mounted) {
      return;
    }

    final composeState = ref.read(articleWriteViewModelProvider);
    if (success) {
      _showMessage(context, composeState.successMsg);
      return;
    }

    _showMessage(
      context,
      composeState.errorMsg.isEmpty ? '임시저장에 실패했습니다.' : composeState.errorMsg,
    );
  }

  Future<void> _onShortcutSaveDraft(BuildContext context) async {
    final composeState = ref.read(articleWriteViewModelProvider);
    if (composeState.isSubmitting || composeState.isUploadingImage) {
      return;
    }

    await onTapSaveDraft(context);
  }

  void onTapGoConfirm(BuildContext context) {
    _syncDraft();
    context.go('/articles/confirm');
  }

  void _syncDraft() {
    ref.read(articleWriteViewModelProvider.notifier).syncDraft(
          title: titleController.text,
          contentMarkdown: contentController.text,
        );
  }

  void _startAutoSaveTimer() {
    _autoSaveTimer?.cancel();
    _autoSaveTimer = Timer.periodic(_autoSaveInterval, (_) {
      unawaited(_triggerAutoSave());
    });
  }

  Future<void> _triggerAutoSave() async {
    if (!mounted || _isAutoSaving) {
      return;
    }

    final userState = ref.read(userViewModelProvider);
    if (userState.status != UserStatus.authenticated ||
        !canManageArticlesWithRole(userState.resolvedRole)) {
      return;
    }

    _isAutoSaving = true;
    try {
      await ref.read(articleWriteViewModelProvider.notifier).autoSaveDraft(
            title: titleController.text,
            contentMarkdown: contentController.text,
          );
    } finally {
      _isAutoSaving = false;
    }
  }

  String _resolveFileName(XFile file, Uint8List bytes) {
    if (file.name.isNotEmpty) {
      return file.name;
    }
    return 'image_${DateTime.now().millisecondsSinceEpoch}_${bytes.length}.png';
  }

  void _showMessage(BuildContext context, String msg) {
    if (msg.trim().isEmpty) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }
}

class ArticleUndoIntent extends Intent {
  const ArticleUndoIntent();
}

class ArticleRedoIntent extends Intent {
  const ArticleRedoIntent();
}

class ArticleSaveDraftIntent extends Intent {
  const ArticleSaveDraftIntent();
}

class _ArticleWritePermissionDeniedView extends StatelessWidget {
  const _ArticleWritePermissionDeniedView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'ORGANIZER 이상 권한이 필요합니다.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => context.go('/articles'),
                child: const Text('목록으로 이동'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
