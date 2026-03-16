// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum Level {
  @JsonValue("VERYHIGH")
  VERYHIGH("최상"),

  @JsonValue("HIGH")
  HIGH("상"),

  @JsonValue("MEDIUM")
  MEDIUM("중"),

  @JsonValue("LOW")
  LOW("하");

  final String desc;
  const Level(this.desc);
}
