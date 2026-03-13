// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_summary_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekListResponseDto {
  bool get success;
  List<CourseWeekDto> get data;
  ReportSummaryApiErrorDto? get error;
  String? get timestamp;

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeekListResponseDtoCopyWith<WeekListResponseDto> get copyWith =>
      _$WeekListResponseDtoCopyWithImpl<WeekListResponseDto>(
          this as WeekListResponseDto, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeekListResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(data), error, timestamp);

  @override
  String toString() {
    return 'WeekListResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $WeekListResponseDtoCopyWith<$Res> {
  factory $WeekListResponseDtoCopyWith(
          WeekListResponseDto value, $Res Function(WeekListResponseDto) _then) =
      _$WeekListResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      List<CourseWeekDto> data,
      ReportSummaryApiErrorDto? error,
      String? timestamp});
}

/// @nodoc
class _$WeekListResponseDtoCopyWithImpl<$Res>
    implements $WeekListResponseDtoCopyWith<$Res> {
  _$WeekListResponseDtoCopyWithImpl(this._self, this._then);

  final WeekListResponseDto _self;
  final $Res Function(WeekListResponseDto) _then;

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CourseWeekDto>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ReportSummaryApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WeekListResponseDto].
extension WeekListResponseDtoPatterns on WeekListResponseDto {
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
    TResult Function(_WeekListResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto() when $default != null:
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
    TResult Function(_WeekListResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_WeekListResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto() when $default != null:
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
    TResult Function(bool success, List<CourseWeekDto> data,
            ReportSummaryApiErrorDto? error, String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
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
    TResult Function(bool success, List<CourseWeekDto> data,
            ReportSummaryApiErrorDto? error, String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto():
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(bool success, List<CourseWeekDto> data,
            ReportSummaryApiErrorDto? error, String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WeekListResponseDto extends WeekListResponseDto {
  const _WeekListResponseDto(
      {required this.success,
      required final List<CourseWeekDto> data,
      this.error,
      this.timestamp})
      : _data = data,
        super._();

  @override
  final bool success;
  final List<CourseWeekDto> _data;
  @override
  List<CourseWeekDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final ReportSummaryApiErrorDto? error;
  @override
  final String? timestamp;

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeekListResponseDtoCopyWith<_WeekListResponseDto> get copyWith =>
      __$WeekListResponseDtoCopyWithImpl<_WeekListResponseDto>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeekListResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_data), error, timestamp);

  @override
  String toString() {
    return 'WeekListResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$WeekListResponseDtoCopyWith<$Res>
    implements $WeekListResponseDtoCopyWith<$Res> {
  factory _$WeekListResponseDtoCopyWith(_WeekListResponseDto value,
          $Res Function(_WeekListResponseDto) _then) =
      __$WeekListResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      List<CourseWeekDto> data,
      ReportSummaryApiErrorDto? error,
      String? timestamp});
}

/// @nodoc
class __$WeekListResponseDtoCopyWithImpl<$Res>
    implements _$WeekListResponseDtoCopyWith<$Res> {
  __$WeekListResponseDtoCopyWithImpl(this._self, this._then);

  final _WeekListResponseDto _self;
  final $Res Function(_WeekListResponseDto) _then;

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_WeekListResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CourseWeekDto>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ReportSummaryApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
