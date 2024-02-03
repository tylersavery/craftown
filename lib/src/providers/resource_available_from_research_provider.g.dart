// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_available_from_research_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resourceAvailableFromResearchHash() =>
    r'236aaaa92eb40a109194900163df83d7f5cc09e6';

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

/// See also [resourceAvailableFromResearch].
@ProviderFor(resourceAvailableFromResearch)
const resourceAvailableFromResearchProvider =
    ResourceAvailableFromResearchFamily();

/// See also [resourceAvailableFromResearch].
class ResourceAvailableFromResearchFamily extends Family<bool> {
  /// See also [resourceAvailableFromResearch].
  const ResourceAvailableFromResearchFamily();

  /// See also [resourceAvailableFromResearch].
  ResourceAvailableFromResearchProvider call(
    Resource resource,
  ) {
    return ResourceAvailableFromResearchProvider(
      resource,
    );
  }

  @override
  ResourceAvailableFromResearchProvider getProviderOverride(
    covariant ResourceAvailableFromResearchProvider provider,
  ) {
    return call(
      provider.resource,
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
  String? get name => r'resourceAvailableFromResearchProvider';
}

/// See also [resourceAvailableFromResearch].
class ResourceAvailableFromResearchProvider extends Provider<bool> {
  /// See also [resourceAvailableFromResearch].
  ResourceAvailableFromResearchProvider(
    Resource resource,
  ) : this._internal(
          (ref) => resourceAvailableFromResearch(
            ref as ResourceAvailableFromResearchRef,
            resource,
          ),
          from: resourceAvailableFromResearchProvider,
          name: r'resourceAvailableFromResearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resourceAvailableFromResearchHash,
          dependencies: ResourceAvailableFromResearchFamily._dependencies,
          allTransitiveDependencies:
              ResourceAvailableFromResearchFamily._allTransitiveDependencies,
          resource: resource,
        );

  ResourceAvailableFromResearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.resource,
  }) : super.internal();

  final Resource resource;

  @override
  Override overrideWith(
    bool Function(ResourceAvailableFromResearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResourceAvailableFromResearchProvider._internal(
        (ref) => create(ref as ResourceAvailableFromResearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        resource: resource,
      ),
    );
  }

  @override
  ProviderElement<bool> createElement() {
    return _ResourceAvailableFromResearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResourceAvailableFromResearchProvider &&
        other.resource == resource;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, resource.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResourceAvailableFromResearchRef on ProviderRef<bool> {
  /// The parameter `resource` of this provider.
  Resource get resource;
}

class _ResourceAvailableFromResearchProviderElement
    extends ProviderElement<bool> with ResourceAvailableFromResearchRef {
  _ResourceAvailableFromResearchProviderElement(super.provider);

  @override
  Resource get resource =>
      (origin as ResourceAvailableFromResearchProvider).resource;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
