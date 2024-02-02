// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipesListHash() => r'bfe831ecf86a93edf3a59811aa0acec81f7667bd';

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

abstract class _$RecipesList extends BuildlessNotifier<List<Resource>> {
  late final RecipeListType type;

  List<Resource> build(
    RecipeListType type,
  );
}

/// See also [RecipesList].
@ProviderFor(RecipesList)
const recipesListProvider = RecipesListFamily();

/// See also [RecipesList].
class RecipesListFamily extends Family<List<Resource>> {
  /// See also [RecipesList].
  const RecipesListFamily();

  /// See also [RecipesList].
  RecipesListProvider call(
    RecipeListType type,
  ) {
    return RecipesListProvider(
      type,
    );
  }

  @override
  RecipesListProvider getProviderOverride(
    covariant RecipesListProvider provider,
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
  String? get name => r'recipesListProvider';
}

/// See also [RecipesList].
class RecipesListProvider
    extends NotifierProviderImpl<RecipesList, List<Resource>> {
  /// See also [RecipesList].
  RecipesListProvider(
    RecipeListType type,
  ) : this._internal(
          () => RecipesList()..type = type,
          from: recipesListProvider,
          name: r'recipesListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipesListHash,
          dependencies: RecipesListFamily._dependencies,
          allTransitiveDependencies:
              RecipesListFamily._allTransitiveDependencies,
          type: type,
        );

  RecipesListProvider._internal(
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
  List<Resource> runNotifierBuild(
    covariant RecipesList notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(RecipesList Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipesListProvider._internal(
        () => create()..type = type,
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
  NotifierProviderElement<RecipesList, List<Resource>> createElement() {
    return _RecipesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipesListProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecipesListRef on NotifierProviderRef<List<Resource>> {
  /// The parameter `type` of this provider.
  RecipeListType get type;
}

class _RecipesListProviderElement
    extends NotifierProviderElement<RecipesList, List<Resource>>
    with RecipesListRef {
  _RecipesListProviderElement(super.provider);

  @override
  RecipeListType get type => (origin as RecipesListProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
