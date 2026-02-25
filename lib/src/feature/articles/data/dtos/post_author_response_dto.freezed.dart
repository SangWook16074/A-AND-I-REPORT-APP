// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_author_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostAuthorResponseDto {
  String get id;
  String get nickname;
  @JsonKey(readValue: _readProfileImage)
  String? get profileImage;

  /// Create a copy of PostAuthorResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostAuthorResponseDtoCopyWith<PostAuthorResponseDto> get copyWith =>
      _$PostAuthorResponseDtoCopyWithImpl<PostAuthorResponseDto>(
          this as PostAuthorResponseDto, _$identity);

  /// Serializes this PostAuthorResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostAuthorResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nickname, profileImage);

  @override
  String toString() {
    return 'PostAuthorResponseDto(id: $id, nickname: $nickname, profileImage: $profileImage)';
  }
}

/// @nodoc
abstract mixin class $PostAuthorResponseDtoCopyWith<$Res> {
  factory $PostAuthorResponseDtoCopyWith(PostAuthorResponseDto value,
          $Res Function(PostAuthorResponseDto) _then) =
      _$PostAuthorResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String nickname,
      @JsonKey(readValue: _readProfileImage) String? profileImage});
}

/// @nodoc
class _$PostAuthorResponseDtoCopyWithImpl<$Res>
    implements $PostAuthorResponseDtoCopyWith<$Res> {
  _$PostAuthorResponseDtoCopyWithImpl(this._self, this._then);

  final PostAuthorResponseDto _self;
  final $Res Function(PostAuthorResponseDto) _then;

  /// Create a copy of PostAuthorResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? profileImage = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PostAuthorResponseDto].
extension PostAuthorResponseDtoPatterns on PostAuthorResponseDto {
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
    TResult Function(_PostAuthorResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostAuthorResponseDto() when $default != null:
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
    TResult Function(_PostAuthorResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostAuthorResponseDto():
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
    TResult? Function(_PostAuthorResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostAuthorResponseDto() when $default != null:
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
    TResult Function(String id, String nickname,
            @JsonKey(readValue: _readProfileImage) String? profileImage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostAuthorResponseDto() when $default != null:
        return $default(_that.id, _that.nickname, _that.profileImage);
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
    TResult Function(String id, String nickname,
            @JsonKey(readValue: _readProfileImage) String? profileImage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostAuthorResponseDto():
        return $default(_that.id, _that.nickname, _that.profileImage);
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
    TResult? Function(String id, String nickname,
            @JsonKey(readValue: _readProfileImage) String? profileImage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostAuthorResponseDto() when $default != null:
        return $default(_that.id, _that.nickname, _that.profileImage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PostAuthorResponseDto implements PostAuthorResponseDto {
  const _PostAuthorResponseDto(
      {required this.id,
      required this.nickname,
      @JsonKey(readValue: _readProfileImage) this.profileImage});
  factory _PostAuthorResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PostAuthorResponseDtoFromJson(json);

  @override
  final String id;
  @override
  final String nickname;
  @override
  @JsonKey(readValue: _readProfileImage)
  final String? profileImage;

  /// Create a copy of PostAuthorResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostAuthorResponseDtoCopyWith<_PostAuthorResponseDto> get copyWith =>
      __$PostAuthorResponseDtoCopyWithImpl<_PostAuthorResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostAuthorResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostAuthorResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nickname, profileImage);

  @override
  String toString() {
    return 'PostAuthorResponseDto(id: $id, nickname: $nickname, profileImage: $profileImage)';
  }
}

/// @nodoc
abstract mixin class _$PostAuthorResponseDtoCopyWith<$Res>
    implements $PostAuthorResponseDtoCopyWith<$Res> {
  factory _$PostAuthorResponseDtoCopyWith(_PostAuthorResponseDto value,
          $Res Function(_PostAuthorResponseDto) _then) =
      __$PostAuthorResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String nickname,
      @JsonKey(readValue: _readProfileImage) String? profileImage});
}

/// @nodoc
class __$PostAuthorResponseDtoCopyWithImpl<$Res>
    implements _$PostAuthorResponseDtoCopyWith<$Res> {
  __$PostAuthorResponseDtoCopyWithImpl(this._self, this._then);

  final _PostAuthorResponseDto _self;
  final $Res Function(_PostAuthorResponseDto) _then;

  /// Create a copy of PostAuthorResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? profileImage = freezed,
  }) {
    return _then(_PostAuthorResponseDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
