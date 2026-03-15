// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmissionRequestDto {
  String get problemId;
  String get language;
  String get code;
  SubmissionOptionsDto get options;

  /// Create a copy of SubmissionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmissionRequestDtoCopyWith<SubmissionRequestDto> get copyWith =>
      _$SubmissionRequestDtoCopyWithImpl<SubmissionRequestDto>(
          this as SubmissionRequestDto, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubmissionRequestDto &&
            (identical(other.problemId, problemId) ||
                other.problemId == problemId) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.options, options) || other.options == options));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, problemId, language, code, options);

  @override
  String toString() {
    return 'SubmissionRequestDto(problemId: $problemId, language: $language, code: $code, options: $options)';
  }
}

/// @nodoc
abstract mixin class $SubmissionRequestDtoCopyWith<$Res> {
  factory $SubmissionRequestDtoCopyWith(SubmissionRequestDto value,
          $Res Function(SubmissionRequestDto) _then) =
      _$SubmissionRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String problemId,
      String language,
      String code,
      SubmissionOptionsDto options});

  $SubmissionOptionsDtoCopyWith<$Res> get options;
}

/// @nodoc
class _$SubmissionRequestDtoCopyWithImpl<$Res>
    implements $SubmissionRequestDtoCopyWith<$Res> {
  _$SubmissionRequestDtoCopyWithImpl(this._self, this._then);

  final SubmissionRequestDto _self;
  final $Res Function(SubmissionRequestDto) _then;

  /// Create a copy of SubmissionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problemId = null,
    Object? language = null,
    Object? code = null,
    Object? options = null,
  }) {
    return _then(_self.copyWith(
      problemId: null == problemId
          ? _self.problemId
          : problemId // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as SubmissionOptionsDto,
    ));
  }

  /// Create a copy of SubmissionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubmissionOptionsDtoCopyWith<$Res> get options {
    return $SubmissionOptionsDtoCopyWith<$Res>(_self.options, (value) {
      return _then(_self.copyWith(options: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SubmissionRequestDto].
extension SubmissionRequestDtoPatterns on SubmissionRequestDto {
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
    TResult Function(_SubmissionRequestDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionRequestDto() when $default != null:
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
    TResult Function(_SubmissionRequestDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionRequestDto():
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
    TResult? Function(_SubmissionRequestDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionRequestDto() when $default != null:
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
    TResult Function(String problemId, String language, String code,
            SubmissionOptionsDto options)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionRequestDto() when $default != null:
        return $default(
            _that.problemId, _that.language, _that.code, _that.options);
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
    TResult Function(String problemId, String language, String code,
            SubmissionOptionsDto options)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionRequestDto():
        return $default(
            _that.problemId, _that.language, _that.code, _that.options);
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
    TResult? Function(String problemId, String language, String code,
            SubmissionOptionsDto options)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionRequestDto() when $default != null:
        return $default(
            _that.problemId, _that.language, _that.code, _that.options);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SubmissionRequestDto implements SubmissionRequestDto {
  const _SubmissionRequestDto(
      {required this.problemId,
      required this.language,
      required this.code,
      required this.options});

  @override
  final String problemId;
  @override
  final String language;
  @override
  final String code;
  @override
  final SubmissionOptionsDto options;

  /// Create a copy of SubmissionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmissionRequestDtoCopyWith<_SubmissionRequestDto> get copyWith =>
      __$SubmissionRequestDtoCopyWithImpl<_SubmissionRequestDto>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubmissionRequestDto &&
            (identical(other.problemId, problemId) ||
                other.problemId == problemId) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.options, options) || other.options == options));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, problemId, language, code, options);

  @override
  String toString() {
    return 'SubmissionRequestDto(problemId: $problemId, language: $language, code: $code, options: $options)';
  }
}

/// @nodoc
abstract mixin class _$SubmissionRequestDtoCopyWith<$Res>
    implements $SubmissionRequestDtoCopyWith<$Res> {
  factory _$SubmissionRequestDtoCopyWith(_SubmissionRequestDto value,
          $Res Function(_SubmissionRequestDto) _then) =
      __$SubmissionRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String problemId,
      String language,
      String code,
      SubmissionOptionsDto options});

  @override
  $SubmissionOptionsDtoCopyWith<$Res> get options;
}

/// @nodoc
class __$SubmissionRequestDtoCopyWithImpl<$Res>
    implements _$SubmissionRequestDtoCopyWith<$Res> {
  __$SubmissionRequestDtoCopyWithImpl(this._self, this._then);

  final _SubmissionRequestDto _self;
  final $Res Function(_SubmissionRequestDto) _then;

  /// Create a copy of SubmissionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? problemId = null,
    Object? language = null,
    Object? code = null,
    Object? options = null,
  }) {
    return _then(_SubmissionRequestDto(
      problemId: null == problemId
          ? _self.problemId
          : problemId // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as SubmissionOptionsDto,
    ));
  }

  /// Create a copy of SubmissionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubmissionOptionsDtoCopyWith<$Res> get options {
    return $SubmissionOptionsDtoCopyWith<$Res>(_self.options, (value) {
      return _then(_self.copyWith(options: value));
    });
  }
}

/// @nodoc
mixin _$SubmissionOptionsDto {
  bool get realtimeFeedback;

  /// Create a copy of SubmissionOptionsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmissionOptionsDtoCopyWith<SubmissionOptionsDto> get copyWith =>
      _$SubmissionOptionsDtoCopyWithImpl<SubmissionOptionsDto>(
          this as SubmissionOptionsDto, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubmissionOptionsDto &&
            (identical(other.realtimeFeedback, realtimeFeedback) ||
                other.realtimeFeedback == realtimeFeedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, realtimeFeedback);

  @override
  String toString() {
    return 'SubmissionOptionsDto(realtimeFeedback: $realtimeFeedback)';
  }
}

/// @nodoc
abstract mixin class $SubmissionOptionsDtoCopyWith<$Res> {
  factory $SubmissionOptionsDtoCopyWith(SubmissionOptionsDto value,
          $Res Function(SubmissionOptionsDto) _then) =
      _$SubmissionOptionsDtoCopyWithImpl;
  @useResult
  $Res call({bool realtimeFeedback});
}

/// @nodoc
class _$SubmissionOptionsDtoCopyWithImpl<$Res>
    implements $SubmissionOptionsDtoCopyWith<$Res> {
  _$SubmissionOptionsDtoCopyWithImpl(this._self, this._then);

  final SubmissionOptionsDto _self;
  final $Res Function(SubmissionOptionsDto) _then;

  /// Create a copy of SubmissionOptionsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? realtimeFeedback = null,
  }) {
    return _then(_self.copyWith(
      realtimeFeedback: null == realtimeFeedback
          ? _self.realtimeFeedback
          : realtimeFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubmissionOptionsDto].
extension SubmissionOptionsDtoPatterns on SubmissionOptionsDto {
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
    TResult Function(_SubmissionOptionsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionOptionsDto() when $default != null:
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
    TResult Function(_SubmissionOptionsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionOptionsDto():
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
    TResult? Function(_SubmissionOptionsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionOptionsDto() when $default != null:
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
    TResult Function(bool realtimeFeedback)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubmissionOptionsDto() when $default != null:
        return $default(_that.realtimeFeedback);
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
    TResult Function(bool realtimeFeedback) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionOptionsDto():
        return $default(_that.realtimeFeedback);
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
    TResult? Function(bool realtimeFeedback)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubmissionOptionsDto() when $default != null:
        return $default(_that.realtimeFeedback);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SubmissionOptionsDto implements SubmissionOptionsDto {
  const _SubmissionOptionsDto({required this.realtimeFeedback});

  @override
  final bool realtimeFeedback;

  /// Create a copy of SubmissionOptionsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmissionOptionsDtoCopyWith<_SubmissionOptionsDto> get copyWith =>
      __$SubmissionOptionsDtoCopyWithImpl<_SubmissionOptionsDto>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubmissionOptionsDto &&
            (identical(other.realtimeFeedback, realtimeFeedback) ||
                other.realtimeFeedback == realtimeFeedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, realtimeFeedback);

  @override
  String toString() {
    return 'SubmissionOptionsDto(realtimeFeedback: $realtimeFeedback)';
  }
}

/// @nodoc
abstract mixin class _$SubmissionOptionsDtoCopyWith<$Res>
    implements $SubmissionOptionsDtoCopyWith<$Res> {
  factory _$SubmissionOptionsDtoCopyWith(_SubmissionOptionsDto value,
          $Res Function(_SubmissionOptionsDto) _then) =
      __$SubmissionOptionsDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool realtimeFeedback});
}

/// @nodoc
class __$SubmissionOptionsDtoCopyWithImpl<$Res>
    implements _$SubmissionOptionsDtoCopyWith<$Res> {
  __$SubmissionOptionsDtoCopyWithImpl(this._self, this._then);

  final _SubmissionOptionsDto _self;
  final $Res Function(_SubmissionOptionsDto) _then;

  /// Create a copy of SubmissionOptionsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? realtimeFeedback = null,
  }) {
    return _then(_SubmissionOptionsDto(
      realtimeFeedback: null == realtimeFeedback
          ? _self.realtimeFeedback
          : realtimeFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
