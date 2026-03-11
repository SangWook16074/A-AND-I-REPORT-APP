// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportListViewModelHash() =>
    r'c059795aa587c2c4fdc9f2bb20588fe83f38765f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ReportListViewModel
    extends BuildlessAutoDisposeAsyncNotifier<ReportListState> {
  late final String courseSlug;

  FutureOr<ReportListState> build(
    String courseSlug,
  );
}

/// 과제 목록 화면의 상태를 관리하는 ViewModel입니다.
///
/// [AutoDisposeAsyncNotifier]를 상속받아 구현되었습니다.
/// 화면 진입 시 [build] 메서드가 실행되어 과제 목록을 자동으로 로드합니다.
///
/// Copied from [ReportListViewModel].
@ProviderFor(ReportListViewModel)
const reportListViewModelProvider = ReportListViewModelFamily();

/// 과제 목록 화면의 상태를 관리하는 ViewModel입니다.
///
/// [AutoDisposeAsyncNotifier]를 상속받아 구현되었습니다.
/// 화면 진입 시 [build] 메서드가 실행되어 과제 목록을 자동으로 로드합니다.
///
/// Copied from [ReportListViewModel].
class ReportListViewModelFamily extends Family<AsyncValue<ReportListState>> {
  /// 과제 목록 화면의 상태를 관리하는 ViewModel입니다.
  ///
  /// [AutoDisposeAsyncNotifier]를 상속받아 구현되었습니다.
  /// 화면 진입 시 [build] 메서드가 실행되어 과제 목록을 자동으로 로드합니다.
  ///
  /// Copied from [ReportListViewModel].
  const ReportListViewModelFamily();

  /// 과제 목록 화면의 상태를 관리하는 ViewModel입니다.
  ///
  /// [AutoDisposeAsyncNotifier]를 상속받아 구현되었습니다.
  /// 화면 진입 시 [build] 메서드가 실행되어 과제 목록을 자동으로 로드합니다.
  ///
  /// Copied from [ReportListViewModel].
  ReportListViewModelProvider call(
    String courseSlug,
  ) {
    return ReportListViewModelProvider(
      courseSlug,
    );
  }

  @override
  ReportListViewModelProvider getProviderOverride(
    covariant ReportListViewModelProvider provider,
  ) {
    return call(
      provider.courseSlug,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'reportListViewModelProvider';
}

/// 과제 목록 화면의 상태를 관리하는 ViewModel입니다.
///
/// [AutoDisposeAsyncNotifier]를 상속받아 구현되었습니다.
/// 화면 진입 시 [build] 메서드가 실행되어 과제 목록을 자동으로 로드합니다.
///
/// Copied from [ReportListViewModel].
class ReportListViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ReportListViewModel, ReportListState> {
  /// 과제 목록 화면의 상태를 관리하는 ViewModel입니다.
  ///
  /// [AutoDisposeAsyncNotifier]를 상속받아 구현되었습니다.
  /// 화면 진입 시 [build] 메서드가 실행되어 과제 목록을 자동으로 로드합니다.
  ///
  /// Copied from [ReportListViewModel].
  ReportListViewModelProvider(
    String courseSlug,
  ) : this._internal(
          () => ReportListViewModel()..courseSlug = courseSlug,
          from: reportListViewModelProvider,
          name: r'reportListViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportListViewModelHash,
          dependencies: ReportListViewModelFamily._dependencies,
          allTransitiveDependencies:
              ReportListViewModelFamily._allTransitiveDependencies,
          courseSlug: courseSlug,
        );

  ReportListViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseSlug,
  }) : super.internal();

  final String courseSlug;

  @override
  FutureOr<ReportListState> runNotifierBuild(
    covariant ReportListViewModel notifier,
  ) {
    return notifier.build(
      courseSlug,
    );
  }

  @override
  Override overrideWith(ReportListViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReportListViewModelProvider._internal(
        () => create()..courseSlug = courseSlug,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseSlug: courseSlug,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ReportListViewModel, ReportListState>
      createElement() {
    return _ReportListViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportListViewModelProvider &&
        other.courseSlug == courseSlug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseSlug.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReportListViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<ReportListState> {
  /// The parameter `courseSlug` of this provider.
  String get courseSlug;
}

class _ReportListViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ReportListViewModel,
        ReportListState> with ReportListViewModelRef {
  _ReportListViewModelProviderElement(super.provider);

  @override
  String get courseSlug => (origin as ReportListViewModelProvider).courseSlug;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
