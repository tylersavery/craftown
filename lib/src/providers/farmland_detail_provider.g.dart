// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmland_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$farmlandDetailHash() => r'26e00b983221ee016b25c5454e3650ee85473299';

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

abstract class _$FarmlandDetail extends BuildlessNotifier<Farmland?> {
  late final String arg;

  Farmland? build(
    String arg,
  );
}

/// See also [FarmlandDetail].
@ProviderFor(FarmlandDetail)
const farmlandDetailProvider = FarmlandDetailFamily();

/// See also [FarmlandDetail].
class FarmlandDetailFamily extends Family<Farmland?> {
  /// See also [FarmlandDetail].
  const FarmlandDetailFamily();

  /// See also [FarmlandDetail].
  FarmlandDetailProvider call(
    String arg,
  ) {
    return FarmlandDetailProvider(
      arg,
    );
  }

  @override
  FarmlandDetailProvider getProviderOverride(
    covariant FarmlandDetailProvider provider,
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
  String? get name => r'farmlandDetailProvider';
}

/// See also [FarmlandDetail].
class FarmlandDetailProvider
    extends NotifierProviderImpl<FarmlandDetail, Farmland?> {
  /// See also [FarmlandDetail].
  FarmlandDetailProvider(
    String arg,
  ) : this._internal(
          () => FarmlandDetail()..arg = arg,
          from: farmlandDetailProvider,
          name: r'farmlandDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$farmlandDetailHash,
          dependencies: FarmlandDetailFamily._dependencies,
          allTransitiveDependencies:
              FarmlandDetailFamily._allTransitiveDependencies,
          arg: arg,
        );

  FarmlandDetailProvider._internal(
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
  Farmland? runNotifierBuild(
    covariant FarmlandDetail notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(FarmlandDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: FarmlandDetailProvider._internal(
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
  NotifierProviderElement<FarmlandDetail, Farmland?> createElement() {
    return _FarmlandDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FarmlandDetailProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FarmlandDetailRef on NotifierProviderRef<Farmland?> {
  /// The parameter `arg` of this provider.
  String get arg;
}

class _FarmlandDetailProviderElement
    extends NotifierProviderElement<FarmlandDetail, Farmland?>
    with FarmlandDetailRef {
  _FarmlandDetailProviderElement(super.provider);

  @override
  String get arg => (origin as FarmlandDetailProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
