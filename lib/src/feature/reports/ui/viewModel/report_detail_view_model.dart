import 'package:a_and_i_report_web_server/src/feature/reports/providers/get_report_detail_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_detail_view_model.g.dart';

@riverpod
class ReportDetailViewModel extends _$ReportDetailViewModel {
  @override
  ReportDatailState build(String id) {
    _load(id);
    return const ReportDatailState();
  }

  Future<void> _load(String id) async {
    try {
      final report = await ref.read(getReportDetailUsecaseProvider).call(id);
      state = ReportDatailState(status: ViewStatus.success, report: report);
    } catch (e) {
      state = ReportDatailState(status: ViewStatus.error, errorMsg: e.toString());
    }
  }
}
