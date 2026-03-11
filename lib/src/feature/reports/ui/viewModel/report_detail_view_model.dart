import 'package:a_and_i_report_web_server/src/core/utils/api_error_mapper.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/providers/get_report_detail_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_detail_view_model.g.dart';

@riverpod
class ReportDetailViewModel extends _$ReportDetailViewModel {
  @override
  ReportDatailState build(String courseSlug, String assignmentId) {
    _load(courseSlug, assignmentId);
    return const ReportDatailState();
  }

  Future<void> _load(String courseSlug, String assignmentId) async {
    try {
      final report = await ref
          .read(getReportDetailUsecaseProvider)
          .call(courseSlug, assignmentId);
      state = ReportDatailState(status: ViewStatus.success, report: report);
    } catch (e) {
      state = ReportDatailState(
        status: ViewStatus.error,
        errorMsg: ApiErrorMapper.map(
          e,
          fallbackMessage: '과제 상세를 불러오지 못했습니다.',
        ),
      );
    }
  }
}
