// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivateState {
  String? get token;
  String get username;
  String get newPassword;
  String get confirmPassword;
  ActivateSubmitStatus get submitStatus;
  String? get usernameError;
  String? get newPasswordError;
  String? get confirmPasswordError;
  String? get submitError;

  /// Create a copy of ActivateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateStateCopyWith<ActivateState> get copyWith =>
      _$ActivateStateCopyWithImpl<ActivateState>(
          this as ActivateState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateState &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.submitStatus, submitStatus) ||
                other.submitStatus == submitStatus) &&
            (identical(other.usernameError, usernameError) ||
                other.usernameError == usernameError) &&
            (identical(other.newPasswordError, newPasswordError) ||
                other.newPasswordError == newPasswordError) &&
            (identical(other.confirmPasswordError, confirmPasswordError) ||
                other.confirmPasswordError == confirmPasswordError) &&
            (identical(other.submitError, submitError) ||
                other.submitError == submitError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      token,
      username,
      newPassword,
      confirmPassword,
      submitStatus,
      usernameError,
      newPasswordError,
      confirmPasswordError,
      submitError);

  @override
  String toString() {
    return 'ActivateState(token: $token, username: $username, newPassword: $newPassword, confirmPassword: $confirmPassword, submitStatus: $submitStatus, usernameError: $usernameError, newPasswordError: $newPasswordError, confirmPasswordError: $confirmPasswordError, submitError: $submitError)';
  }
}

/// @nodoc
abstract mixin class $ActivateStateCopyWith<$Res> {
  factory $ActivateStateCopyWith(
          ActivateState value, $Res Function(ActivateState) _then) =
      _$ActivateStateCopyWithImpl;
  @useResult
  $Res call(
      {String? token,
      String username,
      String newPassword,
      String confirmPassword,
      ActivateSubmitStatus submitStatus,
      String? usernameError,
      String? newPasswordError,
      String? confirmPasswordError,
      String? submitError});
}

/// @nodoc
class _$ActivateStateCopyWithImpl<$Res>
    implements $ActivateStateCopyWith<$Res> {
  _$ActivateStateCopyWithImpl(this._self, this._then);

  final ActivateState _self;
  final $Res Function(ActivateState) _then;

  /// Create a copy of ActivateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? username = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? submitStatus = null,
    Object? usernameError = freezed,
    Object? newPasswordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? submitError = freezed,
  }) {
    return _then(_self.copyWith(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      submitStatus: null == submitStatus
          ? _self.submitStatus
          : submitStatus // ignore: cast_nullable_to_non_nullable
              as ActivateSubmitStatus,
      usernameError: freezed == usernameError
          ? _self.usernameError
          : usernameError // ignore: cast_nullable_to_non_nullable
              as String?,
      newPasswordError: freezed == newPasswordError
          ? _self.newPasswordError
          : newPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _self.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      submitError: freezed == submitError
          ? _self.submitError
          : submitError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ActivateState].
extension ActivateStatePatterns on ActivateState {
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
    TResult Function(_ActivateState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateState() when $default != null:
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
    TResult Function(_ActivateState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateState():
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
    TResult? Function(_ActivateState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateState() when $default != null:
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
    TResult Function(
            String? token,
            String username,
            String newPassword,
            String confirmPassword,
            ActivateSubmitStatus submitStatus,
            String? usernameError,
            String? newPasswordError,
            String? confirmPasswordError,
            String? submitError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateState() when $default != null:
        return $default(
            _that.token,
            _that.username,
            _that.newPassword,
            _that.confirmPassword,
            _that.submitStatus,
            _that.usernameError,
            _that.newPasswordError,
            _that.confirmPasswordError,
            _that.submitError);
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
    TResult Function(
            String? token,
            String username,
            String newPassword,
            String confirmPassword,
            ActivateSubmitStatus submitStatus,
            String? usernameError,
            String? newPasswordError,
            String? confirmPasswordError,
            String? submitError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateState():
        return $default(
            _that.token,
            _that.username,
            _that.newPassword,
            _that.confirmPassword,
            _that.submitStatus,
            _that.usernameError,
            _that.newPasswordError,
            _that.confirmPasswordError,
            _that.submitError);
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
    TResult? Function(
            String? token,
            String username,
            String newPassword,
            String confirmPassword,
            ActivateSubmitStatus submitStatus,
            String? usernameError,
            String? newPasswordError,
            String? confirmPasswordError,
            String? submitError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateState() when $default != null:
        return $default(
            _that.token,
            _that.username,
            _that.newPassword,
            _that.confirmPassword,
            _that.submitStatus,
            _that.usernameError,
            _that.newPasswordError,
            _that.confirmPasswordError,
            _that.submitError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ActivateState extends ActivateState {
  const _ActivateState(
      {required this.token,
      required this.username,
      required this.newPassword,
      required this.confirmPassword,
      required this.submitStatus,
      required this.usernameError,
      required this.newPasswordError,
      required this.confirmPasswordError,
      required this.submitError})
      : super._();

  @override
  final String? token;
  @override
  final String username;
  @override
  final String newPassword;
  @override
  final String confirmPassword;
  @override
  final ActivateSubmitStatus submitStatus;
  @override
  final String? usernameError;
  @override
  final String? newPasswordError;
  @override
  final String? confirmPasswordError;
  @override
  final String? submitError;

  /// Create a copy of ActivateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivateStateCopyWith<_ActivateState> get copyWith =>
      __$ActivateStateCopyWithImpl<_ActivateState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivateState &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.submitStatus, submitStatus) ||
                other.submitStatus == submitStatus) &&
            (identical(other.usernameError, usernameError) ||
                other.usernameError == usernameError) &&
            (identical(other.newPasswordError, newPasswordError) ||
                other.newPasswordError == newPasswordError) &&
            (identical(other.confirmPasswordError, confirmPasswordError) ||
                other.confirmPasswordError == confirmPasswordError) &&
            (identical(other.submitError, submitError) ||
                other.submitError == submitError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      token,
      username,
      newPassword,
      confirmPassword,
      submitStatus,
      usernameError,
      newPasswordError,
      confirmPasswordError,
      submitError);

  @override
  String toString() {
    return 'ActivateState(token: $token, username: $username, newPassword: $newPassword, confirmPassword: $confirmPassword, submitStatus: $submitStatus, usernameError: $usernameError, newPasswordError: $newPasswordError, confirmPasswordError: $confirmPasswordError, submitError: $submitError)';
  }
}

/// @nodoc
abstract mixin class _$ActivateStateCopyWith<$Res>
    implements $ActivateStateCopyWith<$Res> {
  factory _$ActivateStateCopyWith(
          _ActivateState value, $Res Function(_ActivateState) _then) =
      __$ActivateStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? token,
      String username,
      String newPassword,
      String confirmPassword,
      ActivateSubmitStatus submitStatus,
      String? usernameError,
      String? newPasswordError,
      String? confirmPasswordError,
      String? submitError});
}

/// @nodoc
class __$ActivateStateCopyWithImpl<$Res>
    implements _$ActivateStateCopyWith<$Res> {
  __$ActivateStateCopyWithImpl(this._self, this._then);

  final _ActivateState _self;
  final $Res Function(_ActivateState) _then;

  /// Create a copy of ActivateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = freezed,
    Object? username = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? submitStatus = null,
    Object? usernameError = freezed,
    Object? newPasswordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? submitError = freezed,
  }) {
    return _then(_ActivateState(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      submitStatus: null == submitStatus
          ? _self.submitStatus
          : submitStatus // ignore: cast_nullable_to_non_nullable
              as ActivateSubmitStatus,
      usernameError: freezed == usernameError
          ? _self.usernameError
          : usernameError // ignore: cast_nullable_to_non_nullable
              as String?,
      newPasswordError: freezed == newPasswordError
          ? _self.newPasswordError
          : newPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _self.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      submitError: freezed == submitError
          ? _self.submitError
          : submitError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
