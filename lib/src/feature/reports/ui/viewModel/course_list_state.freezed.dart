// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseListState {
  CourseListViewStatus get status;
  List<Course> get courses;
  String get errorMsg;

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseListStateCopyWith<CourseListState> get copyWith =>
      _$CourseListStateCopyWithImpl<CourseListState>(
          this as CourseListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseListState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.courses, courses) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(courses), errorMsg);

  @override
  String toString() {
    return 'CourseListState(status: $status, courses: $courses, errorMsg: $errorMsg)';
  }
}

/// @nodoc
abstract mixin class $CourseListStateCopyWith<$Res> {
  factory $CourseListStateCopyWith(
          CourseListState value, $Res Function(CourseListState) _then) =
      _$CourseListStateCopyWithImpl;
  @useResult
  $Res call(
      {CourseListViewStatus status, List<Course> courses, String errorMsg});
}

/// @nodoc
class _$CourseListStateCopyWithImpl<$Res>
    implements $CourseListStateCopyWith<$Res> {
  _$CourseListStateCopyWithImpl(this._self, this._then);

  final CourseListState _self;
  final $Res Function(CourseListState) _then;

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? courses = null,
    Object? errorMsg = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CourseListViewStatus,
      courses: null == courses
          ? _self.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<Course>,
      errorMsg: null == errorMsg
          ? _self.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CourseListState].
extension CourseListStatePatterns on CourseListState {
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
    TResult Function(_CourseListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseListState() when $default != null:
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
    TResult Function(_CourseListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseListState():
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
    TResult? Function(_CourseListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseListState() when $default != null:
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
            CourseListViewStatus status, List<Course> courses, String errorMsg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseListState() when $default != null:
        return $default(_that.status, _that.courses, _that.errorMsg);
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
            CourseListViewStatus status, List<Course> courses, String errorMsg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseListState():
        return $default(_that.status, _that.courses, _that.errorMsg);
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
            CourseListViewStatus status, List<Course> courses, String errorMsg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseListState() when $default != null:
        return $default(_that.status, _that.courses, _that.errorMsg);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CourseListState implements CourseListState {
  const _CourseListState(
      {this.status = CourseListViewStatus.loading,
      final List<Course> courses = const [],
      this.errorMsg = ''})
      : _courses = courses;

  @override
  @JsonKey()
  final CourseListViewStatus status;
  final List<Course> _courses;
  @override
  @JsonKey()
  List<Course> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  @JsonKey()
  final String errorMsg;

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseListStateCopyWith<_CourseListState> get copyWith =>
      __$CourseListStateCopyWithImpl<_CourseListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseListState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_courses), errorMsg);

  @override
  String toString() {
    return 'CourseListState(status: $status, courses: $courses, errorMsg: $errorMsg)';
  }
}

/// @nodoc
abstract mixin class _$CourseListStateCopyWith<$Res>
    implements $CourseListStateCopyWith<$Res> {
  factory _$CourseListStateCopyWith(
          _CourseListState value, $Res Function(_CourseListState) _then) =
      __$CourseListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CourseListViewStatus status, List<Course> courses, String errorMsg});
}

/// @nodoc
class __$CourseListStateCopyWithImpl<$Res>
    implements _$CourseListStateCopyWith<$Res> {
  __$CourseListStateCopyWithImpl(this._self, this._then);

  final _CourseListState _self;
  final $Res Function(_CourseListState) _then;

  /// Create a copy of CourseListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? courses = null,
    Object? errorMsg = null,
  }) {
    return _then(_CourseListState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CourseListViewStatus,
      courses: null == courses
          ? _self._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<Course>,
      errorMsg: null == errorMsg
          ? _self.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
