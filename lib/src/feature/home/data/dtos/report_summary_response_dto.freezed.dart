// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_summary_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekListResponseDto {
  bool get success;
  List<CourseWeekDto> get data;
  ErrorData? get error;
  String? get timestamp;

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeekListResponseDtoCopyWith<WeekListResponseDto> get copyWith =>
      _$WeekListResponseDtoCopyWithImpl<WeekListResponseDto>(
          this as WeekListResponseDto, _$identity);

  /// Serializes this WeekListResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeekListResponseDto &&
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
    return 'WeekListResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $WeekListResponseDtoCopyWith<$Res> {
  factory $WeekListResponseDtoCopyWith(
          WeekListResponseDto value, $Res Function(WeekListResponseDto) _then) =
      _$WeekListResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      List<CourseWeekDto> data,
      ErrorData? error,
      String? timestamp});

  $ErrorDataCopyWith<$Res>? get error;
}

/// @nodoc
class _$WeekListResponseDtoCopyWithImpl<$Res>
    implements $WeekListResponseDtoCopyWith<$Res> {
  _$WeekListResponseDtoCopyWithImpl(this._self, this._then);

  final WeekListResponseDto _self;
  final $Res Function(WeekListResponseDto) _then;

  /// Create a copy of WeekListResponseDto
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
              as List<CourseWeekDto>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorData?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorDataCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ErrorDataCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [WeekListResponseDto].
extension WeekListResponseDtoPatterns on WeekListResponseDto {
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
    TResult Function(_WeekListResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto() when $default != null:
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
    TResult Function(_WeekListResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto():
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
    TResult? Function(_WeekListResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto() when $default != null:
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
    TResult Function(bool success, List<CourseWeekDto> data, ErrorData? error,
            String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto() when $default != null:
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
    TResult Function(bool success, List<CourseWeekDto> data, ErrorData? error,
            String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto():
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
    TResult? Function(bool success, List<CourseWeekDto> data, ErrorData? error,
            String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeekListResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WeekListResponseDto implements WeekListResponseDto {
  const _WeekListResponseDto(
      {required this.success,
      required final List<CourseWeekDto> data,
      this.error,
      this.timestamp})
      : _data = data;
  factory _WeekListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeekListResponseDtoFromJson(json);

  @override
  final bool success;
  final List<CourseWeekDto> _data;
  @override
  List<CourseWeekDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final ErrorData? error;
  @override
  final String? timestamp;

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeekListResponseDtoCopyWith<_WeekListResponseDto> get copyWith =>
      __$WeekListResponseDtoCopyWithImpl<_WeekListResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeekListResponseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeekListResponseDto &&
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
    return 'WeekListResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$WeekListResponseDtoCopyWith<$Res>
    implements $WeekListResponseDtoCopyWith<$Res> {
  factory _$WeekListResponseDtoCopyWith(_WeekListResponseDto value,
          $Res Function(_WeekListResponseDto) _then) =
      __$WeekListResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      List<CourseWeekDto> data,
      ErrorData? error,
      String? timestamp});

  @override
  $ErrorDataCopyWith<$Res>? get error;
}

/// @nodoc
class __$WeekListResponseDtoCopyWithImpl<$Res>
    implements _$WeekListResponseDtoCopyWith<$Res> {
  __$WeekListResponseDtoCopyWithImpl(this._self, this._then);

  final _WeekListResponseDto _self;
  final $Res Function(_WeekListResponseDto) _then;

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_WeekListResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CourseWeekDto>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorData?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WeekListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorDataCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ErrorDataCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$CourseWeekDto {
  String get id;
  int get weekNo;
  String get title;
  DateTime? get startDate;
  DateTime? get endDate;

  /// Create a copy of CourseWeekDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseWeekDtoCopyWith<CourseWeekDto> get copyWith =>
      _$CourseWeekDtoCopyWithImpl<CourseWeekDto>(
          this as CourseWeekDto, _$identity);

  /// Serializes this CourseWeekDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseWeekDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekNo, weekNo) || other.weekNo == weekNo) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, weekNo, title, startDate, endDate);

  @override
  String toString() {
    return 'CourseWeekDto(id: $id, weekNo: $weekNo, title: $title, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $CourseWeekDtoCopyWith<$Res> {
  factory $CourseWeekDtoCopyWith(
          CourseWeekDto value, $Res Function(CourseWeekDto) _then) =
      _$CourseWeekDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int weekNo,
      String title,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class _$CourseWeekDtoCopyWithImpl<$Res>
    implements $CourseWeekDtoCopyWith<$Res> {
  _$CourseWeekDtoCopyWithImpl(this._self, this._then);

  final CourseWeekDto _self;
  final $Res Function(CourseWeekDto) _then;

  /// Create a copy of CourseWeekDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekNo = null,
    Object? title = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      weekNo: null == weekNo
          ? _self.weekNo
          : weekNo // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CourseWeekDto].
extension CourseWeekDtoPatterns on CourseWeekDto {
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
    TResult Function(_CourseWeekDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseWeekDto() when $default != null:
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
    TResult Function(_CourseWeekDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseWeekDto():
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
    TResult? Function(_CourseWeekDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseWeekDto() when $default != null:
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
    TResult Function(String id, int weekNo, String title, DateTime? startDate,
            DateTime? endDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CourseWeekDto() when $default != null:
        return $default(_that.id, _that.weekNo, _that.title, _that.startDate,
            _that.endDate);
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
    TResult Function(String id, int weekNo, String title, DateTime? startDate,
            DateTime? endDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseWeekDto():
        return $default(_that.id, _that.weekNo, _that.title, _that.startDate,
            _that.endDate);
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
    TResult? Function(String id, int weekNo, String title, DateTime? startDate,
            DateTime? endDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CourseWeekDto() when $default != null:
        return $default(_that.id, _that.weekNo, _that.title, _that.startDate,
            _that.endDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CourseWeekDto implements CourseWeekDto {
  const _CourseWeekDto(
      {required this.id,
      required this.weekNo,
      required this.title,
      required this.startDate,
      required this.endDate});
  factory _CourseWeekDto.fromJson(Map<String, dynamic> json) =>
      _$CourseWeekDtoFromJson(json);

  @override
  final String id;
  @override
  final int weekNo;
  @override
  final String title;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  /// Create a copy of CourseWeekDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseWeekDtoCopyWith<_CourseWeekDto> get copyWith =>
      __$CourseWeekDtoCopyWithImpl<_CourseWeekDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseWeekDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseWeekDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekNo, weekNo) || other.weekNo == weekNo) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, weekNo, title, startDate, endDate);

  @override
  String toString() {
    return 'CourseWeekDto(id: $id, weekNo: $weekNo, title: $title, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$CourseWeekDtoCopyWith<$Res>
    implements $CourseWeekDtoCopyWith<$Res> {
  factory _$CourseWeekDtoCopyWith(
          _CourseWeekDto value, $Res Function(_CourseWeekDto) _then) =
      __$CourseWeekDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int weekNo,
      String title,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class __$CourseWeekDtoCopyWithImpl<$Res>
    implements _$CourseWeekDtoCopyWith<$Res> {
  __$CourseWeekDtoCopyWithImpl(this._self, this._then);

  final _CourseWeekDto _self;
  final $Res Function(_CourseWeekDto) _then;

  /// Create a copy of CourseWeekDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? weekNo = null,
    Object? title = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_CourseWeekDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      weekNo: null == weekNo
          ? _self.weekNo
          : weekNo // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ReportSummaryResponseDto {
  bool get success;
  List<ReportSummary> get data;
  ErrorData? get error;
  String? get timestamp;

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportSummaryResponseDtoCopyWith<ReportSummaryResponseDto> get copyWith =>
      _$ReportSummaryResponseDtoCopyWithImpl<ReportSummaryResponseDto>(
          this as ReportSummaryResponseDto, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportSummaryResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(data), error, timestamp);

  @override
  String toString() {
    return 'ReportSummaryResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $ReportSummaryResponseDtoCopyWith<$Res> {
  factory $ReportSummaryResponseDtoCopyWith(ReportSummaryResponseDto value,
          $Res Function(ReportSummaryResponseDto) _then) =
      _$ReportSummaryResponseDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      List<ReportSummary> data,
      ErrorData? error,
      String? timestamp});

  $ErrorDataCopyWith<$Res>? get error;
}

/// @nodoc
class _$ReportSummaryResponseDtoCopyWithImpl<$Res>
    implements $ReportSummaryResponseDtoCopyWith<$Res> {
  _$ReportSummaryResponseDtoCopyWithImpl(this._self, this._then);

  final ReportSummaryResponseDto _self;
  final $Res Function(ReportSummaryResponseDto) _then;

  /// Create a copy of ReportSummaryResponseDto
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
              as List<ReportSummary>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorData?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorDataCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ErrorDataCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReportSummaryResponseDto].
extension ReportSummaryResponseDtoPatterns on ReportSummaryResponseDto {
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
    TResult Function(_ReportSummaryResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto() when $default != null:
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
    TResult Function(_ReportSummaryResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto():
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
    TResult? Function(_ReportSummaryResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto() when $default != null:
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
    TResult Function(bool success, List<ReportSummary> data, ErrorData? error,
            String? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto() when $default != null:
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
    TResult Function(bool success, List<ReportSummary> data, ErrorData? error,
            String? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto():
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
    TResult? Function(bool success, List<ReportSummary> data, ErrorData? error,
            String? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSummaryResponseDto() when $default != null:
        return $default(
            _that.success, _that.data, _that.error, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportSummaryResponseDto extends ReportSummaryResponseDto {
  const _ReportSummaryResponseDto(
      {required this.success,
      required final List<ReportSummary> data,
      this.error,
      this.timestamp})
      : _data = data,
        super._();

  @override
  final bool success;
  final List<ReportSummary> _data;
  @override
  List<ReportSummary> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final ErrorData? error;
  @override
  final String? timestamp;

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportSummaryResponseDtoCopyWith<_ReportSummaryResponseDto> get copyWith =>
      __$ReportSummaryResponseDtoCopyWithImpl<_ReportSummaryResponseDto>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportSummaryResponseDto &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_data), error, timestamp);

  @override
  String toString() {
    return 'ReportSummaryResponseDto(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$ReportSummaryResponseDtoCopyWith<$Res>
    implements $ReportSummaryResponseDtoCopyWith<$Res> {
  factory _$ReportSummaryResponseDtoCopyWith(_ReportSummaryResponseDto value,
          $Res Function(_ReportSummaryResponseDto) _then) =
      __$ReportSummaryResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      List<ReportSummary> data,
      ErrorData? error,
      String? timestamp});

  @override
  $ErrorDataCopyWith<$Res>? get error;
}

/// @nodoc
class __$ReportSummaryResponseDtoCopyWithImpl<$Res>
    implements _$ReportSummaryResponseDtoCopyWith<$Res> {
  __$ReportSummaryResponseDtoCopyWithImpl(this._self, this._then);

  final _ReportSummaryResponseDto _self;
  final $Res Function(_ReportSummaryResponseDto) _then;

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_ReportSummaryResponseDto(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReportSummary>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorData?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ReportSummaryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorDataCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $ErrorDataCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$ErrorData {
  String get code;
  String get message;

  /// Create a copy of ErrorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorDataCopyWith<ErrorData> get copyWith =>
      _$ErrorDataCopyWithImpl<ErrorData>(this as ErrorData, _$identity);

  /// Serializes this ErrorData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ErrorData(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorDataCopyWith<$Res> {
  factory $ErrorDataCopyWith(ErrorData value, $Res Function(ErrorData) _then) =
      _$ErrorDataCopyWithImpl;
  @useResult
  $Res call({String code, String message});
}

/// @nodoc
class _$ErrorDataCopyWithImpl<$Res> implements $ErrorDataCopyWith<$Res> {
  _$ErrorDataCopyWithImpl(this._self, this._then);

  final ErrorData _self;
  final $Res Function(ErrorData) _then;

  /// Create a copy of ErrorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ErrorData].
extension ErrorDataPatterns on ErrorData {
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
    TResult Function(_ErrorData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorData() when $default != null:
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
    TResult Function(_ErrorData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ErrorData():
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
    TResult? Function(_ErrorData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ErrorData() when $default != null:
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
    TResult Function(String code, String message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorData() when $default != null:
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
    TResult Function(String code, String message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ErrorData():
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
    TResult? Function(String code, String message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ErrorData() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ErrorData implements ErrorData {
  const _ErrorData({required this.code, required this.message});
  factory _ErrorData.fromJson(Map<String, dynamic> json) =>
      _$ErrorDataFromJson(json);

  @override
  final String code;
  @override
  final String message;

  /// Create a copy of ErrorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorDataCopyWith<_ErrorData> get copyWith =>
      __$ErrorDataCopyWithImpl<_ErrorData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ErrorDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ErrorData(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorDataCopyWith<$Res>
    implements $ErrorDataCopyWith<$Res> {
  factory _$ErrorDataCopyWith(
          _ErrorData value, $Res Function(_ErrorData) _then) =
      __$ErrorDataCopyWithImpl;
  @override
  @useResult
  $Res call({String code, String message});
}

/// @nodoc
class __$ErrorDataCopyWithImpl<$Res> implements _$ErrorDataCopyWith<$Res> {
  __$ErrorDataCopyWithImpl(this._self, this._then);

  final _ErrorData _self;
  final $Res Function(_ErrorData) _then;

  /// Create a copy of ErrorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_ErrorData(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
