// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum ReportType {
  @JsonValue("CS")
  CS,
  @JsonValue("BASIC")
  BASIC,
}
