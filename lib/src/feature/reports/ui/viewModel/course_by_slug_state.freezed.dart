// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_by_slug_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseBySlugState {
  CourseBySlugViewStatus get status;
  Course? get course;
  String get errorMsg;

  /// Create a copy of CourseBySlugState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseBySlugStateCopyWith<CourseBySlugState> get copyWith =>
      _$CourseBySlugStateCopyWithImpl<CourseBySlugState>(
          this as CourseBySlugState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseBySlugState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, course, errorMsg);

  @override
  String toString() {
    return 'CourseBySlugState(status: $status, course: $course, errorMsg: $errorMsg)';
  }
}

/// @nodoc
abstract mixin class $CourseBySlugStateCopyWith<$Res> {
  factory $CourseBySlugStateCopyWith(
          CourseBySlugState value, $Res Function(CourseBySlugState) _then) =
      _$CourseBySlugStateCopyWithImpl;
  @useResult
  $Res call({CourseBySlugViewStatus status, Course? course, String errorMsg});

  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class _$CourseBySlugStateCopyWithImpl<$Res>
    implements $CourseBySlugStateCopyWith<$Res> {
  _$CourseBySlugStateCopyWithImpl(this._self, this._then);

  final CourseBySlugState _self;
  final $Res Function(CourseBySlugState) _then;

  /// Create a copy of CourseBySlugState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? course = freezed,
    Object? errorMsg = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CourseBySlugViewStatus,
      course: freezed == course
          ? _self.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      errorMsg: null == errorMsg
          ? _self.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of CourseBySlugState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_self.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_self.course!, (value) {
      return _then(_self.copyWith(course: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CourseBySlugState].
extension CourseBySlugStatePatterns on CourseBySlugState {
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
    TResult Function(_CourseBySlugState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseBySlugState() when $default != null:
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
    TResult Function(_CourseBySlugState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseBySlugState():
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
    TResult? Function(_CourseBySlugState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseBySlugState() when $default != null:
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
            CourseBySlugViewStatus status, Course? course, String errorMsg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseBySlugState() when $default != null:
        return $default(_that.status, _that.course, _that.errorMsg);
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
            CourseBySlugViewStatus status, Course? course, String errorMsg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseBySlugState():
        return $default(_that.status, _that.course, _that.errorMsg);
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
            CourseBySlugViewStatus status, Course? course, String errorMsg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseBySlugState() when $default != null:
        return $default(_that.status, _that.course, _that.errorMsg);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CourseBySlugState implements CourseBySlugState {
  const _CourseBySlugState(
      {this.status = CourseBySlugViewStatus.loading,
      this.course,
      this.errorMsg = ''});

  @override
  @JsonKey()
  final CourseBySlugViewStatus status;
  @override
  final Course? course;
  @override
  @JsonKey()
  final String errorMsg;

  /// Create a copy of CourseBySlugState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseBySlugStateCopyWith<_CourseBySlugState> get copyWith =>
      __$CourseBySlugStateCopyWithImpl<_CourseBySlugState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseBySlugState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, course, errorMsg);

  @override
  String toString() {
    return 'CourseBySlugState(status: $status, course: $course, errorMsg: $errorMsg)';
  }
}

/// @nodoc
abstract mixin class _$CourseBySlugStateCopyWith<$Res>
    implements $CourseBySlugStateCopyWith<$Res> {
  factory _$CourseBySlugStateCopyWith(
          _CourseBySlugState value, $Res Function(_CourseBySlugState) _then) =
      __$CourseBySlugStateCopyWithImpl;
  @override
  @useResult
  $Res call({CourseBySlugViewStatus status, Course? course, String errorMsg});

  @override
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class __$CourseBySlugStateCopyWithImpl<$Res>
    implements _$CourseBySlugStateCopyWith<$Res> {
  __$CourseBySlugStateCopyWithImpl(this._self, this._then);

  final _CourseBySlugState _self;
  final $Res Function(_CourseBySlugState) _then;

  /// Create a copy of CourseBySlugState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? course = freezed,
    Object? errorMsg = null,
  }) {
    return _then(_CourseBySlugState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CourseBySlugViewStatus,
      course: freezed == course
          ? _self.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      errorMsg: null == errorMsg
          ? _self.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of CourseBySlugState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_self.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_self.course!, (value) {
      return _then(_self.copyWith(course: value));
    });
  }
}

// dart format on
