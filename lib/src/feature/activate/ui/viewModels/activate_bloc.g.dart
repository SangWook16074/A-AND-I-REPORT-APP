// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activateBlocHash() => r'bf39ab70467538f31598bf993e974987db1a6dce';

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

abstract class _$ActivateBloc
    extends BuildlessAutoDisposeNotifier<ActivateState> {
  late final String? token;

  ActivateState build(
    String? token,
  );
}

/// See also [ActivateBloc].
@ProviderFor(ActivateBloc)
const activateBlocProvider = ActivateBlocFamily();

/// See also [ActivateBloc].
class ActivateBlocFamily extends Family<ActivateState> {
  /// See also [ActivateBloc].
  const ActivateBlocFamily();

  /// See also [ActivateBloc].
  ActivateBlocProvider call(
    String? token,
  ) {
    return ActivateBlocProvider(
      token,
    );
  }

  @override
  ActivateBlocProvider getProviderOverride(
    covariant ActivateBlocProvider provider,
  ) {
    return call(
      provider.token,
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
  String? get name => r'activateBlocProvider';
}

/// See also [ActivateBloc].
class ActivateBlocProvider
    extends AutoDisposeNotifierProviderImpl<ActivateBloc, ActivateState> {
  /// See also [ActivateBloc].
  ActivateBlocProvider(
    String? token,
  ) : this._internal(
          () => ActivateBloc()..token = token,
          from: activateBlocProvider,
          name: r'activateBlocProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activateBlocHash,
          dependencies: ActivateBlocFamily._dependencies,
          allTransitiveDependencies:
              ActivateBlocFamily._allTransitiveDependencies,
          token: token,
        );

  ActivateBlocProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String? token;

  @override
  ActivateState runNotifierBuild(
    covariant ActivateBloc notifier,
  ) {
    return notifier.build(
      token,
    );
  }

  @override
  Override overrideWith(ActivateBloc Function() create) {
    return ProviderOverride(
      origin: this,
      override: ActivateBlocProvider._internal(
        () => create()..token = token,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ActivateBloc, ActivateState>
      createElement() {
    return _ActivateBlocProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivateBlocProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ActivateBlocRef on AutoDisposeNotifierProviderRef<ActivateState> {
  /// The parameter `token` of this provider.
  String? get token;
}

class _ActivateBlocProviderElement
    extends AutoDisposeNotifierProviderElement<ActivateBloc, ActivateState>
    with ActivateBlocRef {
  _ActivateBlocProviderElement(super.provider);

  @override
  String? get token => (origin as ActivateBlocProvider).token;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
