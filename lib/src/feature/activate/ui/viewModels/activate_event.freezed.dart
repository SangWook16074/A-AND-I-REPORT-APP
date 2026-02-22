// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivateEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivateEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivateEvent()';
  }
}

/// @nodoc
class $ActivateEventCopyWith<$Res> {
  $ActivateEventCopyWith(ActivateEvent _, $Res Function(ActivateEvent) __);
}

/// Adds pattern-matching-related methods to [ActivateEvent].
extension ActivateEventPatterns on ActivateEvent {
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
    TResult Function(ActivatePageOpened value)? pageOpened,
    TResult Function(ActivateUsernameChanged value)? usernameChanged,
    TResult Function(ActivateNewPasswordChanged value)? newPasswordChanged,
    TResult Function(ActivateConfirmPasswordChanged value)?
        confirmPasswordChanged,
    TResult Function(ActivateSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ActivatePageOpened() when pageOpened != null:
        return pageOpened(_that);
      case ActivateUsernameChanged() when usernameChanged != null:
        return usernameChanged(_that);
      case ActivateNewPasswordChanged() when newPasswordChanged != null:
        return newPasswordChanged(_that);
      case ActivateConfirmPasswordChanged() when confirmPasswordChanged != null:
        return confirmPasswordChanged(_that);
      case ActivateSubmitted() when submitted != null:
        return submitted(_that);
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
    required TResult Function(ActivatePageOpened value) pageOpened,
    required TResult Function(ActivateUsernameChanged value) usernameChanged,
    required TResult Function(ActivateNewPasswordChanged value)
        newPasswordChanged,
    required TResult Function(ActivateConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(ActivateSubmitted value) submitted,
  }) {
    final _that = this;
    switch (_that) {
      case ActivatePageOpened():
        return pageOpened(_that);
      case ActivateUsernameChanged():
        return usernameChanged(_that);
      case ActivateNewPasswordChanged():
        return newPasswordChanged(_that);
      case ActivateConfirmPasswordChanged():
        return confirmPasswordChanged(_that);
      case ActivateSubmitted():
        return submitted(_that);
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
    TResult? Function(ActivatePageOpened value)? pageOpened,
    TResult? Function(ActivateUsernameChanged value)? usernameChanged,
    TResult? Function(ActivateNewPasswordChanged value)? newPasswordChanged,
    TResult? Function(ActivateConfirmPasswordChanged value)?
        confirmPasswordChanged,
    TResult? Function(ActivateSubmitted value)? submitted,
  }) {
    final _that = this;
    switch (_that) {
      case ActivatePageOpened() when pageOpened != null:
        return pageOpened(_that);
      case ActivateUsernameChanged() when usernameChanged != null:
        return usernameChanged(_that);
      case ActivateNewPasswordChanged() when newPasswordChanged != null:
        return newPasswordChanged(_that);
      case ActivateConfirmPasswordChanged() when confirmPasswordChanged != null:
        return confirmPasswordChanged(_that);
      case ActivateSubmitted() when submitted != null:
        return submitted(_that);
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
    TResult Function()? pageOpened,
    TResult Function(String value)? usernameChanged,
    TResult Function(String value)? newPasswordChanged,
    TResult Function(String value)? confirmPasswordChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ActivatePageOpened() when pageOpened != null:
        return pageOpened();
      case ActivateUsernameChanged() when usernameChanged != null:
        return usernameChanged(_that.value);
      case ActivateNewPasswordChanged() when newPasswordChanged != null:
        return newPasswordChanged(_that.value);
      case ActivateConfirmPasswordChanged() when confirmPasswordChanged != null:
        return confirmPasswordChanged(_that.value);
      case ActivateSubmitted() when submitted != null:
        return submitted();
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
    required TResult Function() pageOpened,
    required TResult Function(String value) usernameChanged,
    required TResult Function(String value) newPasswordChanged,
    required TResult Function(String value) confirmPasswordChanged,
    required TResult Function() submitted,
  }) {
    final _that = this;
    switch (_that) {
      case ActivatePageOpened():
        return pageOpened();
      case ActivateUsernameChanged():
        return usernameChanged(_that.value);
      case ActivateNewPasswordChanged():
        return newPasswordChanged(_that.value);
      case ActivateConfirmPasswordChanged():
        return confirmPasswordChanged(_that.value);
      case ActivateSubmitted():
        return submitted();
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
    TResult? Function()? pageOpened,
    TResult? Function(String value)? usernameChanged,
    TResult? Function(String value)? newPasswordChanged,
    TResult? Function(String value)? confirmPasswordChanged,
    TResult? Function()? submitted,
  }) {
    final _that = this;
    switch (_that) {
      case ActivatePageOpened() when pageOpened != null:
        return pageOpened();
      case ActivateUsernameChanged() when usernameChanged != null:
        return usernameChanged(_that.value);
      case ActivateNewPasswordChanged() when newPasswordChanged != null:
        return newPasswordChanged(_that.value);
      case ActivateConfirmPasswordChanged() when confirmPasswordChanged != null:
        return confirmPasswordChanged(_that.value);
      case ActivateSubmitted() when submitted != null:
        return submitted();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ActivatePageOpened implements ActivateEvent {
  const ActivatePageOpened();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivatePageOpened);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivateEvent.pageOpened()';
  }
}

/// @nodoc

class ActivateUsernameChanged implements ActivateEvent {
  const ActivateUsernameChanged(this.value);

  final String value;

  /// Create a copy of ActivateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateUsernameChangedCopyWith<ActivateUsernameChanged> get copyWith =>
      _$ActivateUsernameChangedCopyWithImpl<ActivateUsernameChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateUsernameChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ActivateEvent.usernameChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ActivateUsernameChangedCopyWith<$Res>
    implements $ActivateEventCopyWith<$Res> {
  factory $ActivateUsernameChangedCopyWith(ActivateUsernameChanged value,
          $Res Function(ActivateUsernameChanged) _then) =
      _$ActivateUsernameChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ActivateUsernameChangedCopyWithImpl<$Res>
    implements $ActivateUsernameChangedCopyWith<$Res> {
  _$ActivateUsernameChangedCopyWithImpl(this._self, this._then);

  final ActivateUsernameChanged _self;
  final $Res Function(ActivateUsernameChanged) _then;

  /// Create a copy of ActivateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ActivateUsernameChanged(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ActivateNewPasswordChanged implements ActivateEvent {
  const ActivateNewPasswordChanged(this.value);

  final String value;

  /// Create a copy of ActivateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateNewPasswordChangedCopyWith<ActivateNewPasswordChanged>
      get copyWith =>
          _$ActivateNewPasswordChangedCopyWithImpl<ActivateNewPasswordChanged>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateNewPasswordChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ActivateEvent.newPasswordChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ActivateNewPasswordChangedCopyWith<$Res>
    implements $ActivateEventCopyWith<$Res> {
  factory $ActivateNewPasswordChangedCopyWith(ActivateNewPasswordChanged value,
          $Res Function(ActivateNewPasswordChanged) _then) =
      _$ActivateNewPasswordChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ActivateNewPasswordChangedCopyWithImpl<$Res>
    implements $ActivateNewPasswordChangedCopyWith<$Res> {
  _$ActivateNewPasswordChangedCopyWithImpl(this._self, this._then);

  final ActivateNewPasswordChanged _self;
  final $Res Function(ActivateNewPasswordChanged) _then;

  /// Create a copy of ActivateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ActivateNewPasswordChanged(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ActivateConfirmPasswordChanged implements ActivateEvent {
  const ActivateConfirmPasswordChanged(this.value);

  final String value;

  /// Create a copy of ActivateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateConfirmPasswordChangedCopyWith<ActivateConfirmPasswordChanged>
      get copyWith => _$ActivateConfirmPasswordChangedCopyWithImpl<
          ActivateConfirmPasswordChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateConfirmPasswordChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ActivateEvent.confirmPasswordChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ActivateConfirmPasswordChangedCopyWith<$Res>
    implements $ActivateEventCopyWith<$Res> {
  factory $ActivateConfirmPasswordChangedCopyWith(
          ActivateConfirmPasswordChanged value,
          $Res Function(ActivateConfirmPasswordChanged) _then) =
      _$ActivateConfirmPasswordChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ActivateConfirmPasswordChangedCopyWithImpl<$Res>
    implements $ActivateConfirmPasswordChangedCopyWith<$Res> {
  _$ActivateConfirmPasswordChangedCopyWithImpl(this._self, this._then);

  final ActivateConfirmPasswordChanged _self;
  final $Res Function(ActivateConfirmPasswordChanged) _then;

  /// Create a copy of ActivateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ActivateConfirmPasswordChanged(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ActivateSubmitted implements ActivateEvent {
  const ActivateSubmitted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivateSubmitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivateEvent.submitted()';
  }
}

// dart format on
