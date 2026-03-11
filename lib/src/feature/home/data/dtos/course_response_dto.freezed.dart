// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseListResponseDto {
  bool get success;
  List<Course> get data;
  CourseApiErrorDto? get error;
  String? get timestamp;

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseListResponseDtoCopyWith<CourseListResponseDto> get copyWith =>
      _$CourseListResponseDtoCopyWithImpl<CourseListResponseDto>(
          this as CourseListResponseDto, _$identity);

  /// Serializes this CourseListResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseListResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(data), error, timestamp);

  @override
  String toString() {
    return 'CourseListResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $CourseListResponseDtoCopyWith<$Res> {
  factory $CourseListResponseDtoCopyWith(CourseListResponseDto value,
          $Res Function(CourseListResponseDto) _then) =
      _$CourseListResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      List<Course> data,
      CourseApiErrorDto? error,
      String? timestamp});

  $CourseApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class _$CourseListResponseDtoCopyWithImpl<$Res>
    implements $CourseListResponseDtoCopyWith<$Res> {
  _$CourseListResponseDtoCopyWithImpl(this._self, this._then);

  final CourseListResponseDto _self;
  final $Res Function(CourseListResponseDto) _then;

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Course>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as CourseApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $CourseApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CourseListResponseDto].
extension CourseListResponseDtoPatterns on CourseListResponseDto {
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
    TResult Function(_CourseListResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseListResponseDto() when $default != null:
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
    TResult Function(_CourseListResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseListResponseDto():
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
    TResult? Function(_CourseListResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseListResponseDto() when $default != null:
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
    TResult Function(bool success, List<Course> data, CourseApiErrorDto? error,
            String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseListResponseDto() when $default != null:
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
    TResult Function(bool success, List<Course> data, CourseApiErrorDto? error,
            String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseListResponseDto():
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
    TResult? Function(bool success, List<Course> data, CourseApiErrorDto? error,
            String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseListResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CourseListResponseDto implements CourseListResponseDto {
  const _CourseListResponseDto(
      {required this.success,
      final List<Course> data = const <Course>[],
      this.error,
      this.timestamp})
      : _data = data;
  factory _CourseListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseListResponseDtoFromJson(json);

  @override
  final bool success;
  final List<Course> _data;
  @override
  @JsonKey()
  List<Course> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final CourseApiErrorDto? error;
  @override
  final String? timestamp;

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseListResponseDtoCopyWith<_CourseListResponseDto> get copyWith =>
      __$CourseListResponseDtoCopyWithImpl<_CourseListResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseListResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseListResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_data), error, timestamp);

  @override
  String toString() {
    return 'CourseListResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$CourseListResponseDtoCopyWith<$Res>
    implements $CourseListResponseDtoCopyWith<$Res> {
  factory _$CourseListResponseDtoCopyWith(_CourseListResponseDto value,
          $Res Function(_CourseListResponseDto) _then) =
      __$CourseListResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      List<Course> data,
      CourseApiErrorDto? error,
      String? timestamp});

  @override
  $CourseApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class __$CourseListResponseDtoCopyWithImpl<$Res>
    implements _$CourseListResponseDtoCopyWith<$Res> {
  __$CourseListResponseDtoCopyWithImpl(this._self, this._then);

  final _CourseListResponseDto _self;
  final $Res Function(_CourseListResponseDto) _then;

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_CourseListResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Course>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as CourseApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of CourseListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $CourseApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$CourseDetailResponseDto {
  bool get success;
  Course? get data;
  CourseApiErrorDto? get error;
  String? get timestamp;

  /// Create a copy of CourseDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseDetailResponseDtoCopyWith<CourseDetailResponseDto> get copyWith =>
      _$CourseDetailResponseDtoCopyWithImpl<CourseDetailResponseDto>(
          this as CourseDetailResponseDto, _$identity);

  /// Serializes this CourseDetailResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseDetailResponseDto &&
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
    return 'CourseDetailResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $CourseDetailResponseDtoCopyWith<$Res> {
  factory $CourseDetailResponseDtoCopyWith(CourseDetailResponseDto value,
          $Res Function(CourseDetailResponseDto) _then) =
      _$CourseDetailResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      Course? data,
      CourseApiErrorDto? error,
      String? timestamp});

  $CourseCopyWith<$Res>? get data;
  $CourseApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class _$CourseDetailResponseDtoCopyWithImpl<$Res>
    implements $CourseDetailResponseDtoCopyWith<$Res> {
  _$CourseDetailResponseDtoCopyWithImpl(this._self, this._then);

  final CourseDetailResponseDto _self;
  final $Res Function(CourseDetailResponseDto) _then;

  /// Create a copy of CourseDetailResponseDto
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
              as Course?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as CourseApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of CourseDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of CourseDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $CourseApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CourseDetailResponseDto].
extension CourseDetailResponseDtoPatterns on CourseDetailResponseDto {
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
    TResult Function(_CourseDetailResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseDetailResponseDto() when $default != null:
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
    TResult Function(_CourseDetailResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseDetailResponseDto():
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
    TResult? Function(_CourseDetailResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseDetailResponseDto() when $default != null:
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
    TResult Function(bool success, Course? data, CourseApiErrorDto? error,
            String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseDetailResponseDto() when $default != null:
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
    TResult Function(bool success, Course? data, CourseApiErrorDto? error,
            String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseDetailResponseDto():
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
    TResult? Function(bool success, Course? data, CourseApiErrorDto? error,
            String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseDetailResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CourseDetailResponseDto implements CourseDetailResponseDto {
  const _CourseDetailResponseDto(
      {required this.success, this.data, this.error, this.timestamp});
  factory _CourseDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailResponseDtoFromJson(json);

  @override
  final bool success;
  @override
  final Course? data;
  @override
  final CourseApiErrorDto? error;
  @override
  final String? timestamp;

  /// Create a copy of CourseDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseDetailResponseDtoCopyWith<_CourseDetailResponseDto> get copyWith =>
      __$CourseDetailResponseDtoCopyWithImpl<_CourseDetailResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseDetailResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseDetailResponseDto &&
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
    return 'CourseDetailResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$CourseDetailResponseDtoCopyWith<$Res>
    implements $CourseDetailResponseDtoCopyWith<$Res> {
  factory _$CourseDetailResponseDtoCopyWith(_CourseDetailResponseDto value,
          $Res Function(_CourseDetailResponseDto) _then) =
      __$CourseDetailResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      Course? data,
      CourseApiErrorDto? error,
      String? timestamp});

  @override
  $CourseCopyWith<$Res>? get data;
  @override
  $CourseApiErrorDtoCopyWith<$Res>? get error;
}

/// @nodoc
class __$CourseDetailResponseDtoCopyWithImpl<$Res>
    implements _$CourseDetailResponseDtoCopyWith<$Res> {
  __$CourseDetailResponseDtoCopyWithImpl(this._self, this._then);

  final _CourseDetailResponseDto _self;
  final $Res Function(_CourseDetailResponseDto) _then;

  /// Create a copy of CourseDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_CourseDetailResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Course?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as CourseApiErrorDto?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of CourseDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of CourseDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseApiErrorDtoCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $CourseApiErrorDtoCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$CourseApiErrorDto {
  String? get code;
  String? get message;

  /// Create a copy of CourseApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseApiErrorDtoCopyWith<CourseApiErrorDto> get copyWith =>
      _$CourseApiErrorDtoCopyWithImpl<CourseApiErrorDto>(
          this as CourseApiErrorDto, _$identity);

  /// Serializes this CourseApiErrorDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'CourseApiErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $CourseApiErrorDtoCopyWith<$Res> {
  factory $CourseApiErrorDtoCopyWith(
          CourseApiErrorDto value, $Res Function(CourseApiErrorDto) _then) =
      _$CourseApiErrorDtoCopyWithImpl;
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class _$CourseApiErrorDtoCopyWithImpl<$Res>
    implements $CourseApiErrorDtoCopyWith<$Res> {
  _$CourseApiErrorDtoCopyWithImpl(this._self, this._then);

  final CourseApiErrorDto _self;
  final $Res Function(CourseApiErrorDto) _then;

  /// Create a copy of CourseApiErrorDto
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

/// Adds pattern-matching-related methods to [CourseApiErrorDto].
extension CourseApiErrorDtoPatterns on CourseApiErrorDto {
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
    TResult Function(_CourseApiErrorDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseApiErrorDto() when $default != null:
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
    TResult Function(_CourseApiErrorDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseApiErrorDto():
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
    TResult? Function(_CourseApiErrorDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseApiErrorDto() when $default != null:
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
      case _CourseApiErrorDto() when $default != null:
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
      case _CourseApiErrorDto():
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
      case _CourseApiErrorDto() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CourseApiErrorDto implements CourseApiErrorDto {
  const _CourseApiErrorDto({this.code, this.message});
  factory _CourseApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$CourseApiErrorDtoFromJson(json);

  @override
  final String? code;
  @override
  final String? message;

  /// Create a copy of CourseApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseApiErrorDtoCopyWith<_CourseApiErrorDto> get copyWith =>
      __$CourseApiErrorDtoCopyWithImpl<_CourseApiErrorDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseApiErrorDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'CourseApiErrorDto(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$CourseApiErrorDtoCopyWith<$Res>
    implements $CourseApiErrorDtoCopyWith<$Res> {
  factory _$CourseApiErrorDtoCopyWith(
          _CourseApiErrorDto value, $Res Function(_CourseApiErrorDto) _then) =
      __$CourseApiErrorDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class __$CourseApiErrorDtoCopyWithImpl<$Res>
    implements _$CourseApiErrorDtoCopyWith<$Res> {
  __$CourseApiErrorDtoCopyWithImpl(this._self, this._then);

  final _CourseApiErrorDto _self;
  final $Res Function(_CourseApiErrorDto) _then;

  /// Create a copy of CourseApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_CourseApiErrorDto(
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
