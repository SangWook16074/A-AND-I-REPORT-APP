// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostResponseDto {
  String get id;
  String get title;
  String get contentMarkdown;
  String? get thumbnailUrl;
  PostAuthorResponseDto get author;
  String get status;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of PostResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostResponseDtoCopyWith<PostResponseDto> get copyWith =>
      _$PostResponseDtoCopyWithImpl<PostResponseDto>(
          this as PostResponseDto, _$identity);

  /// Serializes this PostResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contentMarkdown, contentMarkdown) ||
                other.contentMarkdown == contentMarkdown) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, contentMarkdown,
      thumbnailUrl, author, status, createdAt, updatedAt);

  @override
  String toString() {
    return 'PostResponseDto(id: $id, title: $title, contentMarkdown: $contentMarkdown, thumbnailUrl: $thumbnailUrl, author: $author, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $PostResponseDtoCopyWith<$Res> {
  factory $PostResponseDtoCopyWith(
          PostResponseDto value, $Res Function(PostResponseDto) _then) =
      _$PostResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String contentMarkdown,
      String? thumbnailUrl,
      PostAuthorResponseDto author,
      String status,
      DateTime createdAt,
      DateTime updatedAt});

  $PostAuthorResponseDtoCopyWith<$Res> get author;
}

/// @nodoc
class _$PostResponseDtoCopyWithImpl<$Res>
    implements $PostResponseDtoCopyWith<$Res> {
  _$PostResponseDtoCopyWithImpl(this._self, this._then);

  final PostResponseDto _self;
  final $Res Function(PostResponseDto) _then;

  /// Create a copy of PostResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? contentMarkdown = null,
    Object? thumbnailUrl = freezed,
    Object? author = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contentMarkdown: null == contentMarkdown
          ? _self.contentMarkdown
          : contentMarkdown // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as PostAuthorResponseDto,
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
    ));
  }

  /// Create a copy of PostResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostAuthorResponseDtoCopyWith<$Res> get author {
    return $PostAuthorResponseDtoCopyWith<$Res>(_self.author, (value) {
      return _then(_self.copyWith(author: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PostResponseDto].
extension PostResponseDtoPatterns on PostResponseDto {
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
    TResult Function(_PostResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostResponseDto() when $default != null:
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
    TResult Function(_PostResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostResponseDto():
        return $default(_that);
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
    TResult? Function(_PostResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostResponseDto() when $default != null:
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
            String title,
            String contentMarkdown,
            String? thumbnailUrl,
            PostAuthorResponseDto author,
            String status,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostResponseDto() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.contentMarkdown,
            _that.thumbnailUrl,
            _that.author,
            _that.status,
            _that.createdAt,
            _that.updatedAt);
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
            String title,
            String contentMarkdown,
            String? thumbnailUrl,
            PostAuthorResponseDto author,
            String status,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostResponseDto():
        return $default(
            _that.id,
            _that.title,
            _that.contentMarkdown,
            _that.thumbnailUrl,
            _that.author,
            _that.status,
            _that.createdAt,
            _that.updatedAt);
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
            String title,
            String contentMarkdown,
            String? thumbnailUrl,
            PostAuthorResponseDto author,
            String status,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostResponseDto() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.contentMarkdown,
            _that.thumbnailUrl,
            _that.author,
            _that.status,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PostResponseDto implements PostResponseDto {
  const _PostResponseDto(
      {required this.id,
      required this.title,
      required this.contentMarkdown,
      this.thumbnailUrl,
      required this.author,
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  factory _PostResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PostResponseDtoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String contentMarkdown;
  @override
  final String? thumbnailUrl;
  @override
  final PostAuthorResponseDto author;
  @override
  final String status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of PostResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostResponseDtoCopyWith<_PostResponseDto> get copyWith =>
      __$PostResponseDtoCopyWithImpl<_PostResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contentMarkdown, contentMarkdown) ||
                other.contentMarkdown == contentMarkdown) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, contentMarkdown,
      thumbnailUrl, author, status, createdAt, updatedAt);

  @override
  String toString() {
    return 'PostResponseDto(id: $id, title: $title, contentMarkdown: $contentMarkdown, thumbnailUrl: $thumbnailUrl, author: $author, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$PostResponseDtoCopyWith<$Res>
    implements $PostResponseDtoCopyWith<$Res> {
  factory _$PostResponseDtoCopyWith(
          _PostResponseDto value, $Res Function(_PostResponseDto) _then) =
      __$PostResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String contentMarkdown,
      String? thumbnailUrl,
      PostAuthorResponseDto author,
      String status,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $PostAuthorResponseDtoCopyWith<$Res> get author;
}

/// @nodoc
class __$PostResponseDtoCopyWithImpl<$Res>
    implements _$PostResponseDtoCopyWith<$Res> {
  __$PostResponseDtoCopyWithImpl(this._self, this._then);

  final _PostResponseDto _self;
  final $Res Function(_PostResponseDto) _then;

  /// Create a copy of PostResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? contentMarkdown = null,
    Object? thumbnailUrl = freezed,
    Object? author = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_PostResponseDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contentMarkdown: null == contentMarkdown
          ? _self.contentMarkdown
          : contentMarkdown // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _self.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as PostAuthorResponseDto,
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
    ));
  }

  /// Create a copy of PostResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostAuthorResponseDtoCopyWith<$Res> get author {
    return $PostAuthorResponseDtoCopyWith<$Res>(_self.author, (value) {
      return _then(_self.copyWith(author: value));
    });
  }
}

// dart format on
