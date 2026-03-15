// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_submit_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportSubmitState {
  SubmitLanguage get selectedLanguage;
  Map<SubmitLanguage, String> get draftCodeByLanguage;
  SubmissionStatus get submissionStatus;
  String get latestSubmittedCode;
  SubmitLanguage? get latestSubmittedLanguage;
  DateTime? get submittedAt;
  int get submitCount;
  int get score;
  List<String> get feedbacks;
  String? get submissionId;
  String? get streamUrl;
  String? get latestVerdict;
  bool get isSubmitting;
  bool get isPolling;
  String get errorMsg;

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportSubmitStateCopyWith<ReportSubmitState> get copyWith =>
      _$ReportSubmitStateCopyWithImpl<ReportSubmitState>(
          this as ReportSubmitState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportSubmitState &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage) &&
            const DeepCollectionEquality()
                .equals(other.draftCodeByLanguage, draftCodeByLanguage) &&
            (identical(other.submissionStatus, submissionStatus) ||
                other.submissionStatus == submissionStatus) &&
            (identical(other.latestSubmittedCode, latestSubmittedCode) ||
                other.latestSubmittedCode == latestSubmittedCode) &&
            (identical(
                    other.latestSubmittedLanguage, latestSubmittedLanguage) ||
                other.latestSubmittedLanguage == latestSubmittedLanguage) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.submitCount, submitCount) ||
                other.submitCount == submitCount) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other.feedbacks, feedbacks) &&
            (identical(other.submissionId, submissionId) ||
                other.submissionId == submissionId) &&
            (identical(other.streamUrl, streamUrl) ||
                other.streamUrl == streamUrl) &&
            (identical(other.latestVerdict, latestVerdict) ||
                other.latestVerdict == latestVerdict) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isPolling, isPolling) ||
                other.isPolling == isPolling) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedLanguage,
      const DeepCollectionEquality().hash(draftCodeByLanguage),
      submissionStatus,
      latestSubmittedCode,
      latestSubmittedLanguage,
      submittedAt,
      submitCount,
      score,
      const DeepCollectionEquality().hash(feedbacks),
      submissionId,
      streamUrl,
      latestVerdict,
      isSubmitting,
      isPolling,
      errorMsg);

  @override
  String toString() {
    return 'ReportSubmitState(selectedLanguage: $selectedLanguage, draftCodeByLanguage: $draftCodeByLanguage, submissionStatus: $submissionStatus, latestSubmittedCode: $latestSubmittedCode, latestSubmittedLanguage: $latestSubmittedLanguage, submittedAt: $submittedAt, submitCount: $submitCount, score: $score, feedbacks: $feedbacks, submissionId: $submissionId, streamUrl: $streamUrl, latestVerdict: $latestVerdict, isSubmitting: $isSubmitting, isPolling: $isPolling, errorMsg: $errorMsg)';
  }
}

/// @nodoc
abstract mixin class $ReportSubmitStateCopyWith<$Res> {
  factory $ReportSubmitStateCopyWith(
          ReportSubmitState value, $Res Function(ReportSubmitState) _then) =
      _$ReportSubmitStateCopyWithImpl;
  @useResult
  $Res call(
      {SubmitLanguage selectedLanguage,
      Map<SubmitLanguage, String> draftCodeByLanguage,
      SubmissionStatus submissionStatus,
      String latestSubmittedCode,
      SubmitLanguage? latestSubmittedLanguage,
      DateTime? submittedAt,
      int submitCount,
      int score,
      List<String> feedbacks,
      String? submissionId,
      String? streamUrl,
      String? latestVerdict,
      bool isSubmitting,
      bool isPolling,
      String errorMsg});
}

/// @nodoc
class _$ReportSubmitStateCopyWithImpl<$Res>
    implements $ReportSubmitStateCopyWith<$Res> {
  _$ReportSubmitStateCopyWithImpl(this._self, this._then);

  final ReportSubmitState _self;
  final $Res Function(ReportSubmitState) _then;

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
    Object? draftCodeByLanguage = null,
    Object? submissionStatus = null,
    Object? latestSubmittedCode = null,
    Object? latestSubmittedLanguage = freezed,
    Object? submittedAt = freezed,
    Object? submitCount = null,
    Object? score = null,
    Object? feedbacks = null,
    Object? submissionId = freezed,
    Object? streamUrl = freezed,
    Object? latestVerdict = freezed,
    Object? isSubmitting = null,
    Object? isPolling = null,
    Object? errorMsg = null,
  }) {
    return _then(_self.copyWith(
      selectedLanguage: null == selectedLanguage
          ? _self.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as SubmitLanguage,
      draftCodeByLanguage: null == draftCodeByLanguage
          ? _self.draftCodeByLanguage
          : draftCodeByLanguage // ignore: cast_nullable_to_non_nullable
              as Map<SubmitLanguage, String>,
      submissionStatus: null == submissionStatus
          ? _self.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus,
      latestSubmittedCode: null == latestSubmittedCode
          ? _self.latestSubmittedCode
          : latestSubmittedCode // ignore: cast_nullable_to_non_nullable
              as String,
      latestSubmittedLanguage: freezed == latestSubmittedLanguage
          ? _self.latestSubmittedLanguage
          : latestSubmittedLanguage // ignore: cast_nullable_to_non_nullable
              as SubmitLanguage?,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      submitCount: null == submitCount
          ? _self.submitCount
          : submitCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      feedbacks: null == feedbacks
          ? _self.feedbacks
          : feedbacks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      submissionId: freezed == submissionId
          ? _self.submissionId
          : submissionId // ignore: cast_nullable_to_non_nullable
              as String?,
      streamUrl: freezed == streamUrl
          ? _self.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      latestVerdict: freezed == latestVerdict
          ? _self.latestVerdict
          : latestVerdict // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isPolling: null == isPolling
          ? _self.isPolling
          : isPolling // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _self.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportSubmitState].
extension ReportSubmitStatePatterns on ReportSubmitState {
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
    TResult Function(_ReportSubmitState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportSubmitState() when $default != null:
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
    TResult Function(_ReportSubmitState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSubmitState():
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
    TResult? Function(_ReportSubmitState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSubmitState() when $default != null:
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
            SubmitLanguage selectedLanguage,
            Map<SubmitLanguage, String> draftCodeByLanguage,
            SubmissionStatus submissionStatus,
            String latestSubmittedCode,
            SubmitLanguage? latestSubmittedLanguage,
            DateTime? submittedAt,
            int submitCount,
            int score,
            List<String> feedbacks,
            String? submissionId,
            String? streamUrl,
            String? latestVerdict,
            bool isSubmitting,
            bool isPolling,
            String errorMsg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportSubmitState() when $default != null:
        return $default(
            _that.selectedLanguage,
            _that.draftCodeByLanguage,
            _that.submissionStatus,
            _that.latestSubmittedCode,
            _that.latestSubmittedLanguage,
            _that.submittedAt,
            _that.submitCount,
            _that.score,
            _that.feedbacks,
            _that.submissionId,
            _that.streamUrl,
            _that.latestVerdict,
            _that.isSubmitting,
            _that.isPolling,
            _that.errorMsg);
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
            SubmitLanguage selectedLanguage,
            Map<SubmitLanguage, String> draftCodeByLanguage,
            SubmissionStatus submissionStatus,
            String latestSubmittedCode,
            SubmitLanguage? latestSubmittedLanguage,
            DateTime? submittedAt,
            int submitCount,
            int score,
            List<String> feedbacks,
            String? submissionId,
            String? streamUrl,
            String? latestVerdict,
            bool isSubmitting,
            bool isPolling,
            String errorMsg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSubmitState():
        return $default(
            _that.selectedLanguage,
            _that.draftCodeByLanguage,
            _that.submissionStatus,
            _that.latestSubmittedCode,
            _that.latestSubmittedLanguage,
            _that.submittedAt,
            _that.submitCount,
            _that.score,
            _that.feedbacks,
            _that.submissionId,
            _that.streamUrl,
            _that.latestVerdict,
            _that.isSubmitting,
            _that.isPolling,
            _that.errorMsg);
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
            SubmitLanguage selectedLanguage,
            Map<SubmitLanguage, String> draftCodeByLanguage,
            SubmissionStatus submissionStatus,
            String latestSubmittedCode,
            SubmitLanguage? latestSubmittedLanguage,
            DateTime? submittedAt,
            int submitCount,
            int score,
            List<String> feedbacks,
            String? submissionId,
            String? streamUrl,
            String? latestVerdict,
            bool isSubmitting,
            bool isPolling,
            String errorMsg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportSubmitState() when $default != null:
        return $default(
            _that.selectedLanguage,
            _that.draftCodeByLanguage,
            _that.submissionStatus,
            _that.latestSubmittedCode,
            _that.latestSubmittedLanguage,
            _that.submittedAt,
            _that.submitCount,
            _that.score,
            _that.feedbacks,
            _that.submissionId,
            _that.streamUrl,
            _that.latestVerdict,
            _that.isSubmitting,
            _that.isPolling,
            _that.errorMsg);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportSubmitState implements ReportSubmitState {
  const _ReportSubmitState(
      {required this.selectedLanguage,
      required final Map<SubmitLanguage, String> draftCodeByLanguage,
      this.submissionStatus = SubmissionStatus.notSubmitted,
      this.latestSubmittedCode = '',
      this.latestSubmittedLanguage,
      this.submittedAt,
      this.submitCount = 0,
      this.score = 0,
      final List<String> feedbacks = const <String>[],
      this.submissionId,
      this.streamUrl,
      this.latestVerdict,
      this.isSubmitting = false,
      this.isPolling = false,
      this.errorMsg = ''})
      : _draftCodeByLanguage = draftCodeByLanguage,
        _feedbacks = feedbacks;

  @override
  final SubmitLanguage selectedLanguage;
  final Map<SubmitLanguage, String> _draftCodeByLanguage;
  @override
  Map<SubmitLanguage, String> get draftCodeByLanguage {
    if (_draftCodeByLanguage is EqualUnmodifiableMapView)
      return _draftCodeByLanguage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_draftCodeByLanguage);
  }

  @override
  @JsonKey()
  final SubmissionStatus submissionStatus;
  @override
  @JsonKey()
  final String latestSubmittedCode;
  @override
  final SubmitLanguage? latestSubmittedLanguage;
  @override
  final DateTime? submittedAt;
  @override
  @JsonKey()
  final int submitCount;
  @override
  @JsonKey()
  final int score;
  final List<String> _feedbacks;
  @override
  @JsonKey()
  List<String> get feedbacks {
    if (_feedbacks is EqualUnmodifiableListView) return _feedbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedbacks);
  }

  @override
  final String? submissionId;
  @override
  final String? streamUrl;
  @override
  final String? latestVerdict;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isPolling;
  @override
  @JsonKey()
  final String errorMsg;

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportSubmitStateCopyWith<_ReportSubmitState> get copyWith =>
      __$ReportSubmitStateCopyWithImpl<_ReportSubmitState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportSubmitState &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage) &&
            const DeepCollectionEquality()
                .equals(other._draftCodeByLanguage, _draftCodeByLanguage) &&
            (identical(other.submissionStatus, submissionStatus) ||
                other.submissionStatus == submissionStatus) &&
            (identical(other.latestSubmittedCode, latestSubmittedCode) ||
                other.latestSubmittedCode == latestSubmittedCode) &&
            (identical(
                    other.latestSubmittedLanguage, latestSubmittedLanguage) ||
                other.latestSubmittedLanguage == latestSubmittedLanguage) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.submitCount, submitCount) ||
                other.submitCount == submitCount) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other._feedbacks, _feedbacks) &&
            (identical(other.submissionId, submissionId) ||
                other.submissionId == submissionId) &&
            (identical(other.streamUrl, streamUrl) ||
                other.streamUrl == streamUrl) &&
            (identical(other.latestVerdict, latestVerdict) ||
                other.latestVerdict == latestVerdict) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isPolling, isPolling) ||
                other.isPolling == isPolling) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedLanguage,
      const DeepCollectionEquality().hash(_draftCodeByLanguage),
      submissionStatus,
      latestSubmittedCode,
      latestSubmittedLanguage,
      submittedAt,
      submitCount,
      score,
      const DeepCollectionEquality().hash(_feedbacks),
      submissionId,
      streamUrl,
      latestVerdict,
      isSubmitting,
      isPolling,
      errorMsg);

  @override
  String toString() {
    return 'ReportSubmitState(selectedLanguage: $selectedLanguage, draftCodeByLanguage: $draftCodeByLanguage, submissionStatus: $submissionStatus, latestSubmittedCode: $latestSubmittedCode, latestSubmittedLanguage: $latestSubmittedLanguage, submittedAt: $submittedAt, submitCount: $submitCount, score: $score, feedbacks: $feedbacks, submissionId: $submissionId, streamUrl: $streamUrl, latestVerdict: $latestVerdict, isSubmitting: $isSubmitting, isPolling: $isPolling, errorMsg: $errorMsg)';
  }
}

/// @nodoc
abstract mixin class _$ReportSubmitStateCopyWith<$Res>
    implements $ReportSubmitStateCopyWith<$Res> {
  factory _$ReportSubmitStateCopyWith(
          _ReportSubmitState value, $Res Function(_ReportSubmitState) _then) =
      __$ReportSubmitStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SubmitLanguage selectedLanguage,
      Map<SubmitLanguage, String> draftCodeByLanguage,
      SubmissionStatus submissionStatus,
      String latestSubmittedCode,
      SubmitLanguage? latestSubmittedLanguage,
      DateTime? submittedAt,
      int submitCount,
      int score,
      List<String> feedbacks,
      String? submissionId,
      String? streamUrl,
      String? latestVerdict,
      bool isSubmitting,
      bool isPolling,
      String errorMsg});
}

/// @nodoc
class __$ReportSubmitStateCopyWithImpl<$Res>
    implements _$ReportSubmitStateCopyWith<$Res> {
  __$ReportSubmitStateCopyWithImpl(this._self, this._then);

  final _ReportSubmitState _self;
  final $Res Function(_ReportSubmitState) _then;

  /// Create a copy of ReportSubmitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedLanguage = null,
    Object? draftCodeByLanguage = null,
    Object? submissionStatus = null,
    Object? latestSubmittedCode = null,
    Object? latestSubmittedLanguage = freezed,
    Object? submittedAt = freezed,
    Object? submitCount = null,
    Object? score = null,
    Object? feedbacks = null,
    Object? submissionId = freezed,
    Object? streamUrl = freezed,
    Object? latestVerdict = freezed,
    Object? isSubmitting = null,
    Object? isPolling = null,
    Object? errorMsg = null,
  }) {
    return _then(_ReportSubmitState(
      selectedLanguage: null == selectedLanguage
          ? _self.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as SubmitLanguage,
      draftCodeByLanguage: null == draftCodeByLanguage
          ? _self._draftCodeByLanguage
          : draftCodeByLanguage // ignore: cast_nullable_to_non_nullable
              as Map<SubmitLanguage, String>,
      submissionStatus: null == submissionStatus
          ? _self.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus,
      latestSubmittedCode: null == latestSubmittedCode
          ? _self.latestSubmittedCode
          : latestSubmittedCode // ignore: cast_nullable_to_non_nullable
              as String,
      latestSubmittedLanguage: freezed == latestSubmittedLanguage
          ? _self.latestSubmittedLanguage
          : latestSubmittedLanguage // ignore: cast_nullable_to_non_nullable
              as SubmitLanguage?,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      submitCount: null == submitCount
          ? _self.submitCount
          : submitCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      feedbacks: null == feedbacks
          ? _self._feedbacks
          : feedbacks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      submissionId: freezed == submissionId
          ? _self.submissionId
          : submissionId // ignore: cast_nullable_to_non_nullable
              as String?,
      streamUrl: freezed == streamUrl
          ? _self.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      latestVerdict: freezed == latestVerdict
          ? _self.latestVerdict
          : latestVerdict // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isPolling: null == isPolling
          ? _self.isPolling
          : isPolling // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _self.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
