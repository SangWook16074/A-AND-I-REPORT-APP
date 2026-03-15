// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmissionResult {
  String get submissionId;
  String get status;
  List<SubmissionTestCaseResult> get testCases;

  /// Create a copy of SubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmissionResultCopyWith<SubmissionResult> get copyWith =>
      _$SubmissionResultCopyWithImpl<SubmissionResult>(
          this as SubmissionResult, _$identity);

  /// Serializes this SubmissionResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubmissionResult &&
            (identical(other.submissionId, submissionId) ||
                other.submissionId == submissionId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.testCases, testCases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, submissionId, status,
      const DeepCollectionEquality().hash(testCases));

  @override
  String toString() {
    return 'SubmissionResult(submissionId: $submissionId, status: $status, testCases: $testCases)';
  }
}

/// @nodoc
abstract mixin class $SubmissionResultCopyWith<$Res> {
  factory $SubmissionResultCopyWith(
          SubmissionResult value, $Res Function(SubmissionResult) _then) =
      _$SubmissionResultCopyWithImpl;
  @useResult
  $Res call(
      {String submissionId,
      String status,
      List<SubmissionTestCaseResult> testCases});
}

/// @nodoc
class _$SubmissionResultCopyWithImpl<$Res>
    implements $SubmissionResultCopyWith<$Res> {
  _$SubmissionResultCopyWithImpl(this._self, this._then);

  final SubmissionResult _self;
  final $Res Function(SubmissionResult) _then;

  /// Create a copy of SubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submissionId = null,
    Object? status = null,
    Object? testCases = null,
  }) {
    return _then(_self.copyWith(
      submissionId: null == submissionId
          ? _self.submissionId
          : submissionId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      testCases: null == testCases
          ? _self.testCases
          : testCases // ignore: cast_nullable_to_non_nullable
              as List<SubmissionTestCaseResult>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubmissionResult].
extension SubmissionResultPatterns on SubmissionResult {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SubmissionResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionResult() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SubmissionResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionResult():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SubmissionResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionResult() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String submissionId, String status,
            List<SubmissionTestCaseResult> testCases)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionResult() when $default != null:
        return $default(_that.submissionId, _that.status, _that.testCases);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String submissionId, String status,
            List<SubmissionTestCaseResult> testCases)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionResult():
        return $default(_that.submissionId, _that.status, _that.testCases);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String submissionId, String status,
            List<SubmissionTestCaseResult> testCases)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionResult() when $default != null:
        return $default(_that.submissionId, _that.status, _that.testCases);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubmissionResult implements SubmissionResult {
  const _SubmissionResult(
      {required this.submissionId,
      required this.status,
      final List<SubmissionTestCaseResult> testCases =
          const <SubmissionTestCaseResult>[]})
      : _testCases = testCases;
  factory _SubmissionResult.fromJson(Map<String, dynamic> json) =>
      _$SubmissionResultFromJson(json);

  @override
  final String submissionId;
  @override
  final String status;
  final List<SubmissionTestCaseResult> _testCases;
  @override
  @JsonKey()
  List<SubmissionTestCaseResult> get testCases {
    if (_testCases is EqualUnmodifiableListView) return _testCases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_testCases);
  }

  /// Create a copy of SubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmissionResultCopyWith<_SubmissionResult> get copyWith =>
      __$SubmissionResultCopyWithImpl<_SubmissionResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubmissionResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubmissionResult &&
            (identical(other.submissionId, submissionId) ||
                other.submissionId == submissionId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._testCases, _testCases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, submissionId, status,
      const DeepCollectionEquality().hash(_testCases));

  @override
  String toString() {
    return 'SubmissionResult(submissionId: $submissionId, status: $status, testCases: $testCases)';
  }
}

/// @nodoc
abstract mixin class _$SubmissionResultCopyWith<$Res>
    implements $SubmissionResultCopyWith<$Res> {
  factory _$SubmissionResultCopyWith(
          _SubmissionResult value, $Res Function(_SubmissionResult) _then) =
      __$SubmissionResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String submissionId,
      String status,
      List<SubmissionTestCaseResult> testCases});
}

/// @nodoc
class __$SubmissionResultCopyWithImpl<$Res>
    implements _$SubmissionResultCopyWith<$Res> {
  __$SubmissionResultCopyWithImpl(this._self, this._then);

  final _SubmissionResult _self;
  final $Res Function(_SubmissionResult) _then;

  /// Create a copy of SubmissionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? submissionId = null,
    Object? status = null,
    Object? testCases = null,
  }) {
    return _then(_SubmissionResult(
      submissionId: null == submissionId
          ? _self.submissionId
          : submissionId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      testCases: null == testCases
          ? _self._testCases
          : testCases // ignore: cast_nullable_to_non_nullable
              as List<SubmissionTestCaseResult>,
    ));
  }
}

/// @nodoc
mixin _$SubmissionTestCaseResult {
  int? get caseId;
  String? get status;
  int? get timeMs;
  double? get memoryMb;
  String? get output;
  String? get error;

  /// Create a copy of SubmissionTestCaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmissionTestCaseResultCopyWith<SubmissionTestCaseResult> get copyWith =>
      _$SubmissionTestCaseResultCopyWithImpl<SubmissionTestCaseResult>(
          this as SubmissionTestCaseResult, _$identity);

  /// Serializes this SubmissionTestCaseResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubmissionTestCaseResult &&
            (identical(other.caseId, caseId) || other.caseId == caseId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs) &&
            (identical(other.memoryMb, memoryMb) ||
                other.memoryMb == memoryMb) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, caseId, status, timeMs, memoryMb, output, error);

  @override
  String toString() {
    return 'SubmissionTestCaseResult(caseId: $caseId, status: $status, timeMs: $timeMs, memoryMb: $memoryMb, output: $output, error: $error)';
  }
}

/// @nodoc
abstract mixin class $SubmissionTestCaseResultCopyWith<$Res> {
  factory $SubmissionTestCaseResultCopyWith(SubmissionTestCaseResult value,
          $Res Function(SubmissionTestCaseResult) _then) =
      _$SubmissionTestCaseResultCopyWithImpl;
  @useResult
  $Res call(
      {int? caseId,
      String? status,
      int? timeMs,
      double? memoryMb,
      String? output,
      String? error});
}

/// @nodoc
class _$SubmissionTestCaseResultCopyWithImpl<$Res>
    implements $SubmissionTestCaseResultCopyWith<$Res> {
  _$SubmissionTestCaseResultCopyWithImpl(this._self, this._then);

  final SubmissionTestCaseResult _self;
  final $Res Function(SubmissionTestCaseResult) _then;

  /// Create a copy of SubmissionTestCaseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caseId = freezed,
    Object? status = freezed,
    Object? timeMs = freezed,
    Object? memoryMb = freezed,
    Object? output = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      caseId: freezed == caseId
          ? _self.caseId
          : caseId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      memoryMb: freezed == memoryMb
          ? _self.memoryMb
          : memoryMb // ignore: cast_nullable_to_non_nullable
              as double?,
      output: freezed == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubmissionTestCaseResult].
extension SubmissionTestCaseResultPatterns on SubmissionTestCaseResult {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SubmissionTestCaseResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionTestCaseResult() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SubmissionTestCaseResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionTestCaseResult():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SubmissionTestCaseResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionTestCaseResult() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? caseId, String? status, int? timeMs, double? memoryMb,
            String? output, String? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionTestCaseResult() when $default != null:
        return $default(_that.caseId, _that.status, _that.timeMs,
            _that.memoryMb, _that.output, _that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? caseId, String? status, int? timeMs, double? memoryMb,
            String? output, String? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionTestCaseResult():
        return $default(_that.caseId, _that.status, _that.timeMs,
            _that.memoryMb, _that.output, _that.error);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int? caseId, String? status, int? timeMs,
            double? memoryMb, String? output, String? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionTestCaseResult() when $default != null:
        return $default(_that.caseId, _that.status, _that.timeMs,
            _that.memoryMb, _that.output, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubmissionTestCaseResult implements SubmissionTestCaseResult {
  const _SubmissionTestCaseResult(
      {this.caseId,
      this.status,
      this.timeMs,
      this.memoryMb,
      this.output,
      this.error});
  factory _SubmissionTestCaseResult.fromJson(Map<String, dynamic> json) =>
      _$SubmissionTestCaseResultFromJson(json);

  @override
  final int? caseId;
  @override
  final String? status;
  @override
  final int? timeMs;
  @override
  final double? memoryMb;
  @override
  final String? output;
  @override
  final String? error;

  /// Create a copy of SubmissionTestCaseResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmissionTestCaseResultCopyWith<_SubmissionTestCaseResult> get copyWith =>
      __$SubmissionTestCaseResultCopyWithImpl<_SubmissionTestCaseResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubmissionTestCaseResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubmissionTestCaseResult &&
            (identical(other.caseId, caseId) || other.caseId == caseId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs) &&
            (identical(other.memoryMb, memoryMb) ||
                other.memoryMb == memoryMb) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, caseId, status, timeMs, memoryMb, output, error);

  @override
  String toString() {
    return 'SubmissionTestCaseResult(caseId: $caseId, status: $status, timeMs: $timeMs, memoryMb: $memoryMb, output: $output, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$SubmissionTestCaseResultCopyWith<$Res>
    implements $SubmissionTestCaseResultCopyWith<$Res> {
  factory _$SubmissionTestCaseResultCopyWith(_SubmissionTestCaseResult value,
          $Res Function(_SubmissionTestCaseResult) _then) =
      __$SubmissionTestCaseResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? caseId,
      String? status,
      int? timeMs,
      double? memoryMb,
      String? output,
      String? error});
}

/// @nodoc
class __$SubmissionTestCaseResultCopyWithImpl<$Res>
    implements _$SubmissionTestCaseResultCopyWith<$Res> {
  __$SubmissionTestCaseResultCopyWithImpl(this._self, this._then);

  final _SubmissionTestCaseResult _self;
  final $Res Function(_SubmissionTestCaseResult) _then;

  /// Create a copy of SubmissionTestCaseResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? caseId = freezed,
    Object? status = freezed,
    Object? timeMs = freezed,
    Object? memoryMb = freezed,
    Object? output = freezed,
    Object? error = freezed,
  }) {
    return _then(_SubmissionTestCaseResult(
      caseId: freezed == caseId
          ? _self.caseId
          : caseId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      memoryMb: freezed == memoryMb
          ? _self.memoryMb
          : memoryMb // ignore: cast_nullable_to_non_nullable
              as double?,
      output: freezed == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
