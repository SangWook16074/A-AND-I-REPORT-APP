// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivateRequestDto {
  /// 초대 링크의 1회성 활성화 토큰
  String get token;

  /// 사용자가 설정할 최초 비밀번호
  String get password;

  /// Create a copy of ActivateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateRequestDtoCopyWith<ActivateRequestDto> get copyWith =>
      _$ActivateRequestDtoCopyWithImpl<ActivateRequestDto>(
          this as ActivateRequestDto, _$identity);

  /// Serializes this ActivateRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateRequestDto &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, password);

  @override
  String toString() {
    return 'ActivateRequestDto(token: $token, password: $password)';
  }
}

/// @nodoc
abstract mixin class $ActivateRequestDtoCopyWith<$Res> {
  factory $ActivateRequestDtoCopyWith(
          ActivateRequestDto value, $Res Function(ActivateRequestDto) _then) =
      _$ActivateRequestDtoCopyWithImpl;
  @useResult
  $Res call({String token, String password});
}

/// @nodoc
class _$ActivateRequestDtoCopyWithImpl<$Res>
    implements $ActivateRequestDtoCopyWith<$Res> {
  _$ActivateRequestDtoCopyWithImpl(this._self, this._then);

  final ActivateRequestDto _self;
  final $Res Function(ActivateRequestDto) _then;

  /// Create a copy of ActivateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ActivateRequestDto].
extension ActivateRequestDtoPatterns on ActivateRequestDto {
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
    TResult Function(_ActivateRequestDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateRequestDto() when $default != null:
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
    TResult Function(_ActivateRequestDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateRequestDto():
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
    TResult? Function(_ActivateRequestDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateRequestDto() when $default != null:
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
    TResult Function(String token, String password)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateRequestDto() when $default != null:
        return $default(_that.token, _that.password);
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
    TResult Function(String token, String password) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateRequestDto():
        return $default(_that.token, _that.password);
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
    TResult? Function(String token, String password)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateRequestDto() when $default != null:
        return $default(_that.token, _that.password);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ActivateRequestDto implements ActivateRequestDto {
  const _ActivateRequestDto({required this.token, required this.password});
  factory _ActivateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateRequestDtoFromJson(json);

  /// 초대 링크의 1회성 활성화 토큰
  @override
  final String token;

  /// 사용자가 설정할 최초 비밀번호
  @override
  final String password;

  /// Create a copy of ActivateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivateRequestDtoCopyWith<_ActivateRequestDto> get copyWith =>
      __$ActivateRequestDtoCopyWithImpl<_ActivateRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActivateRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivateRequestDto &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, password);

  @override
  String toString() {
    return 'ActivateRequestDto(token: $token, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$ActivateRequestDtoCopyWith<$Res>
    implements $ActivateRequestDtoCopyWith<$Res> {
  factory _$ActivateRequestDtoCopyWith(
          _ActivateRequestDto value, $Res Function(_ActivateRequestDto) _then) =
      __$ActivateRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String token, String password});
}

/// @nodoc
class __$ActivateRequestDtoCopyWithImpl<$Res>
    implements _$ActivateRequestDtoCopyWith<$Res> {
  __$ActivateRequestDtoCopyWithImpl(this._self, this._then);

  final _ActivateRequestDto _self;
  final $Res Function(_ActivateRequestDto) _then;

  /// Create a copy of ActivateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? password = null,
  }) {
    return _then(_ActivateRequestDto(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
