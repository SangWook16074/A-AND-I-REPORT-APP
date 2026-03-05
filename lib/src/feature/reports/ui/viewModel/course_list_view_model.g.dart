// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseListViewModelHash() =>
    r'8eba9e2fd5b5242628761110be51670d9cf46569';

/// 과정 목록을 조회하는 홈 화면 ViewModel입니다.
///
/// Copied from [CourseListViewModel].
@ProviderFor(CourseListViewModel)
final courseListViewModelProvider = AutoDisposeAsyncNotifierProvider<
    CourseListViewModel, List<Course>>.internal(
  CourseListViewModel.new,
  name: r'courseListViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$courseListViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CourseListViewModel = AutoDisposeAsyncNotifier<List<Course>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
