// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportDetailResponseDto {
  bool get success;
  Report? get data;
  ReportDetailApiErrorDto? get error;
  String? get timestamp;

  /// Create a copy of ReportDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportDetailResponseDtoCopyWith<ReportDetailResponseDto> get copyWith =>
      _$ReportDetailResponseDtoCopyWithImpl<ReportDetailResponseDto>(
          this as ReportDetailResponseDto, _$identity);

  /// Serializes this ReportDetailResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportDetailResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, error, timestamp);

  @override
  String toString() {
    return 'ReportDetailResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $ReportDetailResponseDtoCopyWith<$Res> {
  factory $ReportDetailResponseDtoCopyWith(ReportDetailResponseDto value,
          $Res Function(ReportDetailResponseDto) _then) =
      _$ReportDetailResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      Report? data,
      ReportDetailApiErrorDto? error,
      String? timestamp});

  $ReportCopyWith<$Res>? get data;
  $ReportDetailApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class _$ReportDetailResponseDtoCopyWithImpl<$Res>
    implements $ReportDetailResponseDtoCopyWith<$Res> {
  _$ReportDetailResponseDtoCopyWithImpl(this._self, this._then);

  final ReportDetailResponseDto _self;
  final $Res Function(ReportDetailResponseDto) _then;

  /// Create a copy of ReportDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Report?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ReportDetailApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ReportDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ReportCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of ReportDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportDetailApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ReportDetailApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReportDetailResponseDto].
extension ReportDetailResponseDtoPatterns on ReportDetailResponseDto {
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
    TResult Function(_ReportDetailResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportDetailResponseDto() when $default != null:
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
    TResult Function(_ReportDetailResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportDetailResponseDto():
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
    TResult? Function(_ReportDetailResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportDetailResponseDto() when $default != null:
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
    TResult Function(bool success, Report? data, ReportDetailApiErrorDto? error,
            String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportDetailResponseDto() when $default != null:
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
    TResult Function(bool success, Report? data, ReportDetailApiErrorDto? error,
            String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportDetailResponseDto():
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
    TResult? Function(bool success, Report? data,
            ReportDetailApiErrorDto? error, String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportDetailResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReportDetailResponseDto implements ReportDetailResponseDto {
  const _ReportDetailResponseDto(
      {required this.success, this.data, this.error, this.timestamp});
  factory _ReportDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailResponseDtoFromJson(json);

  @override
  final bool success;
  @override
  final Report? data;
  @override
  final ReportDetailApiErrorDto? error;
  @override
  final String? timestamp;

  /// Create a copy of ReportDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportDetailResponseDtoCopyWith<_ReportDetailResponseDto> get copyWith =>
      __$ReportDetailResponseDtoCopyWithImpl<_ReportDetailResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportDetailResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportDetailResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, error, timestamp);

  @override
  String toString() {
    return 'ReportDetailResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$ReportDetailResponseDtoCopyWith<$Res>
    implements $ReportDetailResponseDtoCopyWith<$Res> {
  factory _$ReportDetailResponseDtoCopyWith(_ReportDetailResponseDto value,
          $Res Function(_ReportDetailResponseDto) _then) =
      __$ReportDetailResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      Report? data,
      ReportDetailApiErrorDto? error,
      String? timestamp});

  @override
  $ReportCopyWith<$Res>? get data;
  @override
  $ReportDetailApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class __$ReportDetailResponseDtoCopyWithImpl<$Res>
    implements _$ReportDetailResponseDtoCopyWith<$Res> {
  __$ReportDetailResponseDtoCopyWithImpl(this._self, this._then);

  final _ReportDetailResponseDto _self;
  final $Res Function(_ReportDetailResponseDto) _then;

  /// Create a copy of ReportDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_ReportDetailResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Report?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ReportDetailApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ReportDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ReportCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of ReportDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportDetailApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ReportDetailApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$ReportDetailApiErrorDto {
  String? get code;
  String? get message;

  /// Create a copy of ReportDetailApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportDetailApiErrorDtoCopyWith<ReportDetailApiErrorDto> get copyWith =>
      _$ReportDetailApiErrorDtoCopyWithImpl<ReportDetailApiErrorDto>(
          this as ReportDetailApiErrorDto, _$identity);

  /// Serializes this ReportDetailApiErrorDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportDetailApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ReportDetailApiErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ReportDetailApiErrorDtoCopyWith<$Res> {
  factory $ReportDetailApiErrorDtoCopyWith(ReportDetailApiErrorDto value,
          $Res Function(ReportDetailApiErrorDto) _then) =
      _$ReportDetailApiErrorDtoCopyWithImpl;
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class _$ReportDetailApiErrorDtoCopyWithImpl<$Res>
    implements $ReportDetailApiErrorDtoCopyWith<$Res> {
  _$ReportDetailApiErrorDtoCopyWithImpl(this._self, this._then);

  final ReportDetailApiErrorDto _self;
  final $Res Function(ReportDetailApiErrorDto) _then;

  /// Create a copy of ReportDetailApiErrorDto
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

/// Adds pattern-matching-related methods to [ReportDetailApiErrorDto].
extension ReportDetailApiErrorDtoPatterns on ReportDetailApiErrorDto {
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
    TResult Function(_ReportDetailApiErrorDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportDetailApiErrorDto() when $default != null:
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
    TResult Function(_ReportDetailApiErrorDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportDetailApiErrorDto():
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
    TResult? Function(_ReportDetailApiErrorDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportDetailApiErrorDto() when $default != null:
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
      case _ReportDetailApiErrorDto() when $default != null:
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
      case _ReportDetailApiErrorDto():
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
      case _ReportDetailApiErrorDto() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReportDetailApiErrorDto implements ReportDetailApiErrorDto {
  const _ReportDetailApiErrorDto({this.code, this.message});
  factory _ReportDetailApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailApiErrorDtoFromJson(json);

  @override
  final String? code;
  @override
  final String? message;

  /// Create a copy of ReportDetailApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportDetailApiErrorDtoCopyWith<_ReportDetailApiErrorDto> get copyWith =>
      __$ReportDetailApiErrorDtoCopyWithImpl<_ReportDetailApiErrorDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportDetailApiErrorDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportDetailApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ReportDetailApiErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ReportDetailApiErrorDtoCopyWith<$Res>
    implements $ReportDetailApiErrorDtoCopyWith<$Res> {
  factory _$ReportDetailApiErrorDtoCopyWith(_ReportDetailApiErrorDto value,
          $Res Function(_ReportDetailApiErrorDto) _then) =
      __$ReportDetailApiErrorDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class __$ReportDetailApiErrorDtoCopyWithImpl<$Res>
    implements _$ReportDetailApiErrorDtoCopyWith<$Res> {
  __$ReportDetailApiErrorDtoCopyWithImpl(this._self, this._then);

  final _ReportDetailApiErrorDto _self;
  final $Res Function(_ReportDetailApiErrorDto) _then;

  /// Create a copy of ReportDetailApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_ReportDetailApiErrorDto(
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
