// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeListHash() => r'b6e208de5690a14f5a2b1e9c230961be88f5d245';

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

/// See also [recipeList].
@ProviderFor(recipeList)
const recipeListProvider = RecipeListFamily();

/// See also [recipeList].
class RecipeListFamily extends Family<List<Resource>> {
  /// See also [recipeList].
  const RecipeListFamily();

  /// See also [recipeList].
  RecipeListProvider call(
    RecipeListType type,
  ) {
    return RecipeListProvider(
      type,
    );
  }

  @override
  RecipeListProvider getProviderOverride(
    covariant RecipeListProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'recipeListProvider';
}

/// See also [recipeList].
class RecipeListProvider extends Provider<List<Resource>> {
  /// See also [recipeList].
  RecipeListProvider(
    RecipeListType type,
  ) : this._internal(
          (ref) => recipeList(
            ref as RecipeListRef,
            type,
          ),
          from: recipeListProvider,
          name: r'recipeListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeListHash,
          dependencies: RecipeListFamily._dependencies,
          allTransitiveDependencies:
              RecipeListFamily._allTransitiveDependencies,
          type: type,
        );

  RecipeListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final RecipeListType type;

  @override
  Override overrideWith(
    List<Resource> Function(RecipeListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeListProvider._internal(
        (ref) => create(ref as RecipeListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  ProviderElement<List<Resource>> createElement() {
    return _RecipeListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeListProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeListRef on ProviderRef<List<Resource>> {
  /// The parameter `type` of this provider.
  RecipeListType get type;
}

class _RecipeListProviderElement extends ProviderElement<List<Resource>>
    with RecipeListRef {
  _RecipeListProviderElement(super.provider);

  @override
  RecipeListType get type => (origin as RecipeListProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
