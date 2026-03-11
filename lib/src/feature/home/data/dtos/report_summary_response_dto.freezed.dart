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
mixin _$ReportSummaryResponseDto {
  bool get success;
  List<ReportSummary> get data;
  ReportSummaryApiErrorDto? get error;
  String? get timestamp;

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportSummaryResponseDtoCopyWith<ReportSummaryResponseDto> get copyWith =>
      _$ReportSummaryResponseDtoCopyWithImpl<ReportSummaryResponseDto>(
          this as ReportSummaryResponseDto, _$identity);

  /// Serializes this ReportSummaryResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportSummaryResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(data), error, timestamp);

  @override
  String toString() {
    return 'ReportSummaryResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $ReportSummaryResponseDtoCopyWith<$Res> {
  factory $ReportSummaryResponseDtoCopyWith(ReportSummaryResponseDto value,
          $Res Function(ReportSummaryResponseDto) _then) =
      _$ReportSummaryResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      List<ReportSummary> data,
      ReportSummaryApiErrorDto? error,
      String? timestamp});

  $ReportSummaryApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class _$ReportSummaryResponseDtoCopyWithImpl<$Res>
    implements $ReportSummaryResponseDtoCopyWith<$Res> {
  _$ReportSummaryResponseDtoCopyWithImpl(this._self, this._then);

  final ReportSummaryResponseDto _self;
  final $Res Function(ReportSummaryResponseDto) _then;

  /// Create a copy of ReportSummaryResponseDto
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
              as List<ReportSummary>,
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

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportSummaryApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ReportSummaryApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReportSummaryResponseDto].
extension ReportSummaryResponseDtoPatterns on ReportSummaryResponseDto {
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
    TResult Function(_ReportSummaryResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto() when $default != null:
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
    TResult Function(_ReportSummaryResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto():
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
    TResult? Function(_ReportSummaryResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto() when $default != null:
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
    TResult Function(bool success, List<ReportSummary> data,
            ReportSummaryApiErrorDto? error, String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto() when $default != null:
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
    TResult Function(bool success, List<ReportSummary> data,
            ReportSummaryApiErrorDto? error, String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto():
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
    TResult? Function(bool success, List<ReportSummary> data,
            ReportSummaryApiErrorDto? error, String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReportSummaryResponseDto implements ReportSummaryResponseDto {
  const _ReportSummaryResponseDto(
      {required this.success,
      final List<ReportSummary> data = const <ReportSummary>[],
      this.error,
      this.timestamp})
      : _data = data;
  factory _ReportSummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReportSummaryResponseDtoFromJson(json);

  @override
  final bool success;
  final List<ReportSummary> _data;
  @override
  @JsonKey()
  List<ReportSummary> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final ReportSummaryApiErrorDto? error;
  @override
  final String? timestamp;

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportSummaryResponseDtoCopyWith<_ReportSummaryResponseDto> get copyWith =>
      __$ReportSummaryResponseDtoCopyWithImpl<_ReportSummaryResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportSummaryResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportSummaryResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_data), error, timestamp);

  @override
  String toString() {
    return 'ReportSummaryResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$ReportSummaryResponseDtoCopyWith<$Res>
    implements $ReportSummaryResponseDtoCopyWith<$Res> {
  factory _$ReportSummaryResponseDtoCopyWith(_ReportSummaryResponseDto value,
          $Res Function(_ReportSummaryResponseDto) _then) =
      __$ReportSummaryResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      List<ReportSummary> data,
      ReportSummaryApiErrorDto? error,
      String? timestamp});

  @override
  $ReportSummaryApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class __$ReportSummaryResponseDtoCopyWithImpl<$Res>
    implements _$ReportSummaryResponseDtoCopyWith<$Res> {
  __$ReportSummaryResponseDtoCopyWithImpl(this._self, this._then);

  final _ReportSummaryResponseDto _self;
  final $Res Function(_ReportSummaryResponseDto) _then;

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_ReportSummaryResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReportSummary>,
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

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportSummaryApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ReportSummaryApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$ReportSummaryApiErrorDto {
  String? get code;
  String? get message;

  /// Create a copy of ReportSummaryApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportSummaryApiErrorDtoCopyWith<ReportSummaryApiErrorDto> get copyWith =>
      _$ReportSummaryApiErrorDtoCopyWithImpl<ReportSummaryApiErrorDto>(
          this as ReportSummaryApiErrorDto, _$identity);

  /// Serializes this ReportSummaryApiErrorDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportSummaryApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ReportSummaryApiErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ReportSummaryApiErrorDtoCopyWith<$Res> {
  factory $ReportSummaryApiErrorDtoCopyWith(ReportSummaryApiErrorDto value,
          $Res Function(ReportSummaryApiErrorDto) _then) =
      _$ReportSummaryApiErrorDtoCopyWithImpl;
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class _$ReportSummaryApiErrorDtoCopyWithImpl<$Res>
    implements $ReportSummaryApiErrorDtoCopyWith<$Res> {
  _$ReportSummaryApiErrorDtoCopyWithImpl(this._self, this._then);

  final ReportSummaryApiErrorDto _self;
  final $Res Function(ReportSummaryApiErrorDto) _then;

  /// Create a copy of ReportSummaryApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportSummaryApiErrorDto].
extension ReportSummaryApiErrorDtoPatterns on ReportSummaryApiErrorDto {
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
    TResult Function(_ReportSummaryApiErrorDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryApiErrorDto() when $default != null:
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
    TResult Function(_ReportSummaryApiErrorDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryApiErrorDto():
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
    TResult? Function(_ReportSummaryApiErrorDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryApiErrorDto() when $default != null:
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
    TResult Function(String? code, String? message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryApiErrorDto() when $default != null:
        return $default(_that.code, _that.message);
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
    TResult Function(String? code, String? message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryApiErrorDto():
        return $default(_that.code, _that.message);
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
    TResult? Function(String? code, String? message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryApiErrorDto() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReportSummaryApiErrorDto implements ReportSummaryApiErrorDto {
  const _ReportSummaryApiErrorDto({this.code, this.message});
  factory _ReportSummaryApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ReportSummaryApiErrorDtoFromJson(json);

  @override
  final String? code;
  @override
  final String? message;

  /// Create a copy of ReportSummaryApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportSummaryApiErrorDtoCopyWith<_ReportSummaryApiErrorDto> get copyWith =>
      __$ReportSummaryApiErrorDtoCopyWithImpl<_ReportSummaryApiErrorDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportSummaryApiErrorDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportSummaryApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ReportSummaryApiErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ReportSummaryApiErrorDtoCopyWith<$Res>
    implements $ReportSummaryApiErrorDtoCopyWith<$Res> {
  factory _$ReportSummaryApiErrorDtoCopyWith(_ReportSummaryApiErrorDto value,
          $Res Function(_ReportSummaryApiErrorDto) _then) =
      __$ReportSummaryApiErrorDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class __$ReportSummaryApiErrorDtoCopyWithImpl<$Res>
    implements _$ReportSummaryApiErrorDtoCopyWith<$Res> {
  __$ReportSummaryApiErrorDtoCopyWithImpl(this._self, this._then);

  final _ReportSummaryApiErrorDto _self;
  final $Res Function(_ReportSummaryApiErrorDto) _then;

  /// Create a copy of ReportSummaryApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_ReportSummaryApiErrorDto(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
