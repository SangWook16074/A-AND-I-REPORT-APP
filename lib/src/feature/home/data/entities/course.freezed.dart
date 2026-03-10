// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Course {
  String get id;
  String get slug;
  String get fieldTag;
  String get startDate;
  String get endDate;
  CourseMetadata get metadata;
  String get status;
  DateTime get createdAt;
  DateTime get updatedAt; // 아래는 응답에 같이 오긴 하는데 값이 placeholder일 수 있어서 optional 처리
  String? get title;
  String? get description;
  String? get phase;
  String? get targetTrack;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseCopyWith<Course> get copyWith =>
      _$CourseCopyWithImpl<Course>(this as Course, _$identity);

  /// Serializes this Course to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Course &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.fieldTag, fieldTag) ||
                other.fieldTag == fieldTag) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.targetTrack, targetTrack) ||
                other.targetTrack == targetTrack));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      slug,
      fieldTag,
      startDate,
      endDate,
      metadata,
      status,
      createdAt,
      updatedAt,
      title,
      description,
      phase,
      targetTrack);

  @override
  String toString() {
    return 'Course(id: $id, slug: $slug, fieldTag: $fieldTag, startDate: $startDate, endDate: $endDate, metadata: $metadata, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, phase: $phase, targetTrack: $targetTrack)';
  }
}

/// @nodoc
abstract mixin class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) _then) =
      _$CourseCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String slug,
      String fieldTag,
      String startDate,
      String endDate,
      CourseMetadata metadata,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      String? title,
      String? description,
      String? phase,
      String? targetTrack});

  $CourseMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$CourseCopyWithImpl<$Res> implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._self, this._then);

  final Course _self;
  final $Res Function(Course) _then;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? fieldTag = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? metadata = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? phase = freezed,
    Object? targetTrack = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      fieldTag: null == fieldTag
          ? _self.fieldTag
          : fieldTag // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as CourseMetadata,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phase: freezed == phase
          ? _self.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String?,
      targetTrack: freezed == targetTrack
          ? _self.targetTrack
          : targetTrack // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseMetadataCopyWith<$Res> get metadata {
    return $CourseMetadataCopyWith<$Res>(_self.metadata, (value) {
      return _then(_self.copyWith(metadata: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Course].
extension CoursePatterns on Course {
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
    TResult Function(_Course value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Course() when $default != null:
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
    TResult Function(_Course value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Course():
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
    TResult? Function(_Course value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Course() when $default != null:
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
            String id,
            String slug,
            String fieldTag,
            String startDate,
            String endDate,
            CourseMetadata metadata,
            String status,
            DateTime createdAt,
            DateTime updatedAt,
            String? title,
            String? description,
            String? phase,
            String? targetTrack)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Course() when $default != null:
        return $default(
            _that.id,
            _that.slug,
            _that.fieldTag,
            _that.startDate,
            _that.endDate,
            _that.metadata,
            _that.status,
            _that.createdAt,
            _that.updatedAt,
            _that.title,
            _that.description,
            _that.phase,
            _that.targetTrack);
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
            String id,
            String slug,
            String fieldTag,
            String startDate,
            String endDate,
            CourseMetadata metadata,
            String status,
            DateTime createdAt,
            DateTime updatedAt,
            String? title,
            String? description,
            String? phase,
            String? targetTrack)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Course():
        return $default(
            _that.id,
            _that.slug,
            _that.fieldTag,
            _that.startDate,
            _that.endDate,
            _that.metadata,
            _that.status,
            _that.createdAt,
            _that.updatedAt,
            _that.title,
            _that.description,
            _that.phase,
            _that.targetTrack);
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
            String id,
            String slug,
            String fieldTag,
            String startDate,
            String endDate,
            CourseMetadata metadata,
            String status,
            DateTime createdAt,
            DateTime updatedAt,
            String? title,
            String? description,
            String? phase,
            String? targetTrack)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Course() when $default != null:
        return $default(
            _that.id,
            _that.slug,
            _that.fieldTag,
            _that.startDate,
            _that.endDate,
            _that.metadata,
            _that.status,
            _that.createdAt,
            _that.updatedAt,
            _that.title,
            _that.description,
            _that.phase,
            _that.targetTrack);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Course implements Course {
  const _Course(
      {required this.id,
      required this.slug,
      required this.fieldTag,
      required this.startDate,
      required this.endDate,
      required this.metadata,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.title,
      this.description,
      this.phase,
      this.targetTrack});
  factory _Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  @override
  final String id;
  @override
  final String slug;
  @override
  final String fieldTag;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final CourseMetadata metadata;
  @override
  final String status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
// 아래는 응답에 같이 오긴 하는데 값이 placeholder일 수 있어서 optional 처리
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? phase;
  @override
  final String? targetTrack;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseCopyWith<_Course> get copyWith =>
      __$CourseCopyWithImpl<_Course>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Course &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.fieldTag, fieldTag) ||
                other.fieldTag == fieldTag) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.targetTrack, targetTrack) ||
                other.targetTrack == targetTrack));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      slug,
      fieldTag,
      startDate,
      endDate,
      metadata,
      status,
      createdAt,
      updatedAt,
      title,
      description,
      phase,
      targetTrack);

  @override
  String toString() {
    return 'Course(id: $id, slug: $slug, fieldTag: $fieldTag, startDate: $startDate, endDate: $endDate, metadata: $metadata, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, phase: $phase, targetTrack: $targetTrack)';
  }
}

/// @nodoc
abstract mixin class _$CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$CourseCopyWith(_Course value, $Res Function(_Course) _then) =
      __$CourseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String slug,
      String fieldTag,
      String startDate,
      String endDate,
      CourseMetadata metadata,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      String? title,
      String? description,
      String? phase,
      String? targetTrack});

  @override
  $CourseMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$CourseCopyWithImpl<$Res> implements _$CourseCopyWith<$Res> {
  __$CourseCopyWithImpl(this._self, this._then);

  final _Course _self;
  final $Res Function(_Course) _then;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? fieldTag = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? metadata = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? phase = freezed,
    Object? targetTrack = freezed,
  }) {
    return _then(_Course(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      fieldTag: null == fieldTag
          ? _self.fieldTag
          : fieldTag // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as CourseMetadata,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phase: freezed == phase
          ? _self.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String?,
      targetTrack: freezed == targetTrack
          ? _self.targetTrack
          : targetTrack // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseMetadataCopyWith<$Res> get metadata {
    return $CourseMetadataCopyWith<$Res>(_self.metadata, (value) {
      return _then(_self.copyWith(metadata: value));
    });
  }
}

/// @nodoc
mixin _$CourseMetadata {
  String get title;
  String get description;
  String get phase;
  Map<String, dynamic>? get attributes;

  /// Create a copy of CourseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseMetadataCopyWith<CourseMetadata> get copyWith =>
      _$CourseMetadataCopyWithImpl<CourseMetadata>(
          this as CourseMetadata, _$identity);

  /// Serializes this CourseMetadata to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseMetadata &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            const DeepCollectionEquality()
                .equals(other.attributes, attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, phase,
      const DeepCollectionEquality().hash(attributes));

  @override
  String toString() {
    return 'CourseMetadata(title: $title, description: $description, phase: $phase, attributes: $attributes)';
  }
}

/// @nodoc
abstract mixin class $CourseMetadataCopyWith<$Res> {
  factory $CourseMetadataCopyWith(
          CourseMetadata value, $Res Function(CourseMetadata) _then) =
      _$CourseMetadataCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String description,
      String phase,
      Map<String, dynamic>? attributes});
}

/// @nodoc
class _$CourseMetadataCopyWithImpl<$Res>
    implements $CourseMetadataCopyWith<$Res> {
  _$CourseMetadataCopyWithImpl(this._self, this._then);

  final CourseMetadata _self;
  final $Res Function(CourseMetadata) _then;

  /// Create a copy of CourseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? phase = null,
    Object? attributes = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      phase: null == phase
          ? _self.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: freezed == attributes
          ? _self.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CourseMetadata].
extension CourseMetadataPatterns on CourseMetadata {
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
    TResult Function(_CourseMetadata value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseMetadata() when $default != null:
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
    TResult Function(_CourseMetadata value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseMetadata():
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
    TResult? Function(_CourseMetadata value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseMetadata() when $default != null:
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
    TResult Function(String title, String description, String phase,
            Map<String, dynamic>? attributes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseMetadata() when $default != null:
        return $default(
            _that.title, _that.description, _that.phase, _that.attributes);
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
    TResult Function(String title, String description, String phase,
            Map<String, dynamic>? attributes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseMetadata():
        return $default(
            _that.title, _that.description, _that.phase, _that.attributes);
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
    TResult? Function(String title, String description, String phase,
            Map<String, dynamic>? attributes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseMetadata() when $default != null:
        return $default(
            _that.title, _that.description, _that.phase, _that.attributes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CourseMetadata implements CourseMetadata {
  const _CourseMetadata(
      {required this.title,
      required this.description,
      required this.phase,
      final Map<String, dynamic>? attributes})
      : _attributes = attributes;
  factory _CourseMetadata.fromJson(Map<String, dynamic> json) =>
      _$CourseMetadataFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String phase;
  final Map<String, dynamic>? _attributes;
  @override
  Map<String, dynamic>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of CourseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseMetadataCopyWith<_CourseMetadata> get copyWith =>
      __$CourseMetadataCopyWithImpl<_CourseMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseMetadataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseMetadata &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, phase,
      const DeepCollectionEquality().hash(_attributes));

  @override
  String toString() {
    return 'CourseMetadata(title: $title, description: $description, phase: $phase, attributes: $attributes)';
  }
}

/// @nodoc
abstract mixin class _$CourseMetadataCopyWith<$Res>
    implements $CourseMetadataCopyWith<$Res> {
  factory _$CourseMetadataCopyWith(
          _CourseMetadata value, $Res Function(_CourseMetadata) _then) =
      __$CourseMetadataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String phase,
      Map<String, dynamic>? attributes});
}

/// @nodoc
class __$CourseMetadataCopyWithImpl<$Res>
    implements _$CourseMetadataCopyWith<$Res> {
  __$CourseMetadataCopyWithImpl(this._self, this._then);

  final _CourseMetadata _self;
  final $Res Function(_CourseMetadata) _then;

  /// Create a copy of CourseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? phase = null,
    Object? attributes = freezed,
  }) {
    return _then(_CourseMetadata(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      phase: null == phase
          ? _self.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: freezed == attributes
          ? _self._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
