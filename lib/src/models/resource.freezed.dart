// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Resource {
  String get identifier => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get assetFileName16 => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get assetFileNameLarge => throw _privateConstructorUsedError;
  String? get assetFileNameWhenFull => throw _privateConstructorUsedError;
  bool get isLiquid => throw _privateConstructorUsedError;
  int get amountPerSlot => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  double? get secondsToCraft => throw _privateConstructorUsedError;
  double? get secondsToMine => throw _privateConstructorUsedError;
  bool get canConsume => throw _privateConstructorUsedError;
  bool get canPlace => throw _privateConstructorUsedError;
  bool get canPickUp => throw _privateConstructorUsedError;
  bool get canConstruct => throw _privateConstructorUsedError;
  double get placementWidth => throw _privateConstructorUsedError;
  double get placementHeight => throw _privateConstructorUsedError;
  List<Resource> get requiredToMine => throw _privateConstructorUsedError;
  int get slots => throw _privateConstructorUsedError;
  StorageType get storageType => throw _privateConstructorUsedError;
  int get resourcesPerSlot => throw _privateConstructorUsedError;
  int get outputSlotSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResourceCopyWith<Resource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<$Res> {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) then) =
      _$ResourceCopyWithImpl<$Res, Resource>;
  @useResult
  $Res call(
      {String identifier,
      String name,
      String assetFileName16,
      String description,
      String? assetFileNameLarge,
      String? assetFileNameWhenFull,
      bool isLiquid,
      int amountPerSlot,
      List<Ingredient> ingredients,
      double? secondsToCraft,
      double? secondsToMine,
      bool canConsume,
      bool canPlace,
      bool canPickUp,
      bool canConstruct,
      double placementWidth,
      double placementHeight,
      List<Resource> requiredToMine,
      int slots,
      StorageType storageType,
      int resourcesPerSlot,
      int outputSlotSize});
}

/// @nodoc
class _$ResourceCopyWithImpl<$Res, $Val extends Resource>
    implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? assetFileName16 = null,
    Object? description = null,
    Object? assetFileNameLarge = freezed,
    Object? assetFileNameWhenFull = freezed,
    Object? isLiquid = null,
    Object? amountPerSlot = null,
    Object? ingredients = null,
    Object? secondsToCraft = freezed,
    Object? secondsToMine = freezed,
    Object? canConsume = null,
    Object? canPlace = null,
    Object? canPickUp = null,
    Object? canConstruct = null,
    Object? placementWidth = null,
    Object? placementHeight = null,
    Object? requiredToMine = null,
    Object? slots = null,
    Object? storageType = null,
    Object? resourcesPerSlot = null,
    Object? outputSlotSize = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assetFileName16: null == assetFileName16
          ? _value.assetFileName16
          : assetFileName16 // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      assetFileNameLarge: freezed == assetFileNameLarge
          ? _value.assetFileNameLarge
          : assetFileNameLarge // ignore: cast_nullable_to_non_nullable
              as String?,
      assetFileNameWhenFull: freezed == assetFileNameWhenFull
          ? _value.assetFileNameWhenFull
          : assetFileNameWhenFull // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiquid: null == isLiquid
          ? _value.isLiquid
          : isLiquid // ignore: cast_nullable_to_non_nullable
              as bool,
      amountPerSlot: null == amountPerSlot
          ? _value.amountPerSlot
          : amountPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      secondsToCraft: freezed == secondsToCraft
          ? _value.secondsToCraft
          : secondsToCraft // ignore: cast_nullable_to_non_nullable
              as double?,
      secondsToMine: freezed == secondsToMine
          ? _value.secondsToMine
          : secondsToMine // ignore: cast_nullable_to_non_nullable
              as double?,
      canConsume: null == canConsume
          ? _value.canConsume
          : canConsume // ignore: cast_nullable_to_non_nullable
              as bool,
      canPlace: null == canPlace
          ? _value.canPlace
          : canPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      canPickUp: null == canPickUp
          ? _value.canPickUp
          : canPickUp // ignore: cast_nullable_to_non_nullable
              as bool,
      canConstruct: null == canConstruct
          ? _value.canConstruct
          : canConstruct // ignore: cast_nullable_to_non_nullable
              as bool,
      placementWidth: null == placementWidth
          ? _value.placementWidth
          : placementWidth // ignore: cast_nullable_to_non_nullable
              as double,
      placementHeight: null == placementHeight
          ? _value.placementHeight
          : placementHeight // ignore: cast_nullable_to_non_nullable
              as double,
      requiredToMine: null == requiredToMine
          ? _value.requiredToMine
          : requiredToMine // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
      slots: null == slots
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as int,
      storageType: null == storageType
          ? _value.storageType
          : storageType // ignore: cast_nullable_to_non_nullable
              as StorageType,
      resourcesPerSlot: null == resourcesPerSlot
          ? _value.resourcesPerSlot
          : resourcesPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      outputSlotSize: null == outputSlotSize
          ? _value.outputSlotSize
          : outputSlotSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResourceImplCopyWith<$Res>
    implements $ResourceCopyWith<$Res> {
  factory _$$ResourceImplCopyWith(
          _$ResourceImpl value, $Res Function(_$ResourceImpl) then) =
      __$$ResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identifier,
      String name,
      String assetFileName16,
      String description,
      String? assetFileNameLarge,
      String? assetFileNameWhenFull,
      bool isLiquid,
      int amountPerSlot,
      List<Ingredient> ingredients,
      double? secondsToCraft,
      double? secondsToMine,
      bool canConsume,
      bool canPlace,
      bool canPickUp,
      bool canConstruct,
      double placementWidth,
      double placementHeight,
      List<Resource> requiredToMine,
      int slots,
      StorageType storageType,
      int resourcesPerSlot,
      int outputSlotSize});
}

/// @nodoc
class __$$ResourceImplCopyWithImpl<$Res>
    extends _$ResourceCopyWithImpl<$Res, _$ResourceImpl>
    implements _$$ResourceImplCopyWith<$Res> {
  __$$ResourceImplCopyWithImpl(
      _$ResourceImpl _value, $Res Function(_$ResourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? assetFileName16 = null,
    Object? description = null,
    Object? assetFileNameLarge = freezed,
    Object? assetFileNameWhenFull = freezed,
    Object? isLiquid = null,
    Object? amountPerSlot = null,
    Object? ingredients = null,
    Object? secondsToCraft = freezed,
    Object? secondsToMine = freezed,
    Object? canConsume = null,
    Object? canPlace = null,
    Object? canPickUp = null,
    Object? canConstruct = null,
    Object? placementWidth = null,
    Object? placementHeight = null,
    Object? requiredToMine = null,
    Object? slots = null,
    Object? storageType = null,
    Object? resourcesPerSlot = null,
    Object? outputSlotSize = null,
  }) {
    return _then(_$ResourceImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assetFileName16: null == assetFileName16
          ? _value.assetFileName16
          : assetFileName16 // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      assetFileNameLarge: freezed == assetFileNameLarge
          ? _value.assetFileNameLarge
          : assetFileNameLarge // ignore: cast_nullable_to_non_nullable
              as String?,
      assetFileNameWhenFull: freezed == assetFileNameWhenFull
          ? _value.assetFileNameWhenFull
          : assetFileNameWhenFull // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiquid: null == isLiquid
          ? _value.isLiquid
          : isLiquid // ignore: cast_nullable_to_non_nullable
              as bool,
      amountPerSlot: null == amountPerSlot
          ? _value.amountPerSlot
          : amountPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      secondsToCraft: freezed == secondsToCraft
          ? _value.secondsToCraft
          : secondsToCraft // ignore: cast_nullable_to_non_nullable
              as double?,
      secondsToMine: freezed == secondsToMine
          ? _value.secondsToMine
          : secondsToMine // ignore: cast_nullable_to_non_nullable
              as double?,
      canConsume: null == canConsume
          ? _value.canConsume
          : canConsume // ignore: cast_nullable_to_non_nullable
              as bool,
      canPlace: null == canPlace
          ? _value.canPlace
          : canPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      canPickUp: null == canPickUp
          ? _value.canPickUp
          : canPickUp // ignore: cast_nullable_to_non_nullable
              as bool,
      canConstruct: null == canConstruct
          ? _value.canConstruct
          : canConstruct // ignore: cast_nullable_to_non_nullable
              as bool,
      placementWidth: null == placementWidth
          ? _value.placementWidth
          : placementWidth // ignore: cast_nullable_to_non_nullable
              as double,
      placementHeight: null == placementHeight
          ? _value.placementHeight
          : placementHeight // ignore: cast_nullable_to_non_nullable
              as double,
      requiredToMine: null == requiredToMine
          ? _value._requiredToMine
          : requiredToMine // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
      slots: null == slots
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as int,
      storageType: null == storageType
          ? _value.storageType
          : storageType // ignore: cast_nullable_to_non_nullable
              as StorageType,
      resourcesPerSlot: null == resourcesPerSlot
          ? _value.resourcesPerSlot
          : resourcesPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      outputSlotSize: null == outputSlotSize
          ? _value.outputSlotSize
          : outputSlotSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ResourceImpl extends _Resource {
  const _$ResourceImpl(
      {required this.identifier,
      required this.name,
      required this.assetFileName16,
      this.description = defaultDescription,
      this.assetFileNameLarge,
      this.assetFileNameWhenFull,
      this.isLiquid = false,
      this.amountPerSlot = 25,
      final List<Ingredient> ingredients = const [],
      this.secondsToCraft,
      this.secondsToMine,
      this.canConsume = false,
      this.canPlace = false,
      this.canPickUp = false,
      this.canConstruct = false,
      this.placementWidth = TILE_SIZE,
      this.placementHeight = TILE_SIZE,
      final List<Resource> requiredToMine = const [],
      this.slots = 0,
      this.storageType = StorageType.none,
      this.resourcesPerSlot = 0,
      this.outputSlotSize = 0})
      : _ingredients = ingredients,
        _requiredToMine = requiredToMine,
        super._();

  @override
  final String identifier;
  @override
  final String name;
  @override
  final String assetFileName16;
  @override
  @JsonKey()
  final String description;
  @override
  final String? assetFileNameLarge;
  @override
  final String? assetFileNameWhenFull;
  @override
  @JsonKey()
  final bool isLiquid;
  @override
  @JsonKey()
  final int amountPerSlot;
  final List<Ingredient> _ingredients;
  @override
  @JsonKey()
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final double? secondsToCraft;
  @override
  final double? secondsToMine;
  @override
  @JsonKey()
  final bool canConsume;
  @override
  @JsonKey()
  final bool canPlace;
  @override
  @JsonKey()
  final bool canPickUp;
  @override
  @JsonKey()
  final bool canConstruct;
  @override
  @JsonKey()
  final double placementWidth;
  @override
  @JsonKey()
  final double placementHeight;
  final List<Resource> _requiredToMine;
  @override
  @JsonKey()
  List<Resource> get requiredToMine {
    if (_requiredToMine is EqualUnmodifiableListView) return _requiredToMine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredToMine);
  }

  @override
  @JsonKey()
  final int slots;
  @override
  @JsonKey()
  final StorageType storageType;
  @override
  @JsonKey()
  final int resourcesPerSlot;
  @override
  @JsonKey()
  final int outputSlotSize;

  @override
  String toString() {
    return 'Resource(identifier: $identifier, name: $name, assetFileName16: $assetFileName16, description: $description, assetFileNameLarge: $assetFileNameLarge, assetFileNameWhenFull: $assetFileNameWhenFull, isLiquid: $isLiquid, amountPerSlot: $amountPerSlot, ingredients: $ingredients, secondsToCraft: $secondsToCraft, secondsToMine: $secondsToMine, canConsume: $canConsume, canPlace: $canPlace, canPickUp: $canPickUp, canConstruct: $canConstruct, placementWidth: $placementWidth, placementHeight: $placementHeight, requiredToMine: $requiredToMine, slots: $slots, storageType: $storageType, resourcesPerSlot: $resourcesPerSlot, outputSlotSize: $outputSlotSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assetFileName16, assetFileName16) ||
                other.assetFileName16 == assetFileName16) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.assetFileNameLarge, assetFileNameLarge) ||
                other.assetFileNameLarge == assetFileNameLarge) &&
            (identical(other.assetFileNameWhenFull, assetFileNameWhenFull) ||
                other.assetFileNameWhenFull == assetFileNameWhenFull) &&
            (identical(other.isLiquid, isLiquid) ||
                other.isLiquid == isLiquid) &&
            (identical(other.amountPerSlot, amountPerSlot) ||
                other.amountPerSlot == amountPerSlot) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.secondsToCraft, secondsToCraft) ||
                other.secondsToCraft == secondsToCraft) &&
            (identical(other.secondsToMine, secondsToMine) ||
                other.secondsToMine == secondsToMine) &&
            (identical(other.canConsume, canConsume) ||
                other.canConsume == canConsume) &&
            (identical(other.canPlace, canPlace) ||
                other.canPlace == canPlace) &&
            (identical(other.canPickUp, canPickUp) ||
                other.canPickUp == canPickUp) &&
            (identical(other.canConstruct, canConstruct) ||
                other.canConstruct == canConstruct) &&
            (identical(other.placementWidth, placementWidth) ||
                other.placementWidth == placementWidth) &&
            (identical(other.placementHeight, placementHeight) ||
                other.placementHeight == placementHeight) &&
            const DeepCollectionEquality()
                .equals(other._requiredToMine, _requiredToMine) &&
            (identical(other.slots, slots) || other.slots == slots) &&
            (identical(other.storageType, storageType) ||
                other.storageType == storageType) &&
            (identical(other.resourcesPerSlot, resourcesPerSlot) ||
                other.resourcesPerSlot == resourcesPerSlot) &&
            (identical(other.outputSlotSize, outputSlotSize) ||
                other.outputSlotSize == outputSlotSize));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        identifier,
        name,
        assetFileName16,
        description,
        assetFileNameLarge,
        assetFileNameWhenFull,
        isLiquid,
        amountPerSlot,
        const DeepCollectionEquality().hash(_ingredients),
        secondsToCraft,
        secondsToMine,
        canConsume,
        canPlace,
        canPickUp,
        canConstruct,
        placementWidth,
        placementHeight,
        const DeepCollectionEquality().hash(_requiredToMine),
        slots,
        storageType,
        resourcesPerSlot,
        outputSlotSize
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      __$$ResourceImplCopyWithImpl<_$ResourceImpl>(this, _$identity);
}

abstract class _Resource extends Resource {
  const factory _Resource(
      {required final String identifier,
      required final String name,
      required final String assetFileName16,
      final String description,
      final String? assetFileNameLarge,
      final String? assetFileNameWhenFull,
      final bool isLiquid,
      final int amountPerSlot,
      final List<Ingredient> ingredients,
      final double? secondsToCraft,
      final double? secondsToMine,
      final bool canConsume,
      final bool canPlace,
      final bool canPickUp,
      final bool canConstruct,
      final double placementWidth,
      final double placementHeight,
      final List<Resource> requiredToMine,
      final int slots,
      final StorageType storageType,
      final int resourcesPerSlot,
      final int outputSlotSize}) = _$ResourceImpl;
  const _Resource._() : super._();

  @override
  String get identifier;
  @override
  String get name;
  @override
  String get assetFileName16;
  @override
  String get description;
  @override
  String? get assetFileNameLarge;
  @override
  String? get assetFileNameWhenFull;
  @override
  bool get isLiquid;
  @override
  int get amountPerSlot;
  @override
  List<Ingredient> get ingredients;
  @override
  double? get secondsToCraft;
  @override
  double? get secondsToMine;
  @override
  bool get canConsume;
  @override
  bool get canPlace;
  @override
  bool get canPickUp;
  @override
  bool get canConstruct;
  @override
  double get placementWidth;
  @override
  double get placementHeight;
  @override
  List<Resource> get requiredToMine;
  @override
  int get slots;
  @override
  StorageType get storageType;
  @override
  int get resourcesPerSlot;
  @override
  int get outputSlotSize;
  @override
  @JsonKey(ignore: true)
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
