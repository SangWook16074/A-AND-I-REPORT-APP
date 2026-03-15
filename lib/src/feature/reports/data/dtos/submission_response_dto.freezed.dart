// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmissionResponseDto {
  String get submissionId;
  String get streamUrl;

  /// Create a copy of SubmissionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmissionResponseDtoCopyWith<SubmissionResponseDto> get copyWith =>
      _$SubmissionResponseDtoCopyWithImpl<SubmissionResponseDto>(
          this as SubmissionResponseDto, _$identity);

  /// Serializes this SubmissionResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubmissionResponseDto &&
            (identical(other.submissionId, submissionId) ||
                other.submissionId == submissionId) &&
            (identical(other.streamUrl, streamUrl) ||
                other.streamUrl == streamUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, submissionId, streamUrl);

  @override
  String toString() {
    return 'SubmissionResponseDto(submissionId: $submissionId, streamUrl: $streamUrl)';
  }
}

/// @nodoc
abstract mixin class $SubmissionResponseDtoCopyWith<$Res> {
  factory $SubmissionResponseDtoCopyWith(SubmissionResponseDto value,
          $Res Function(SubmissionResponseDto) _then) =
      _$SubmissionResponseDtoCopyWithImpl;
  @useResult
  $Res call({String submissionId, String streamUrl});
}

/// @nodoc
class _$SubmissionResponseDtoCopyWithImpl<$Res>
    implements $SubmissionResponseDtoCopyWith<$Res> {
  _$SubmissionResponseDtoCopyWithImpl(this._self, this._then);

  final SubmissionResponseDto _self;
  final $Res Function(SubmissionResponseDto) _then;

  /// Create a copy of SubmissionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submissionId = null,
    Object? streamUrl = null,
  }) {
    return _then(_self.copyWith(
      submissionId: null == submissionId
          ? _self.submissionId
          : submissionId // ignore: cast_nullable_to_non_nullable
              as String,
      streamUrl: null == streamUrl
          ? _self.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubmissionResponseDto].
extension SubmissionResponseDtoPatterns on SubmissionResponseDto {
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
    TResult Function(_SubmissionResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionResponseDto() when $default != null:
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
    TResult Function(_SubmissionResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionResponseDto():
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
    TResult? Function(_SubmissionResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionResponseDto() when $default != null:
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
    TResult Function(String submissionId, String streamUrl)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionResponseDto() when $default != null:
        return $default(_that.submissionId, _that.streamUrl);
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
    TResult Function(String submissionId, String streamUrl) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionResponseDto():
        return $default(_that.submissionId, _that.streamUrl);
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
    TResult? Function(String submissionId, String streamUrl)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionResponseDto() when $default != null:
        return $default(_that.submissionId, _that.streamUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubmissionResponseDto implements SubmissionResponseDto {
  const _SubmissionResponseDto(
      {required this.submissionId, required this.streamUrl});
  factory _SubmissionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubmissionResponseDtoFromJson(json);

  @override
  final String submissionId;
  @override
  final String streamUrl;

  /// Create a copy of SubmissionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmissionResponseDtoCopyWith<_SubmissionResponseDto> get copyWith =>
      __$SubmissionResponseDtoCopyWithImpl<_SubmissionResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubmissionResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubmissionResponseDto &&
            (identical(other.submissionId, submissionId) ||
                other.submissionId == submissionId) &&
            (identical(other.streamUrl, streamUrl) ||
                other.streamUrl == streamUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, submissionId, streamUrl);

  @override
  String toString() {
    return 'SubmissionResponseDto(submissionId: $submissionId, streamUrl: $streamUrl)';
  }
}

/// @nodoc
abstract mixin class _$SubmissionResponseDtoCopyWith<$Res>
    implements $SubmissionResponseDtoCopyWith<$Res> {
  factory _$SubmissionResponseDtoCopyWith(_SubmissionResponseDto value,
          $Res Function(_SubmissionResponseDto) _then) =
      __$SubmissionResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String submissionId, String streamUrl});
}

/// @nodoc
class __$SubmissionResponseDtoCopyWithImpl<$Res>
    implements _$SubmissionResponseDtoCopyWith<$Res> {
  __$SubmissionResponseDtoCopyWithImpl(this._self, this._then);

  final _SubmissionResponseDto _self;
  final $Res Function(_SubmissionResponseDto) _then;

  /// Create a copy of SubmissionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? submissionId = null,
    Object? streamUrl = null,
  }) {
    return _then(_SubmissionResponseDto(
      submissionId: null == submissionId
          ? _self.submissionId
          : submissionId // ignore: cast_nullable_to_non_nullable
              as String,
      streamUrl: null == streamUrl
          ? _self.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
