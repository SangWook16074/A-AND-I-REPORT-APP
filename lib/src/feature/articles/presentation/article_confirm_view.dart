import 'dart:typed_data';

import 'package:a_and_i_report_web_server/src/core/auth/role_policy.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/collaborator_lookup_user.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post_author.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_write_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ArticleConfirmView extends ConsumerStatefulWidget {
  const ArticleConfirmView({super.key});

  @override
  ConsumerState<ArticleConfirmView> createState() => ArticleConfirmViewState();
}

class ArticleConfirmViewState extends ConsumerState<ArticleConfirmView> {
  late final TextEditingController summaryController;
  late final TextEditingController collaboratorCodeController;
  CollaboratorLookupUser? lookupCollaborator;
  String collaboratorLookupMessage = '';
  bool isLookingUpCollaborator = false;

  @override
  void initState() {
    super.initState();
    final composeState = ref.read(articleWriteViewModelProvider);
    summaryController = TextEditingController(text: composeState.summary);
    collaboratorCodeController = TextEditingController();
    summaryController.addListener(_syncSummary);
  }

  @override
  void dispose() {
    summaryController.removeListener(_syncSummary);
    summaryController.dispose();
    collaboratorCodeController.dispose();
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
      return const _ArticleConfirmPermissionDeniedView();
    }

    final composeState = ref.watch(articleWriteViewModelProvider);
    final isEditingPublished = composeState.postId.trim().isNotEmpty &&
        composeState.editingPostStatus.trim().toLowerCase() == 'published';
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final maxWidth = isMobile ? 680.0 : (isTablet ? 980.0 : 1200.0);
    final outerHorizontal = isMobile ? 14.0 : (isTablet ? 22.0 : 32.0);
    final contentHorizontal = isMobile ? 6.0 : (isTablet ? 10.0 : 20.0);
    final topBottom = isMobile ? 18.0 : (isTablet ? 30.0 : 40.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: topBottom),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: outerHorizontal),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: contentHorizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Text(
                            isEditingPublished ? '포스트 수정 설정' : '포스트 출간 설정',
                            style: TextStyle(
                              fontSize: isMobile ? 28 : (isTablet ? 32 : 34),
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'PUBLISH SETTINGS',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF9CA3AF),
                              fontWeight: FontWeight.w600,
                              letterSpacing: isMobile ? 0.4 : 1.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isMobile ? 26 : (isTablet ? 40 : 56)),
                      ConfirmPreviewSection(
                        summaryController: summaryController,
                        collaboratorCodeController: collaboratorCodeController,
                        thumbnailUrl: composeState.thumbnailUrl,
                        thumbnailBytes: composeState.thumbnailBytes,
                        collaborators: composeState.collaborators,
                        lookupCollaborator: lookupCollaborator,
                        collaboratorLookupMessage: collaboratorLookupMessage,
                        isLookingUpCollaborator: isLookingUpCollaborator,
                        isUploadingImage: composeState.isUploadingImage,
                        onPickThumbnail: () => onTapPickThumbnail(context),
                        onLookupCollaborator: onTapLookupCollaborator,
                        onAddCollaborator: onTapAddCollaborator,
                        onRemoveCollaborator: onTapRemoveCollaborator,
                        isMobile: isMobile,
                        isTablet: isTablet,
                      ),
                      SizedBox(height: isMobile ? 34 : (isTablet ? 44 : 56)),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Color(0xFFF3F4F6)),
                          ),
                        ),
                        child: Flex(
                          direction: isMobile ? Axis.vertical : Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: isMobile
                              ? CrossAxisAlignment.stretch
                              : CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => context.go('/articles/write'),
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFF3F4F6),
                                foregroundColor: const Color(0xFF6B7280),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                minimumSize: Size(
                                  isMobile ? double.infinity : 0,
                                  48,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              child: const Text('취소'),
                            ),
                            SizedBox(
                              width: isMobile ? 0 : 12,
                              height: isMobile ? 12 : 0,
                            ),
                            TextButton(
                              onPressed: composeState.isSubmitting ||
                                      composeState.isUploadingImage
                                  ? null
                                  : () => onTapSaveDraft(context),
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFF3F4F6),
                                foregroundColor: const Color(0xFF374151),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                minimumSize: Size(
                                  isMobile ? double.infinity : 0,
                                  48,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              child: Text(
                                isEditingPublished ? '수정 저장' : '임시저장',
                              ),
                            ),
                            SizedBox(
                              width: isMobile ? 0 : 12,
                              height: isMobile ? 12 : 0,
                            ),
                            FilledButton(
                              onPressed: composeState.isSubmitting ||
                                      composeState.isUploadingImage
                                  ? null
                                  : () => onTapPublish(context),
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 42,
                                  vertical: 18,
                                ),
                                minimumSize: Size(
                                  isMobile ? double.infinity : 0,
                                  52,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              child: Text(
                                isEditingPublished ? '수정 완료' : '출간하기',
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (composeState.isUploadingImage ||
                          composeState.isSubmitting)
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: LinearProgressIndicator(minHeight: 2),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onTapPickThumbnail(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }

    final bytes = await pickedFile.readAsBytes();
    if (!context.mounted) {
      return;
    }

    ref.read(articleWriteViewModelProvider.notifier).setThumbnailImage(
          fileName: _resolveFileName(pickedFile, bytes),
          bytes: bytes,
        );
    _showMessage(context, '썸네일 이미지를 불러왔습니다.');
  }

  Future<void> onTapPublish(BuildContext context) async {
    final summary = summaryController.text;
    ref.read(articleWriteViewModelProvider.notifier).setSummary(summary);
    final composeState = ref.read(articleWriteViewModelProvider);
    final success =
        await ref.read(articleWriteViewModelProvider.notifier).publish(
              title: composeState.title,
              contentMarkdown: composeState.contentMarkdown,
              summary: summary,
            );

    if (!context.mounted) {
      return;
    }

    final nextState = ref.read(articleWriteViewModelProvider);
    if (!success) {
      _showMessage(
        context,
        nextState.errorMsg.isEmpty ? '출간에 실패했습니다.' : nextState.errorMsg,
      );
      return;
    }

    _showMessage(context, nextState.successMsg);
    context.go('/articles');
  }

  Future<void> onTapSaveDraft(BuildContext context) async {
    final summary = summaryController.text;
    ref.read(articleWriteViewModelProvider.notifier).setSummary(summary);
    final composeState = ref.read(articleWriteViewModelProvider);
    final success =
        await ref.read(articleWriteViewModelProvider.notifier).saveDraft(
              title: composeState.title,
              contentMarkdown: composeState.contentMarkdown,
              summary: summary,
            );

    if (!context.mounted) {
      return;
    }

    final nextState = ref.read(articleWriteViewModelProvider);
    if (!success) {
      _showMessage(
        context,
        nextState.errorMsg.isEmpty ? '임시저장에 실패했습니다.' : nextState.errorMsg,
      );
      return;
    }

    _showMessage(context, nextState.successMsg);
  }

  Future<void> onTapLookupCollaborator() async {
    final code = collaboratorCodeController.text.trim();
    if (code.isEmpty) {
      setState(() {
        lookupCollaborator = null;
        collaboratorLookupMessage = '협업자 코드를 입력해주세요.';
      });
      return;
    }

    setState(() {
      isLookingUpCollaborator = true;
      collaboratorLookupMessage = '';
    });

    try {
      final result = await ref
          .read(articleWriteViewModelProvider.notifier)
          .lookupCollaboratorByCode(code: code);
      if (!mounted) {
        return;
      }

      setState(() {
        isLookingUpCollaborator = false;
        lookupCollaborator = result;
        collaboratorLookupMessage =
            result == null ? '해당 코드의 사용자를 찾을 수 없습니다.' : '';
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isLookingUpCollaborator = false;
        lookupCollaborator = null;
        collaboratorLookupMessage = '협업자 조회 중 오류가 발생했습니다.';
      });
    }
  }

  void onTapAddCollaborator() {
    final collaborator = lookupCollaborator;
    if (collaborator == null) {
      return;
    }

    final added =
        ref.read(articleWriteViewModelProvider.notifier).addCollaborator(
              collaborator,
            );
    setState(() {
      if (added) {
        collaboratorCodeController.clear();
        lookupCollaborator = null;
        collaboratorLookupMessage = '협업자를 추가했습니다.';
        return;
      }
      collaboratorLookupMessage = '이미 추가했거나 본인은 협업자로 추가할 수 없습니다.';
    });
  }

  void onTapRemoveCollaborator(String collaboratorId) {
    ref
        .read(articleWriteViewModelProvider.notifier)
        .removeCollaborator(collaboratorId);
  }

  void _syncSummary() {
    ref
        .read(articleWriteViewModelProvider.notifier)
        .setSummary(summaryController.text);
  }

  String _resolveFileName(XFile file, Uint8List bytes) {
    if (file.name.isNotEmpty) {
      return file.name;
    }
    return 'thumbnail_${DateTime.now().millisecondsSinceEpoch}_${bytes.length}.png';
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

class ConfirmPreviewSection extends StatelessWidget {
  const ConfirmPreviewSection({
    super.key,
    required this.summaryController,
    required this.collaboratorCodeController,
    required this.thumbnailUrl,
    required this.thumbnailBytes,
    required this.collaborators,
    required this.lookupCollaborator,
    required this.collaboratorLookupMessage,
    required this.isLookingUpCollaborator,
    required this.isUploadingImage,
    required this.onPickThumbnail,
    required this.onLookupCollaborator,
    required this.onAddCollaborator,
    required this.onRemoveCollaborator,
    required this.isMobile,
    required this.isTablet,
  });

  final TextEditingController summaryController;
  final TextEditingController collaboratorCodeController;
  final String? thumbnailUrl;
  final Uint8List? thumbnailBytes;
  final List<PostAuthor> collaborators;
  final CollaboratorLookupUser? lookupCollaborator;
  final String collaboratorLookupMessage;
  final bool isLookingUpCollaborator;
  final bool isUploadingImage;
  final VoidCallback onPickThumbnail;
  final VoidCallback onLookupCollaborator;
  final VoidCallback onAddCollaborator;
  final ValueChanged<String> onRemoveCollaborator;
  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final hasLocalThumbnail =
        thumbnailBytes != null && thumbnailBytes!.isNotEmpty;
    final hasRemoteThumbnail =
        thumbnailUrl != null && thumbnailUrl!.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ConfirmSectionTitle(
          title: '01. 포스트 미리보기',
        ),
        SizedBox(height: isMobile ? 16 : 20),
        const Text(
          '썸네일 이미지',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: isUploadingImage ? null : onPickThumbnail,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: isMobile ? 180 : (isTablet ? 200 : 220),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              border: Border.all(color: const Color(0xFFF3F4F6)),
              borderRadius: BorderRadius.circular(14),
              image: hasLocalThumbnail
                  ? DecorationImage(
                      image: MemoryImage(thumbnailBytes!),
                      fit: BoxFit.cover,
                    )
                  : hasRemoteThumbnail
                      ? DecorationImage(
                          image: NetworkImage(thumbnailUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
            ),
            child: Stack(
              children: [
                if (!hasLocalThumbnail && !hasRemoteThumbnail)
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 30,
                          color: Color(0xFF9CA3AF),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '이미지 변경',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9CA3AF),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Text(
                        '이미지 변경',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: isMobile ? 18 : 24),
        const Text(
          '포스트 요약',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            TextField(
              controller: summaryController,
              maxLength: 150,
              maxLines: isMobile ? 5 : 6,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9FAFB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Color(0xFFF3F4F6)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                ),
                hintText: '당신의 포스트를 짧게 요약해 보세요...',
                hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                counterText: '',
                contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 28),
              ),
              style: const TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 14,
                height: 1.7,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 12,
              child: ValueListenableBuilder<TextEditingValue>(
                valueListenable: summaryController,
                builder: (context, value, child) {
                  return Text(
                    '${value.text.length} / 150',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFFD1D5DB),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: isMobile ? 18 : 24),
        const Text(
          '공동 작성자',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: collaboratorCodeController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF9FAFB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Color(0xFFF3F4F6)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                  ),
                  hintText: '공개 코드 입력 (예: #OR009)',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: isLookingUpCollaborator ? null : onLookupCollaborator,
              style: FilledButton.styleFrom(
                minimumSize: const Size(64, 44),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '조회',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        if (isLookingUpCollaborator)
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: LinearProgressIndicator(minHeight: 2),
          ),
        if (collaboratorLookupMessage.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              collaboratorLookupMessage,
              style: const TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        if (lookupCollaborator != null)
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF3F4F6)),
            ),
            child: Row(
              children: [
                _CollaboratorAvatar(
                  profileImageUrl: lookupCollaborator!.profileImageUrl,
                  size: 34,
                  iconSize: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lookupCollaborator!.nickname,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF111827),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (lookupCollaborator!.publicCode != null &&
                          lookupCollaborator!.publicCode!.trim().isNotEmpty)
                        Text(
                          lookupCollaborator!.publicCode!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: onAddCollaborator,
                  child: const Text('추가'),
                ),
              ],
            ),
          ),
        const SizedBox(height: 10),
        if (collaborators.isEmpty)
          const Text(
            '추가된 협업자가 없습니다.',
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: collaborators
                .map(
                  (collaborator) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _CollaboratorAvatar(
                          profileImageUrl: collaborator.profileImage,
                          size: 20,
                          iconSize: 12,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          collaborator.nickname,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF111827),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 2),
                        InkWell(
                          onTap: () => onRemoveCollaborator(collaborator.id),
                          borderRadius: BorderRadius.circular(999),
                          child: const Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.close,
                              size: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}

class _CollaboratorAvatar extends StatelessWidget {
  const _CollaboratorAvatar({
    required this.profileImageUrl,
    this.size = 24,
    this.iconSize = 14,
  });

  final String? profileImageUrl;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final url = profileImageUrl?.trim();
    if (url == null || url.isEmpty) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xFFE5E7EB),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Icon(
          Icons.person,
          size: iconSize,
          color: const Color(0xFF6B7280),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Icon(
            Icons.person,
            size: iconSize,
            color: const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}

class ConfirmSectionTitle extends StatelessWidget {
  const ConfirmSectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF3F4F6)),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF9CA3AF),
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _ArticleConfirmPermissionDeniedView extends StatelessWidget {
  const _ArticleConfirmPermissionDeniedView();

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
