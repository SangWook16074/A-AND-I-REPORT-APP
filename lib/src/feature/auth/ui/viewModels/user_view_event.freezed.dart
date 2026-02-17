// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_view_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserViewEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserViewEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserViewEvent()';
  }
}

/// @nodoc
class $UserViewEventCopyWith<$Res> {
  $UserViewEventCopyWith(UserViewEvent _, $Res Function(UserViewEvent) __);
}

/// Adds pattern-matching-related methods to [UserViewEvent].
extension UserViewEventPatterns on UserViewEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFromToken value)? syncFromToken,
    TResult Function(MyInfoFetched value)? myInfoFetched,
    TResult Function(ClearUser value)? clear,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SyncFromToken() when syncFromToken != null:
        return syncFromToken(_that);
      case MyInfoFetched() when myInfoFetched != null:
        return myInfoFetched(_that);
      case ClearUser() when clear != null:
        return clear(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFromToken value) syncFromToken,
    required TResult Function(MyInfoFetched value) myInfoFetched,
    required TResult Function(ClearUser value) clear,
  }) {
    final _that = this;
    switch (_that) {
      case SyncFromToken():
        return syncFromToken(_that);
      case MyInfoFetched():
        return myInfoFetched(_that);
      case ClearUser():
        return clear(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFromToken value)? syncFromToken,
    TResult? Function(MyInfoFetched value)? myInfoFetched,
    TResult? Function(ClearUser value)? clear,
  }) {
    final _that = this;
    switch (_that) {
      case SyncFromToken() when syncFromToken != null:
        return syncFromToken(_that);
      case MyInfoFetched() when myInfoFetched != null:
        return myInfoFetched(_that);
      case ClearUser() when clear != null:
        return clear(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? syncFromToken,
    TResult Function(User user)? myInfoFetched,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SyncFromToken() when syncFromToken != null:
        return syncFromToken();
      case MyInfoFetched() when myInfoFetched != null:
        return myInfoFetched(_that.user);
      case ClearUser() when clear != null:
        return clear();
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
  TResult when<TResult extends Object?>({
    required TResult Function() syncFromToken,
    required TResult Function(User user) myInfoFetched,
    required TResult Function() clear,
  }) {
    final _that = this;
    switch (_that) {
      case SyncFromToken():
        return syncFromToken();
      case MyInfoFetched():
        return myInfoFetched(_that.user);
      case ClearUser():
        return clear();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? syncFromToken,
    TResult? Function(User user)? myInfoFetched,
    TResult? Function()? clear,
  }) {
    final _that = this;
    switch (_that) {
      case SyncFromToken() when syncFromToken != null:
        return syncFromToken();
      case MyInfoFetched() when myInfoFetched != null:
        return myInfoFetched(_that.user);
      case ClearUser() when clear != null:
        return clear();
      case _:
        return null;
    }
  }
}

/// @nodoc

class SyncFromToken implements UserViewEvent {
  const SyncFromToken();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SyncFromToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserViewEvent.syncFromToken()';
  }
}

/// @nodoc

class MyInfoFetched implements UserViewEvent {
  const MyInfoFetched({required this.user});

  final User user;

  /// Create a copy of UserViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyInfoFetchedCopyWith<MyInfoFetched> get copyWith =>
      _$MyInfoFetchedCopyWithImpl<MyInfoFetched>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyInfoFetched &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'UserViewEvent.myInfoFetched(user: $user)';
  }
}

/// @nodoc
abstract mixin class $MyInfoFetchedCopyWith<$Res>
    implements $UserViewEventCopyWith<$Res> {
  factory $MyInfoFetchedCopyWith(
          MyInfoFetched value, $Res Function(MyInfoFetched) _then) =
      _$MyInfoFetchedCopyWithImpl;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MyInfoFetchedCopyWithImpl<$Res>
    implements $MyInfoFetchedCopyWith<$Res> {
  _$MyInfoFetchedCopyWithImpl(this._self, this._then);

  final MyInfoFetched _self;
  final $Res Function(MyInfoFetched) _then;

  /// Create a copy of UserViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(MyInfoFetched(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of UserViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class ClearUser implements UserViewEvent {
  const ClearUser();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserViewEvent.clear()';
  }
}

// dart format on
