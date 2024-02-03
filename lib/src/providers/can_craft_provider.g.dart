// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'can_craft_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$canCraftHash() => r'6e90e07d3269918bae77eda697574d188627f2a9';

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

/// See also [canCraft].
@ProviderFor(canCraft)
const canCraftProvider = CanCraftFamily();

/// See also [canCraft].
class CanCraftFamily extends Family<bool> {
  /// See also [canCraft].
  const CanCraftFamily();

  /// See also [canCraft].
  CanCraftProvider call(
    Resource resource,
  ) {
    return CanCraftProvider(
      resource,
    );
  }

  @override
  CanCraftProvider getProviderOverride(
    covariant CanCraftProvider provider,
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
  String? get name => r'canCraftProvider';
}

/// See also [canCraft].
class CanCraftProvider extends Provider<bool> {
  /// See also [canCraft].
  CanCraftProvider(
    Resource resource,
  ) : this._internal(
          (ref) => canCraft(
            ref as CanCraftRef,
            resource,
          ),
          from: canCraftProvider,
          name: r'canCraftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$canCraftHash,
          dependencies: CanCraftFamily._dependencies,
          allTransitiveDependencies: CanCraftFamily._allTransitiveDependencies,
          resource: resource,
        );

  CanCraftProvider._internal(
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
    bool Function(CanCraftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CanCraftProvider._internal(
        (ref) => create(ref as CanCraftRef),
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
    return _CanCraftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CanCraftProvider && other.resource == resource;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, resource.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CanCraftRef on ProviderRef<bool> {
  /// The parameter `resource` of this provider.
  Resource get resource;
}

class _CanCraftProviderElement extends ProviderElement<bool> with CanCraftRef {
  _CanCraftProviderElement(super.provider);

  @override
  Resource get resource => (origin as CanCraftProvider).resource;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
