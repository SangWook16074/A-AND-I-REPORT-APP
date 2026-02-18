// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivateResult {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivateResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivateResult()';
  }
}

/// @nodoc
class $ActivateResultCopyWith<$Res> {
  $ActivateResultCopyWith(ActivateResult _, $Res Function(ActivateResult) __);
}

/// Adds pattern-matching-related methods to [ActivateResult].
extension ActivateResultPatterns on ActivateResult {
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
    TResult Function(ActivateSuccess value)? success,
    TResult Function(ActivateFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ActivateSuccess() when success != null:
        return success(_that);
      case ActivateFailure() when failure != null:
        return failure(_that);
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
    required TResult Function(ActivateSuccess value) success,
    required TResult Function(ActivateFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case ActivateSuccess():
        return success(_that);
      case ActivateFailure():
        return failure(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivateSuccess value)? success,
    TResult? Function(ActivateFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case ActivateSuccess() when success != null:
        return success(_that);
      case ActivateFailure() when failure != null:
        return failure(_that);
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
    TResult Function()? success,
    TResult Function(ActivateFailureReason reason)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ActivateSuccess() when success != null:
        return success();
      case ActivateFailure() when failure != null:
        return failure(_that.reason);
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
    required TResult Function() success,
    required TResult Function(ActivateFailureReason reason) failure,
  }) {
    final _that = this;
    switch (_that) {
      case ActivateSuccess():
        return success();
      case ActivateFailure():
        return failure(_that.reason);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(ActivateFailureReason reason)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case ActivateSuccess() when success != null:
        return success();
      case ActivateFailure() when failure != null:
        return failure(_that.reason);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ActivateSuccess implements ActivateResult {
  const ActivateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivateResult.success()';
  }
}

/// @nodoc

class ActivateFailure implements ActivateResult {
  const ActivateFailure(this.reason);

  final ActivateFailureReason reason;

  /// Create a copy of ActivateResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateFailureCopyWith<ActivateFailure> get copyWith =>
      _$ActivateFailureCopyWithImpl<ActivateFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateFailure &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @override
  String toString() {
    return 'ActivateResult.failure(reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $ActivateFailureCopyWith<$Res>
    implements $ActivateResultCopyWith<$Res> {
  factory $ActivateFailureCopyWith(
          ActivateFailure value, $Res Function(ActivateFailure) _then) =
      _$ActivateFailureCopyWithImpl;
  @useResult
  $Res call({ActivateFailureReason reason});
}

/// @nodoc
class _$ActivateFailureCopyWithImpl<$Res>
    implements $ActivateFailureCopyWith<$Res> {
  _$ActivateFailureCopyWithImpl(this._self, this._then);

  final ActivateFailure _self;
  final $Res Function(ActivateFailure) _then;

  /// Create a copy of ActivateResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
  }) {
    return _then(ActivateFailure(
      null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as ActivateFailureReason,
    ));
  }
}

// dart format on
