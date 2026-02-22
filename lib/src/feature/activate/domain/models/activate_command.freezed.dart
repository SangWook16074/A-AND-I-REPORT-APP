// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivateCommand {
  String get token;
  String get username;
  String get password;

  /// Create a copy of ActivateCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateCommandCopyWith<ActivateCommand> get copyWith =>
      _$ActivateCommandCopyWithImpl<ActivateCommand>(
          this as ActivateCommand, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateCommand &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, username, password);

  @override
  String toString() {
    return 'ActivateCommand(token: $token, username: $username, password: $password)';
  }
}

/// @nodoc
abstract mixin class $ActivateCommandCopyWith<$Res> {
  factory $ActivateCommandCopyWith(
          ActivateCommand value, $Res Function(ActivateCommand) _then) =
      _$ActivateCommandCopyWithImpl;
  @useResult
  $Res call({String token, String username, String password});
}

/// @nodoc
class _$ActivateCommandCopyWithImpl<$Res>
    implements $ActivateCommandCopyWith<$Res> {
  _$ActivateCommandCopyWithImpl(this._self, this._then);

  final ActivateCommand _self;
  final $Res Function(ActivateCommand) _then;

  /// Create a copy of ActivateCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ActivateCommand].
extension ActivateCommandPatterns on ActivateCommand {
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
    TResult Function(_ActivateCommand value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateCommand() when $default != null:
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
    TResult Function(_ActivateCommand value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateCommand():
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
    TResult? Function(_ActivateCommand value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateCommand() when $default != null:
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
    TResult Function(String token, String username, String password)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ActivateCommand() when $default != null:
        return $default(_that.token, _that.username, _that.password);
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
    TResult Function(String token, String username, String password) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateCommand():
        return $default(_that.token, _that.username, _that.password);
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
    TResult? Function(String token, String username, String password)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ActivateCommand() when $default != null:
        return $default(_that.token, _that.username, _that.password);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ActivateCommand implements ActivateCommand {
  const _ActivateCommand(
      {required this.token, required this.username, required this.password});

  @override
  final String token;
  @override
  final String username;
  @override
  final String password;

  /// Create a copy of ActivateCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivateCommandCopyWith<_ActivateCommand> get copyWith =>
      __$ActivateCommandCopyWithImpl<_ActivateCommand>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivateCommand &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, username, password);

  @override
  String toString() {
    return 'ActivateCommand(token: $token, username: $username, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$ActivateCommandCopyWith<$Res>
    implements $ActivateCommandCopyWith<$Res> {
  factory _$ActivateCommandCopyWith(
          _ActivateCommand value, $Res Function(_ActivateCommand) _then) =
      __$ActivateCommandCopyWithImpl;
  @override
  @useResult
  $Res call({String token, String username, String password});
}

/// @nodoc
class __$ActivateCommandCopyWithImpl<$Res>
    implements _$ActivateCommandCopyWith<$Res> {
  __$ActivateCommandCopyWithImpl(this._self, this._then);

  final _ActivateCommand _self;
  final $Res Function(_ActivateCommand) _then;

  /// Create a copy of ActivateCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_ActivateCommand(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
