// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivateResponseDto {
  /// API 호출 성공 여부
  bool get success;

  /// 내부 data.success 값
  ActivateResponseDataDto? get data;
  ActivateErrorDto? get error;
  String? get timestamp;

  /// Create a copy of ActivateResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateResponseDtoCopyWith<ActivateResponseDto> get copyWith =>
      _$ActivateResponseDtoCopyWithImpl<ActivateResponseDto>(
          this as ActivateResponseDto, _$identity);

  /// Serializes this ActivateResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateResponseDto &&
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
    return 'ActivateResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $ActivateResponseDtoCopyWith<$Res> {
  factory $ActivateResponseDtoCopyWith(
          ActivateResponseDto value, $Res Function(ActivateResponseDto) _then) =
      _$ActivateResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      ActivateResponseDataDto? data,
      ActivateErrorDto? error,
      String? timestamp});

  $ActivateResponseDataDtoCopyWith<$Res>? get data;
  $ActivateErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class _$ActivateResponseDtoCopyWithImpl<$Res>
    implements $ActivateResponseDtoCopyWith<$Res> {
  _$ActivateResponseDtoCopyWithImpl(this._self, this._then);

  final ActivateResponseDto _self;
  final $Res Function(ActivateResponseDto) _then;

  /// Create a copy of ActivateResponseDto
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
              as ActivateResponseDataDto?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ActivateErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ActivateResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivateResponseDataDtoCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ActivateResponseDataDtoCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of ActivateResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivateErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ActivateErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ActivateResponseDto].
extension ActivateResponseDtoPatterns on ActivateResponseDto {
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
    TResult Function(_ActivateResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDto() when $default != null:
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
    TResult Function(_ActivateResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDto():
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
    TResult? Function(_ActivateResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDto() when $default != null:
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
    TResult Function(bool success, ActivateResponseDataDto? data,
            ActivateErrorDto? error, String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDto() when $default != null:
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
    TResult Function(bool success, ActivateResponseDataDto? data,
            ActivateErrorDto? error, String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDto():
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
    TResult? Function(bool success, ActivateResponseDataDto? data,
            ActivateErrorDto? error, String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ActivateResponseDto implements ActivateResponseDto {
  const _ActivateResponseDto(
      {required this.success, this.data, this.error, this.timestamp});
  factory _ActivateResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateResponseDtoFromJson(json);

  /// API 호출 성공 여부
  @override
  final bool success;

  /// 내부 data.success 값
  @override
  final ActivateResponseDataDto? data;
  @override
  final ActivateErrorDto? error;
  @override
  final String? timestamp;

  /// Create a copy of ActivateResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivateResponseDtoCopyWith<_ActivateResponseDto> get copyWith =>
      __$ActivateResponseDtoCopyWithImpl<_ActivateResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActivateResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivateResponseDto &&
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
    return 'ActivateResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$ActivateResponseDtoCopyWith<$Res>
    implements $ActivateResponseDtoCopyWith<$Res> {
  factory _$ActivateResponseDtoCopyWith(_ActivateResponseDto value,
          $Res Function(_ActivateResponseDto) _then) =
      __$ActivateResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      ActivateResponseDataDto? data,
      ActivateErrorDto? error,
      String? timestamp});

  @override
  $ActivateResponseDataDtoCopyWith<$Res>? get data;
  @override
  $ActivateErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class __$ActivateResponseDtoCopyWithImpl<$Res>
    implements _$ActivateResponseDtoCopyWith<$Res> {
  __$ActivateResponseDtoCopyWithImpl(this._self, this._then);

  final _ActivateResponseDto _self;
  final $Res Function(_ActivateResponseDto) _then;

  /// Create a copy of ActivateResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_ActivateResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ActivateResponseDataDto?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ActivateErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ActivateResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivateResponseDataDtoCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ActivateResponseDataDtoCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of ActivateResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivateErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ActivateErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$ActivateResponseDataDto {
  bool get success;

  /// Create a copy of ActivateResponseDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateResponseDataDtoCopyWith<ActivateResponseDataDto> get copyWith =>
      _$ActivateResponseDataDtoCopyWithImpl<ActivateResponseDataDto>(
          this as ActivateResponseDataDto, _$identity);

  /// Serializes this ActivateResponseDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateResponseDataDto &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @override
  String toString() {
    return 'ActivateResponseDataDto(success: $success)';
  }
}

/// @nodoc
abstract mixin class $ActivateResponseDataDtoCopyWith<$Res> {
  factory $ActivateResponseDataDtoCopyWith(ActivateResponseDataDto value,
          $Res Function(ActivateResponseDataDto) _then) =
      _$ActivateResponseDataDtoCopyWithImpl;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$ActivateResponseDataDtoCopyWithImpl<$Res>
    implements $ActivateResponseDataDtoCopyWith<$Res> {
  _$ActivateResponseDataDtoCopyWithImpl(this._self, this._then);

  final ActivateResponseDataDto _self;
  final $Res Function(ActivateResponseDataDto) _then;

  /// Create a copy of ActivateResponseDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ActivateResponseDataDto].
extension ActivateResponseDataDtoPatterns on ActivateResponseDataDto {
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
    TResult Function(_ActivateResponseDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDataDto() when $default != null:
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
    TResult Function(_ActivateResponseDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDataDto():
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
    TResult? Function(_ActivateResponseDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDataDto() when $default != null:
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
    TResult Function(bool success)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDataDto() when $default != null:
        return $default(_that.success);
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
    TResult Function(bool success) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDataDto():
        return $default(_that.success);
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
    TResult? Function(bool success)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateResponseDataDto() when $default != null:
        return $default(_that.success);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ActivateResponseDataDto implements ActivateResponseDataDto {
  const _ActivateResponseDataDto({this.success = false});
  factory _ActivateResponseDataDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateResponseDataDtoFromJson(json);

  @override
  @JsonKey()
  final bool success;

  /// Create a copy of ActivateResponseDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivateResponseDataDtoCopyWith<_ActivateResponseDataDto> get copyWith =>
      __$ActivateResponseDataDtoCopyWithImpl<_ActivateResponseDataDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActivateResponseDataDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivateResponseDataDto &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @override
  String toString() {
    return 'ActivateResponseDataDto(success: $success)';
  }
}

/// @nodoc
abstract mixin class _$ActivateResponseDataDtoCopyWith<$Res>
    implements $ActivateResponseDataDtoCopyWith<$Res> {
  factory _$ActivateResponseDataDtoCopyWith(_ActivateResponseDataDto value,
          $Res Function(_ActivateResponseDataDto) _then) =
      __$ActivateResponseDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$ActivateResponseDataDtoCopyWithImpl<$Res>
    implements _$ActivateResponseDataDtoCopyWith<$Res> {
  __$ActivateResponseDataDtoCopyWithImpl(this._self, this._then);

  final _ActivateResponseDataDto _self;
  final $Res Function(_ActivateResponseDataDto) _then;

  /// Create a copy of ActivateResponseDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
  }) {
    return _then(_ActivateResponseDataDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ActivateErrorDto {
  String? get code;
  String? get message;

  /// Create a copy of ActivateErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateErrorDtoCopyWith<ActivateErrorDto> get copyWith =>
      _$ActivateErrorDtoCopyWithImpl<ActivateErrorDto>(
          this as ActivateErrorDto, _$identity);

  /// Serializes this ActivateErrorDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ActivateErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ActivateErrorDtoCopyWith<$Res> {
  factory $ActivateErrorDtoCopyWith(
          ActivateErrorDto value, $Res Function(ActivateErrorDto) _then) =
      _$ActivateErrorDtoCopyWithImpl;
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class _$ActivateErrorDtoCopyWithImpl<$Res>
    implements $ActivateErrorDtoCopyWith<$Res> {
  _$ActivateErrorDtoCopyWithImpl(this._self, this._then);

  final ActivateErrorDto _self;
  final $Res Function(ActivateErrorDto) _then;

  /// Create a copy of ActivateErrorDto
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

/// Adds pattern-matching-related methods to [ActivateErrorDto].
extension ActivateErrorDtoPatterns on ActivateErrorDto {
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
    TResult Function(_ActivateErrorDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateErrorDto() when $default != null:
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
    TResult Function(_ActivateErrorDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateErrorDto():
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
    TResult? Function(_ActivateErrorDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateErrorDto() when $default != null:
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
      case _ActivateErrorDto() when $default != null:
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
      case _ActivateErrorDto():
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
      case _ActivateErrorDto() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ActivateErrorDto implements ActivateErrorDto {
  const _ActivateErrorDto({this.code, this.message});
  factory _ActivateErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateErrorDtoFromJson(json);

  @override
  final String? code;
  @override
  final String? message;

  /// Create a copy of ActivateErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivateErrorDtoCopyWith<_ActivateErrorDto> get copyWith =>
      __$ActivateErrorDtoCopyWithImpl<_ActivateErrorDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActivateErrorDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivateErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ActivateErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ActivateErrorDtoCopyWith<$Res>
    implements $ActivateErrorDtoCopyWith<$Res> {
  factory _$ActivateErrorDtoCopyWith(
          _ActivateErrorDto value, $Res Function(_ActivateErrorDto) _then) =
      __$ActivateErrorDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class __$ActivateErrorDtoCopyWithImpl<$Res>
    implements _$ActivateErrorDtoCopyWith<$Res> {
  __$ActivateErrorDtoCopyWithImpl(this._self, this._then);

  final _ActivateErrorDto _self;
  final $Res Function(_ActivateErrorDto) _then;

  /// Create a copy of ActivateErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_ActivateErrorDto(
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
