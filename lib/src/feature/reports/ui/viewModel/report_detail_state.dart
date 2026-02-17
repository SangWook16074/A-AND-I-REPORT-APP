import 'package:a_and_i_report_web_server/src/feature/reports/data/entities/report.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_detail_state.freezed.dart';

enum ViewStatus { loading, success, error }

@freezed
abstract class ReportDatailState with _$ReportDatailState {
  const factory ReportDatailState({
    @Default(ViewStatus.loading) ViewStatus status,
    Report? report,
    @Default('') String errorMsg,
  }) = _ReportDatailState;
}
