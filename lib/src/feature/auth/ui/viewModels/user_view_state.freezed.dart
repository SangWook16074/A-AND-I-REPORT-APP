// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserViewState {
  UserStatus get status;
  User? get user;
  String? get role;
  String? get errorMsg;

  /// Create a copy of UserViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserViewStateCopyWith<UserViewState> get copyWith =>
      _$UserViewStateCopyWithImpl<UserViewState>(
          this as UserViewState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserViewState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user, role, errorMsg);

  @override
  String toString() {
    return 'UserViewState(status: $status, user: $user, role: $role, errorMsg: $errorMsg)';
  }
}

/// @nodoc
abstract mixin class $UserViewStateCopyWith<$Res> {
  factory $UserViewStateCopyWith(
          UserViewState value, $Res Function(UserViewState) _then) =
      _$UserViewStateCopyWithImpl;
  @useResult
  $Res call({UserStatus status, User? user, String? role, String? errorMsg});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserViewStateCopyWithImpl<$Res>
    implements $UserViewStateCopyWith<$Res> {
  _$UserViewStateCopyWithImpl(this._self, this._then);

  final UserViewState _self;
  final $Res Function(UserViewState) _then;

  /// Create a copy of UserViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? role = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMsg: freezed == errorMsg
          ? _self.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UserViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserViewState].
extension UserViewStatePatterns on UserViewState {
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
    TResult Function(_UserViewState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserViewState() when $default != null:
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
    TResult Function(_UserViewState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserViewState():
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
    TResult? Function(_UserViewState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserViewState() when $default != null:
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
            UserStatus status, User? user, String? role, String? errorMsg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserViewState() when $default != null:
        return $default(_that.status, _that.user, _that.role, _that.errorMsg);
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
            UserStatus status, User? user, String? role, String? errorMsg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserViewState():
        return $default(_that.status, _that.user, _that.role, _that.errorMsg);
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
            UserStatus status, User? user, String? role, String? errorMsg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserViewState() when $default != null:
        return $default(_that.status, _that.user, _that.role, _that.errorMsg);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserViewState implements UserViewState {
  const _UserViewState(
      {this.status = UserStatus.loading, this.user, this.role, this.errorMsg});

  @override
  @JsonKey()
  final UserStatus status;
  @override
  final User? user;
  @override
  final String? role;
  @override
  final String? errorMsg;

  /// Create a copy of UserViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserViewStateCopyWith<_UserViewState> get copyWith =>
      __$UserViewStateCopyWithImpl<_UserViewState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserViewState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user, role, errorMsg);

  @override
  String toString() {
    return 'UserViewState(status: $status, user: $user, role: $role, errorMsg: $errorMsg)';
  }
}

/// @nodoc
abstract mixin class _$UserViewStateCopyWith<$Res>
    implements $UserViewStateCopyWith<$Res> {
  factory _$UserViewStateCopyWith(
          _UserViewState value, $Res Function(_UserViewState) _then) =
      __$UserViewStateCopyWithImpl;
  @override
  @useResult
  $Res call({UserStatus status, User? user, String? role, String? errorMsg});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$UserViewStateCopyWithImpl<$Res>
    implements _$UserViewStateCopyWith<$Res> {
  __$UserViewStateCopyWithImpl(this._self, this._then);

  final _UserViewState _self;
  final $Res Function(_UserViewState) _then;

  /// Create a copy of UserViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? role = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_UserViewState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMsg: freezed == errorMsg
          ? _self.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UserViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
