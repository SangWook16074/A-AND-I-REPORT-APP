import 'package:a_and_i_report_web_server/src/feature/reports/data/entities/report.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_submit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/dart.dart';
import 'package:re_highlight/languages/kotlin.dart';
import 'package:re_highlight/languages/python.dart';
import 'package:re_highlight/styles/atom-one-dark.dart';
import 'package:re_highlight/styles/github-dark.dart';
import 'package:re_highlight/styles/monokai-sublime.dart';

class SourceCodeSubmitView extends HookConsumerWidget {
  final Report report;
  final bool isDarkMode;

  const SourceCodeSubmitView({
    super.key,
    required this.report,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submitState = ref.watch(reportSubmitViewModelProvider(report.id));
    final notifier =
        ref.read(reportSubmitViewModelProvider(report.id).notifier);
    final showValidationError = useState(false);
    final isProgrammaticUpdate = useRef(false);

    final controller = useMemoized(
      () => CodeLineEditingController.fromText(
        submitState.draftCodeByLanguage[submitState.selectedLanguage] ??
            submitState.selectedLanguage.template,
        const CodeLineOptions(indentSize: 4),
      ),
      [report.id],
    );

    useEffect(() {
      return controller.dispose;
    }, [controller]);

    useEffect(() {
      final nextText =
          submitState.draftCodeByLanguage[submitState.selectedLanguage] ??
              submitState.selectedLanguage.template;
      if (controller.text != nextText) {
        isProgrammaticUpdate.value = true;
        controller.text = nextText;
        isProgrammaticUpdate.value = false;
      }
      return null;
    }, [submitState.selectedLanguage, submitState.draftCodeByLanguage]);

    useEffect(() {
      void listener() {
        if (isProgrammaticUpdate.value) return;
        notifier.updateDraft(submitState.selectedLanguage, controller.text);
        if (showValidationError.value && controller.text.trim().isNotEmpty) {
          showValidationError.value = false;
        }
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [
      controller,
      notifier,
      submitState.selectedLanguage,
      showValidationError.value
    ]);

    final lang = submitState.selectedLanguage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '소스 코드 제출',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Color(0xFFF5F5F5) : Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '"${report.title}" 과제의 구현 코드를 작성해 제출해 주세요.',
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? Color(0xFFE5E7EB) : Color(0xFF000000),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        _GuidelineBox(isDarkMode: isDarkMode),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: SubmitLanguage.values.map((language) {
            final selected = submitState.selectedLanguage == language;
            return ChoiceChip(
              label: Text(language.label),
              selected: selected,
              onSelected: (_) => notifier.selectLanguage(language),
              selectedColor: const Color(0xFFE5E7EB),
              backgroundColor:
                  isDarkMode ? const Color(0xFF3F3F46) : const Color(0xFFF3F4F6),
              side: BorderSide(
                color: selected
                    ? (isDarkMode
                        ? const Color(0xFFF5F5F5)
                        : const Color(0xFF111827))
                    : (isDarkMode
                        ? const Color(0xFF52525B)
                        : const Color(0xFFD1D5DB)),
              ),
              labelStyle: TextStyle(
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color:
                    isDarkMode ? const Color(0xFFF5F5F5) : const Color(0xFF000000),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Container(
          height: 430,
          decoration: BoxDecoration(
            color: const Color(0xFF0B1020),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFF1F2937)),
          ),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF111827),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                ),
                child: Row(
                  children: [
                    const _Dot(color: Color(0xFFFF5F56)),
                    const SizedBox(width: 6),
                    const _Dot(color: Color(0xFFFFBD2E)),
                    const SizedBox(width: 6),
                    const _Dot(color: Color(0xFF27C93F)),
                    const SizedBox(width: 12),
                    Text(
                      '${lang.label} Editor',
                      style: const TextStyle(
                        color: Color(0xFFD1D5DB),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: notifier.loadTemplateForCurrentLanguage,
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFD1D5DB),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        '템플릿',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CodeEditor(
                  controller: controller,
                  wordWrap: false,
                  autofocus: true,
                  autocompleteSymbols: true,
                  style: CodeEditorStyle(
                    fontSize: 13,
                    fontFamily: 'monospace',
                    backgroundColor: const Color(0xFF0B1020),
                    textColor: const Color(0xFFE5E7EB),
                    cursorColor: const Color(0xFF93C5FD),
                    selectionColor: const Color(0x334B5563),
                    cursorLineColor: const Color(0x221F2937),
                    codeTheme: lang.codeTheme,
                  ),
                  indicatorBuilder:
                      (context, editingController, chunkController, notifier) {
                    return Row(
                      children: [
                        DefaultCodeLineNumber(
                          controller: editingController,
                          notifier: notifier,
                          textStyle: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF6B7280),
                            fontFamily: 'monospace',
                          ),
                          focusedTextStyle: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9CA3AF),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'monospace',
                          ),
                        ),
                        if (lang != SubmitLanguage.python)
                          DefaultCodeChunkIndicator(
                            width: 18,
                            controller: chunkController,
                            notifier: notifier,
                          ),
                      ],
                    );
                  },
                  sperator: Container(width: 1, color: const Color(0xFF1F2937)),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(13),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showValidationError.value) ...[
          const SizedBox(height: 10),
          const Text(
            '제출할 소스 코드를 입력해 주세요.',
            style: TextStyle(
              color: Color(0xFFDC2626),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF111827),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            ),
            onPressed: submitState.isSubmitting
                ? null
                : () async {
                    final success = await notifier.submitCurrentDraft(
                      problemId: report.problemId,
                    );
                    final latestState =
                        ref.read(reportSubmitViewModelProvider(report.id));
                    if (latestState.errorMsg.isNotEmpty && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(latestState.errorMsg)),
                      );
                    }
                    if (success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('제출이 접수되었습니다. 결과 탭에서 상태를 확인하세요.'),
                        ),
                      );
                    }
                    showValidationError.value =
                        !success && latestState.errorMsg.isEmpty;
                  },
            child: Text(
              submitState.isSubmitting ? '제출 중...' : '제출하기',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}

class _GuidelineBox extends StatelessWidget {
  final bool isDarkMode;
  const _GuidelineBox({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 13,
      color: isDarkMode ? const Color(0xFFE5E7EB) : const Color(0xFF000000),
      height: 1.5,
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF27272A) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? const Color(0xFF3F3F46) : const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '에디터 안내',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Color(0xFFF5F5F5) : Color(0xFF000000),
            ),
          ),
          SizedBox(height: 8),
          Text('• 괄호/따옴표 자동 닫기와 탭 들여쓰기를 지원합니다.', style: style),
          SizedBox(height: 4),
          Text('• 줄 번호와 단축키(undo/redo, 검색 등)를 사용할 수 있습니다.', style: style),
          SizedBox(height: 4),
          Text('• 언어별 작성 내용은 자동 저장됩니다.', style: style),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

extension _SubmitLanguageEditorThemeX on SubmitLanguage {
  CodeHighlightTheme get codeTheme => CodeHighlightTheme(
        languages: {
          key: CodeHighlightThemeMode(
            mode: switch (this) {
              SubmitLanguage.kotlin => langKotlin,
              SubmitLanguage.dart => langDart,
              SubmitLanguage.python => langPython,
            },
          ),
        },
        theme: switch (this) {
          SubmitLanguage.kotlin => monokaiSublimeTheme,
          SubmitLanguage.dart => githubDarkTheme,
          SubmitLanguage.python => atomOneDarkTheme,
        },
      );
}
