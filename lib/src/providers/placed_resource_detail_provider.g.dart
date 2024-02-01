// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placed_resource_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placedResourceDetailHash() =>
    r'30a15fa635114dccfab2369a09bbacc9dcde6c06';

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

abstract class _$PlacedResourceDetail
    extends BuildlessNotifier<PlacedResource?> {
  late final String arg;

  PlacedResource? build(
    String arg,
  );
}

/// See also [PlacedResourceDetail].
@ProviderFor(PlacedResourceDetail)
const placedResourceDetailProvider = PlacedResourceDetailFamily();

/// See also [PlacedResourceDetail].
class PlacedResourceDetailFamily extends Family<PlacedResource?> {
  /// See also [PlacedResourceDetail].
  const PlacedResourceDetailFamily();

  /// See also [PlacedResourceDetail].
  PlacedResourceDetailProvider call(
    String arg,
  ) {
    return PlacedResourceDetailProvider(
      arg,
    );
  }

  @override
  PlacedResourceDetailProvider getProviderOverride(
    covariant PlacedResourceDetailProvider provider,
  ) {
    return call(
      provider.arg,
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
  String? get name => r'placedResourceDetailProvider';
}

/// See also [PlacedResourceDetail].
class PlacedResourceDetailProvider
    extends NotifierProviderImpl<PlacedResourceDetail, PlacedResource?> {
  /// See also [PlacedResourceDetail].
  PlacedResourceDetailProvider(
    String arg,
  ) : this._internal(
          () => PlacedResourceDetail()..arg = arg,
          from: placedResourceDetailProvider,
          name: r'placedResourceDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$placedResourceDetailHash,
          dependencies: PlacedResourceDetailFamily._dependencies,
          allTransitiveDependencies:
              PlacedResourceDetailFamily._allTransitiveDependencies,
          arg: arg,
        );

  PlacedResourceDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final String arg;

  @override
  PlacedResource? runNotifierBuild(
    covariant PlacedResourceDetail notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(PlacedResourceDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlacedResourceDetailProvider._internal(
        () => create()..arg = arg,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  NotifierProviderElement<PlacedResourceDetail, PlacedResource?>
      createElement() {
    return _PlacedResourceDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlacedResourceDetailProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlacedResourceDetailRef on NotifierProviderRef<PlacedResource?> {
  /// The parameter `arg` of this provider.
  String get arg;
}

class _PlacedResourceDetailProviderElement
    extends NotifierProviderElement<PlacedResourceDetail, PlacedResource?>
    with PlacedResourceDetailRef {
  _PlacedResourceDetailProviderElement(super.provider);

  @override
  String get arg => (origin as PlacedResourceDetailProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
