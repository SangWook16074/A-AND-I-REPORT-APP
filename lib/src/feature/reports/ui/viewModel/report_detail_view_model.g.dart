// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportDetailViewModelHash() =>
    r'3c2dc91f7a811e8aa68308dcfaacfbd20d804561';

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

abstract class _$ReportDetailViewModel
    extends BuildlessAutoDisposeNotifier<ReportDatailState> {
  late final String courseSlug;
  late final String assignmentId;

  ReportDatailState build(
    String courseSlug,
    String assignmentId,
  );
}

/// See also [ReportDetailViewModel].
@ProviderFor(ReportDetailViewModel)
const reportDetailViewModelProvider = ReportDetailViewModelFamily();

/// See also [ReportDetailViewModel].
class ReportDetailViewModelFamily extends Family<ReportDatailState> {
  /// See also [ReportDetailViewModel].
  const ReportDetailViewModelFamily();

  /// See also [ReportDetailViewModel].
  ReportDetailViewModelProvider call(
    String courseSlug,
    String assignmentId,
  ) {
    return ReportDetailViewModelProvider(
      courseSlug,
      assignmentId,
    );
  }

  @override
  ReportDetailViewModelProvider getProviderOverride(
    covariant ReportDetailViewModelProvider provider,
  ) {
    return call(
      provider.courseSlug,
      provider.assignmentId,
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
  String? get name => r'reportDetailViewModelProvider';
}

/// See also [ReportDetailViewModel].
class ReportDetailViewModelProvider extends AutoDisposeNotifierProviderImpl<
    ReportDetailViewModel, ReportDatailState> {
  /// See also [ReportDetailViewModel].
  ReportDetailViewModelProvider(
    String courseSlug,
    String assignmentId,
  ) : this._internal(
          () => ReportDetailViewModel()
            ..courseSlug = courseSlug
            ..assignmentId = assignmentId,
          from: reportDetailViewModelProvider,
          name: r'reportDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportDetailViewModelHash,
          dependencies: ReportDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              ReportDetailViewModelFamily._allTransitiveDependencies,
          courseSlug: courseSlug,
          assignmentId: assignmentId,
        );

  ReportDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseSlug,
    required this.assignmentId,
  }) : super.internal();

  final String courseSlug;
  final String assignmentId;

  @override
  ReportDatailState runNotifierBuild(
    covariant ReportDetailViewModel notifier,
  ) {
    return notifier.build(
      courseSlug,
      assignmentId,
    );
  }

  @override
  Override overrideWith(ReportDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReportDetailViewModelProvider._internal(
        () => create()
          ..courseSlug = courseSlug
          ..assignmentId = assignmentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseSlug: courseSlug,
        assignmentId: assignmentId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ReportDetailViewModel, ReportDatailState>
      createElement() {
    return _ReportDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportDetailViewModelProvider &&
        other.courseSlug == courseSlug &&
        other.assignmentId == assignmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseSlug.hashCode);
    hash = _SystemHash.combine(hash, assignmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReportDetailViewModelRef
    on AutoDisposeNotifierProviderRef<ReportDatailState> {
  /// The parameter `courseSlug` of this provider.
  String get courseSlug;

  /// The parameter `assignmentId` of this provider.
  String get assignmentId;
}

class _ReportDetailViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<ReportDetailViewModel,
        ReportDatailState> with ReportDetailViewModelRef {
  _ReportDetailViewModelProviderElement(super.provider);

  @override
  String get courseSlug => (origin as ReportDetailViewModelProvider).courseSlug;
  @override
  String get assignmentId =>
      (origin as ReportDetailViewModelProvider).assignmentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
