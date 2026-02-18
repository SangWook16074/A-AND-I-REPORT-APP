// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponseDto {
  bool get success;
  LoginDataDto? get data;
  ApiErrorDto? get error;
  String? get timestamp;

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginResponseDtoCopyWith<LoginResponseDto> get copyWith =>
      _$LoginResponseDtoCopyWithImpl<LoginResponseDto>(
          this as LoginResponseDto, _$identity);

  /// Serializes this LoginResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginResponseDto &&
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
    return 'LoginResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $LoginResponseDtoCopyWith<$Res> {
  factory $LoginResponseDtoCopyWith(
          LoginResponseDto value, $Res Function(LoginResponseDto) _then) =
      _$LoginResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      LoginDataDto? data,
      ApiErrorDto? error,
      String? timestamp});

  $LoginDataDtoCopyWith<$Res>? get data;
  $ApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class _$LoginResponseDtoCopyWithImpl<$Res>
    implements $LoginResponseDtoCopyWith<$Res> {
  _$LoginResponseDtoCopyWithImpl(this._self, this._then);

  final LoginResponseDto _self;
  final $Res Function(LoginResponseDto) _then;

  /// Create a copy of LoginResponseDto
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
              as LoginDataDto?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginDataDtoCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $LoginDataDtoCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LoginResponseDto].
extension LoginResponseDtoPatterns on LoginResponseDto {
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
    TResult Function(_LoginResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginResponseDto() when $default != null:
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
    TResult Function(_LoginResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseDto():
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
    TResult? Function(_LoginResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseDto() when $default != null:
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
    TResult Function(bool success, LoginDataDto? data, ApiErrorDto? error,
            String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginResponseDto() when $default != null:
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
    TResult Function(bool success, LoginDataDto? data, ApiErrorDto? error,
            String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseDto():
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
    TResult? Function(bool success, LoginDataDto? data, ApiErrorDto? error,
            String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginResponseDto implements LoginResponseDto {
  const _LoginResponseDto(
      {required this.success, this.data, this.error, this.timestamp});
  factory _LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  @override
  final bool success;
  @override
  final LoginDataDto? data;
  @override
  final ApiErrorDto? error;
  @override
  final String? timestamp;

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginResponseDtoCopyWith<_LoginResponseDto> get copyWith =>
      __$LoginResponseDtoCopyWithImpl<_LoginResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginResponseDto &&
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
    return 'LoginResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$LoginResponseDtoCopyWith<$Res>
    implements $LoginResponseDtoCopyWith<$Res> {
  factory _$LoginResponseDtoCopyWith(
          _LoginResponseDto value, $Res Function(_LoginResponseDto) _then) =
      __$LoginResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      LoginDataDto? data,
      ApiErrorDto? error,
      String? timestamp});

  @override
  $LoginDataDtoCopyWith<$Res>? get data;
  @override
  $ApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class __$LoginResponseDtoCopyWithImpl<$Res>
    implements _$LoginResponseDtoCopyWith<$Res> {
  __$LoginResponseDtoCopyWithImpl(this._self, this._then);

  final _LoginResponseDto _self;
  final $Res Function(_LoginResponseDto) _then;

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_LoginResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginDataDto?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginDataDtoCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $LoginDataDtoCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$LoginDataDto {
  String get accessToken;
  String get refreshToken;
  int get expiresIn;
  String get tokenType;
  bool get forcePasswordChange;
  LoginUserDto get user;

  /// Create a copy of LoginDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginDataDtoCopyWith<LoginDataDto> get copyWith =>
      _$LoginDataDtoCopyWithImpl<LoginDataDto>(
          this as LoginDataDto, _$identity);

  /// Serializes this LoginDataDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginDataDto &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.forcePasswordChange, forcePasswordChange) ||
                other.forcePasswordChange == forcePasswordChange) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      expiresIn, tokenType, forcePasswordChange, user);

  @override
  String toString() {
    return 'LoginDataDto(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, tokenType: $tokenType, forcePasswordChange: $forcePasswordChange, user: $user)';
  }
}

/// @nodoc
abstract mixin class $LoginDataDtoCopyWith<$Res> {
  factory $LoginDataDtoCopyWith(
          LoginDataDto value, $Res Function(LoginDataDto) _then) =
      _$LoginDataDtoCopyWithImpl;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int expiresIn,
      String tokenType,
      bool forcePasswordChange,
      LoginUserDto user});

  $LoginUserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginDataDtoCopyWithImpl<$Res> implements $LoginDataDtoCopyWith<$Res> {
  _$LoginDataDtoCopyWithImpl(this._self, this._then);

  final LoginDataDto _self;
  final $Res Function(LoginDataDto) _then;

  /// Create a copy of LoginDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? tokenType = null,
    Object? forcePasswordChange = null,
    Object? user = null,
  }) {
    return _then(_self.copyWith(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      tokenType: null == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      forcePasswordChange: null == forcePasswordChange
          ? _self.forcePasswordChange
          : forcePasswordChange // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginUserDto,
    ));
  }

  /// Create a copy of LoginDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginUserDtoCopyWith<$Res> get user {
    return $LoginUserDtoCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LoginDataDto].
extension LoginDataDtoPatterns on LoginDataDto {
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
    TResult Function(_LoginDataDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginDataDto() when $default != null:
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
    TResult Function(_LoginDataDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginDataDto():
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
    TResult? Function(_LoginDataDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginDataDto() when $default != null:
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
    TResult Function(String accessToken, String refreshToken, int expiresIn,
            String tokenType, bool forcePasswordChange, LoginUserDto user)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginDataDto() when $default != null:
        return $default(_that.accessToken, _that.refreshToken, _that.expiresIn,
            _that.tokenType, _that.forcePasswordChange, _that.user);
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
    TResult Function(String accessToken, String refreshToken, int expiresIn,
            String tokenType, bool forcePasswordChange, LoginUserDto user)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginDataDto():
        return $default(_that.accessToken, _that.refreshToken, _that.expiresIn,
            _that.tokenType, _that.forcePasswordChange, _that.user);
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
    TResult? Function(String accessToken, String refreshToken, int expiresIn,
            String tokenType, bool forcePasswordChange, LoginUserDto user)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginDataDto() when $default != null:
        return $default(_that.accessToken, _that.refreshToken, _that.expiresIn,
            _that.tokenType, _that.forcePasswordChange, _that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginDataDto implements LoginDataDto {
  const _LoginDataDto(
      {required this.accessToken,
      required this.refreshToken,
      required this.expiresIn,
      required this.tokenType,
      required this.forcePasswordChange,
      required this.user});
  factory _LoginDataDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDataDtoFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final int expiresIn;
  @override
  final String tokenType;
  @override
  final bool forcePasswordChange;
  @override
  final LoginUserDto user;

  /// Create a copy of LoginDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginDataDtoCopyWith<_LoginDataDto> get copyWith =>
      __$LoginDataDtoCopyWithImpl<_LoginDataDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginDataDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginDataDto &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.forcePasswordChange, forcePasswordChange) ||
                other.forcePasswordChange == forcePasswordChange) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      expiresIn, tokenType, forcePasswordChange, user);

  @override
  String toString() {
    return 'LoginDataDto(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, tokenType: $tokenType, forcePasswordChange: $forcePasswordChange, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$LoginDataDtoCopyWith<$Res>
    implements $LoginDataDtoCopyWith<$Res> {
  factory _$LoginDataDtoCopyWith(
          _LoginDataDto value, $Res Function(_LoginDataDto) _then) =
      __$LoginDataDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int expiresIn,
      String tokenType,
      bool forcePasswordChange,
      LoginUserDto user});

  @override
  $LoginUserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$LoginDataDtoCopyWithImpl<$Res>
    implements _$LoginDataDtoCopyWith<$Res> {
  __$LoginDataDtoCopyWithImpl(this._self, this._then);

  final _LoginDataDto _self;
  final $Res Function(_LoginDataDto) _then;

  /// Create a copy of LoginDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? tokenType = null,
    Object? forcePasswordChange = null,
    Object? user = null,
  }) {
    return _then(_LoginDataDto(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      tokenType: null == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      forcePasswordChange: null == forcePasswordChange
          ? _self.forcePasswordChange
          : forcePasswordChange // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginUserDto,
    ));
  }

  /// Create a copy of LoginDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginUserDtoCopyWith<$Res> get user {
    return $LoginUserDtoCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
mixin _$LoginUserDto {
  String get id;
  String get username;
  String get role;

  /// Create a copy of LoginUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginUserDtoCopyWith<LoginUserDto> get copyWith =>
      _$LoginUserDtoCopyWithImpl<LoginUserDto>(
          this as LoginUserDto, _$identity);

  /// Serializes this LoginUserDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginUserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, role);

  @override
  String toString() {
    return 'LoginUserDto(id: $id, username: $username, role: $role)';
  }
}

/// @nodoc
abstract mixin class $LoginUserDtoCopyWith<$Res> {
  factory $LoginUserDtoCopyWith(
          LoginUserDto value, $Res Function(LoginUserDto) _then) =
      _$LoginUserDtoCopyWithImpl;
  @useResult
  $Res call({String id, String username, String role});
}

/// @nodoc
class _$LoginUserDtoCopyWithImpl<$Res> implements $LoginUserDtoCopyWith<$Res> {
  _$LoginUserDtoCopyWithImpl(this._self, this._then);

  final LoginUserDto _self;
  final $Res Function(LoginUserDto) _then;

  /// Create a copy of LoginUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? role = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [LoginUserDto].
extension LoginUserDtoPatterns on LoginUserDto {
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
    TResult Function(_LoginUserDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginUserDto() when $default != null:
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
    TResult Function(_LoginUserDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginUserDto():
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
    TResult? Function(_LoginUserDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginUserDto() when $default != null:
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
    TResult Function(String id, String username, String role)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginUserDto() when $default != null:
        return $default(_that.id, _that.username, _that.role);
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
    TResult Function(String id, String username, String role) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginUserDto():
        return $default(_that.id, _that.username, _that.role);
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
    TResult? Function(String id, String username, String role)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginUserDto() when $default != null:
        return $default(_that.id, _that.username, _that.role);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginUserDto implements LoginUserDto {
  const _LoginUserDto(
      {required this.id, required this.username, required this.role});
  factory _LoginUserDto.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDtoFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String role;

  /// Create a copy of LoginUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginUserDtoCopyWith<_LoginUserDto> get copyWith =>
      __$LoginUserDtoCopyWithImpl<_LoginUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginUserDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginUserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, role);

  @override
  String toString() {
    return 'LoginUserDto(id: $id, username: $username, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$LoginUserDtoCopyWith<$Res>
    implements $LoginUserDtoCopyWith<$Res> {
  factory _$LoginUserDtoCopyWith(
          _LoginUserDto value, $Res Function(_LoginUserDto) _then) =
      __$LoginUserDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String username, String role});
}

/// @nodoc
class __$LoginUserDtoCopyWithImpl<$Res>
    implements _$LoginUserDtoCopyWith<$Res> {
  __$LoginUserDtoCopyWithImpl(this._self, this._then);

  final _LoginUserDto _self;
  final $Res Function(_LoginUserDto) _then;

  /// Create a copy of LoginUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? role = null,
  }) {
    return _then(_LoginUserDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ApiErrorDto {
  String? get code;
  String? get message;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiErrorDtoCopyWith<ApiErrorDto> get copyWith =>
      _$ApiErrorDtoCopyWithImpl<ApiErrorDto>(this as ApiErrorDto, _$identity);

  /// Serializes this ApiErrorDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ApiErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ApiErrorDtoCopyWith<$Res> {
  factory $ApiErrorDtoCopyWith(
          ApiErrorDto value, $Res Function(ApiErrorDto) _then) =
      _$ApiErrorDtoCopyWithImpl;
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class _$ApiErrorDtoCopyWithImpl<$Res> implements $ApiErrorDtoCopyWith<$Res> {
  _$ApiErrorDtoCopyWithImpl(this._self, this._then);

  final ApiErrorDto _self;
  final $Res Function(ApiErrorDto) _then;

  /// Create a copy of ApiErrorDto
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

/// Adds pattern-matching-related methods to [ApiErrorDto].
extension ApiErrorDtoPatterns on ApiErrorDto {
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
    TResult Function(_ApiErrorDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto() when $default != null:
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
    TResult Function(_ApiErrorDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto():
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
    TResult? Function(_ApiErrorDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto() when $default != null:
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
      case _ApiErrorDto() when $default != null:
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
      case _ApiErrorDto():
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
      case _ApiErrorDto() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ApiErrorDto implements ApiErrorDto {
  const _ApiErrorDto({this.code, this.message});
  factory _ApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDtoFromJson(json);

  @override
  final String? code;
  @override
  final String? message;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApiErrorDtoCopyWith<_ApiErrorDto> get copyWith =>
      __$ApiErrorDtoCopyWithImpl<_ApiErrorDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ApiErrorDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ApiErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ApiErrorDtoCopyWith<$Res>
    implements $ApiErrorDtoCopyWith<$Res> {
  factory _$ApiErrorDtoCopyWith(
          _ApiErrorDto value, $Res Function(_ApiErrorDto) _then) =
      __$ApiErrorDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class __$ApiErrorDtoCopyWithImpl<$Res> implements _$ApiErrorDtoCopyWith<$Res> {
  __$ApiErrorDtoCopyWithImpl(this._self, this._then);

  final _ApiErrorDto _self;
  final $Res Function(_ApiErrorDto) _then;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_ApiErrorDto(
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
