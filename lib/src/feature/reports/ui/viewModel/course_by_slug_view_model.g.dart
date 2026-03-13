// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_by_slug_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseBySlugViewModelHash() =>
    r'0cf76c73aeefb1c26c1a9cfebde5699d21f14986';

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

abstract class _$CourseBySlugViewModel
    extends BuildlessAutoDisposeNotifier<CourseBySlugState> {
  late final String courseSlug;

  CourseBySlugState build(
    String courseSlug,
  );
}

/// 코스 슬러그별 과정을 조회하는 ViewModel Provider입니다.
///
/// Copied from [CourseBySlugViewModel].
@ProviderFor(CourseBySlugViewModel)
const courseBySlugViewModelProvider = CourseBySlugViewModelFamily();

/// 코스 슬러그별 과정을 조회하는 ViewModel Provider입니다.
///
/// Copied from [CourseBySlugViewModel].
class CourseBySlugViewModelFamily extends Family<CourseBySlugState> {
  /// 코스 슬러그별 과정을 조회하는 ViewModel Provider입니다.
  ///
  /// Copied from [CourseBySlugViewModel].
  const CourseBySlugViewModelFamily();

  /// 코스 슬러그별 과정을 조회하는 ViewModel Provider입니다.
  ///
  /// Copied from [CourseBySlugViewModel].
  CourseBySlugViewModelProvider call(
    String courseSlug,
  ) {
    return CourseBySlugViewModelProvider(
      courseSlug,
    );
  }

  @override
  CourseBySlugViewModelProvider getProviderOverride(
    covariant CourseBySlugViewModelProvider provider,
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
  String? get name => r'courseBySlugViewModelProvider';
}

/// 코스 슬러그별 과정을 조회하는 ViewModel Provider입니다.
///
/// Copied from [CourseBySlugViewModel].
class CourseBySlugViewModelProvider extends AutoDisposeNotifierProviderImpl<
    CourseBySlugViewModel, CourseBySlugState> {
  /// 코스 슬러그별 과정을 조회하는 ViewModel Provider입니다.
  ///
  /// Copied from [CourseBySlugViewModel].
  CourseBySlugViewModelProvider(
    String courseSlug,
  ) : this._internal(
          () => CourseBySlugViewModel()..courseSlug = courseSlug,
          from: courseBySlugViewModelProvider,
          name: r'courseBySlugViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseBySlugViewModelHash,
          dependencies: CourseBySlugViewModelFamily._dependencies,
          allTransitiveDependencies:
              CourseBySlugViewModelFamily._allTransitiveDependencies,
          courseSlug: courseSlug,
        );

  CourseBySlugViewModelProvider._internal(
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
  CourseBySlugState runNotifierBuild(
    covariant CourseBySlugViewModel notifier,
  ) {
    return notifier.build(
      courseSlug,
    );
  }

  @override
  Override overrideWith(CourseBySlugViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: CourseBySlugViewModelProvider._internal(
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
  AutoDisposeNotifierProviderElement<CourseBySlugViewModel, CourseBySlugState>
      createElement() {
    return _CourseBySlugViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseBySlugViewModelProvider &&
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
mixin CourseBySlugViewModelRef
    on AutoDisposeNotifierProviderRef<CourseBySlugState> {
  /// The parameter `courseSlug` of this provider.
  String get courseSlug;
}

class _CourseBySlugViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<CourseBySlugViewModel,
        CourseBySlugState> with CourseBySlugViewModelRef {
  _CourseBySlugViewModelProviderElement(super.provider);

  @override
  String get courseSlug => (origin as CourseBySlugViewModelProvider).courseSlug;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
