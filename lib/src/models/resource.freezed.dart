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

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return _Resource.fromJson(json);
}

/// @nodoc
mixin _$Resource {
  String get identifier => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get namePlural => throw _privateConstructorUsedError;
  String get assetFileName16 => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get assetFileNameLarge => throw _privateConstructorUsedError;
  String? get assetFileNameWhenFull => throw _privateConstructorUsedError;
  bool get isLiquid => throw _privateConstructorUsedError;
  int get amountPerSlot => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  double get interactionRadius => throw _privateConstructorUsedError;
  double? get secondsToSmelt => throw _privateConstructorUsedError;
  double? get secondsToCraft => throw _privateConstructorUsedError;
  double? get secondsToMine => throw _privateConstructorUsedError;
  String? get miningToolRequiredIdentifier =>
      throw _privateConstructorUsedError;
  double get hungerDecreaseOnConsumption => throw _privateConstructorUsedError;
  double get thirstDecreaseOnConsumption => throw _privateConstructorUsedError;
  bool get canPlace => throw _privateConstructorUsedError;
  bool get canPickUp => throw _privateConstructorUsedError;
  bool get canConstruct => throw _privateConstructorUsedError;
  bool get canSmelt => throw _privateConstructorUsedError;
  double get placementWidth => throw _privateConstructorUsedError;
  double get placementHeight => throw _privateConstructorUsedError;
  List<Resource> get requiredToMine => throw _privateConstructorUsedError;
  int get slots => throw _privateConstructorUsedError;
  @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson)
  StorageType get storageType => throw _privateConstructorUsedError;
  int get resourcesPerSlot => throw _privateConstructorUsedError;
  int get outputSlotSize => throw _privateConstructorUsedError;
  bool get isSeed => throw _privateConstructorUsedError;
  int get secondsToGrow => throw _privateConstructorUsedError;
  Resource? get growsInto => throw _privateConstructorUsedError;
  int get farmYieldMin => throw _privateConstructorUsedError;
  int get farmYieldMax => throw _privateConstructorUsedError;
  bool get contentsWillSell => throw _privateConstructorUsedError;
  int get saleValue => throw _privateConstructorUsedError;
  Resource? get miningOutputResource => throw _privateConstructorUsedError;
  List<Resource>? get canOnlyBePlacedOn => throw _privateConstructorUsedError;
  double? get restValue => throw _privateConstructorUsedError;
  int? get storeCost => throw _privateConstructorUsedError;
  double? get spawnedResourceHitboxWidth => throw _privateConstructorUsedError;
  double? get spawnedResourceHitboxHeight => throw _privateConstructorUsedError;
  double get spawnedResourceHitboxOffsetX => throw _privateConstructorUsedError;
  double get spawnedResourceHitboxOffsetY => throw _privateConstructorUsedError;
  String? get smeltsInto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      String namePlural,
      String assetFileName16,
      String description,
      String? assetFileNameLarge,
      String? assetFileNameWhenFull,
      bool isLiquid,
      int amountPerSlot,
      List<Ingredient> ingredients,
      double interactionRadius,
      double? secondsToSmelt,
      double? secondsToCraft,
      double? secondsToMine,
      String? miningToolRequiredIdentifier,
      double hungerDecreaseOnConsumption,
      double thirstDecreaseOnConsumption,
      bool canPlace,
      bool canPickUp,
      bool canConstruct,
      bool canSmelt,
      double placementWidth,
      double placementHeight,
      List<Resource> requiredToMine,
      int slots,
      @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson)
      StorageType storageType,
      int resourcesPerSlot,
      int outputSlotSize,
      bool isSeed,
      int secondsToGrow,
      Resource? growsInto,
      int farmYieldMin,
      int farmYieldMax,
      bool contentsWillSell,
      int saleValue,
      Resource? miningOutputResource,
      List<Resource>? canOnlyBePlacedOn,
      double? restValue,
      int? storeCost,
      double? spawnedResourceHitboxWidth,
      double? spawnedResourceHitboxHeight,
      double spawnedResourceHitboxOffsetX,
      double spawnedResourceHitboxOffsetY,
      String? smeltsInto});

  $ResourceCopyWith<$Res>? get growsInto;
  $ResourceCopyWith<$Res>? get miningOutputResource;
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
    Object? namePlural = null,
    Object? assetFileName16 = null,
    Object? description = null,
    Object? assetFileNameLarge = freezed,
    Object? assetFileNameWhenFull = freezed,
    Object? isLiquid = null,
    Object? amountPerSlot = null,
    Object? ingredients = null,
    Object? interactionRadius = null,
    Object? secondsToSmelt = freezed,
    Object? secondsToCraft = freezed,
    Object? secondsToMine = freezed,
    Object? miningToolRequiredIdentifier = freezed,
    Object? hungerDecreaseOnConsumption = null,
    Object? thirstDecreaseOnConsumption = null,
    Object? canPlace = null,
    Object? canPickUp = null,
    Object? canConstruct = null,
    Object? canSmelt = null,
    Object? placementWidth = null,
    Object? placementHeight = null,
    Object? requiredToMine = null,
    Object? slots = null,
    Object? storageType = null,
    Object? resourcesPerSlot = null,
    Object? outputSlotSize = null,
    Object? isSeed = null,
    Object? secondsToGrow = null,
    Object? growsInto = freezed,
    Object? farmYieldMin = null,
    Object? farmYieldMax = null,
    Object? contentsWillSell = null,
    Object? saleValue = null,
    Object? miningOutputResource = freezed,
    Object? canOnlyBePlacedOn = freezed,
    Object? restValue = freezed,
    Object? storeCost = freezed,
    Object? spawnedResourceHitboxWidth = freezed,
    Object? spawnedResourceHitboxHeight = freezed,
    Object? spawnedResourceHitboxOffsetX = null,
    Object? spawnedResourceHitboxOffsetY = null,
    Object? smeltsInto = freezed,
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
      namePlural: null == namePlural
          ? _value.namePlural
          : namePlural // ignore: cast_nullable_to_non_nullable
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
      interactionRadius: null == interactionRadius
          ? _value.interactionRadius
          : interactionRadius // ignore: cast_nullable_to_non_nullable
              as double,
      secondsToSmelt: freezed == secondsToSmelt
          ? _value.secondsToSmelt
          : secondsToSmelt // ignore: cast_nullable_to_non_nullable
              as double?,
      secondsToCraft: freezed == secondsToCraft
          ? _value.secondsToCraft
          : secondsToCraft // ignore: cast_nullable_to_non_nullable
              as double?,
      secondsToMine: freezed == secondsToMine
          ? _value.secondsToMine
          : secondsToMine // ignore: cast_nullable_to_non_nullable
              as double?,
      miningToolRequiredIdentifier: freezed == miningToolRequiredIdentifier
          ? _value.miningToolRequiredIdentifier
          : miningToolRequiredIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      hungerDecreaseOnConsumption: null == hungerDecreaseOnConsumption
          ? _value.hungerDecreaseOnConsumption
          : hungerDecreaseOnConsumption // ignore: cast_nullable_to_non_nullable
              as double,
      thirstDecreaseOnConsumption: null == thirstDecreaseOnConsumption
          ? _value.thirstDecreaseOnConsumption
          : thirstDecreaseOnConsumption // ignore: cast_nullable_to_non_nullable
              as double,
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
      canSmelt: null == canSmelt
          ? _value.canSmelt
          : canSmelt // ignore: cast_nullable_to_non_nullable
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
      isSeed: null == isSeed
          ? _value.isSeed
          : isSeed // ignore: cast_nullable_to_non_nullable
              as bool,
      secondsToGrow: null == secondsToGrow
          ? _value.secondsToGrow
          : secondsToGrow // ignore: cast_nullable_to_non_nullable
              as int,
      growsInto: freezed == growsInto
          ? _value.growsInto
          : growsInto // ignore: cast_nullable_to_non_nullable
              as Resource?,
      farmYieldMin: null == farmYieldMin
          ? _value.farmYieldMin
          : farmYieldMin // ignore: cast_nullable_to_non_nullable
              as int,
      farmYieldMax: null == farmYieldMax
          ? _value.farmYieldMax
          : farmYieldMax // ignore: cast_nullable_to_non_nullable
              as int,
      contentsWillSell: null == contentsWillSell
          ? _value.contentsWillSell
          : contentsWillSell // ignore: cast_nullable_to_non_nullable
              as bool,
      saleValue: null == saleValue
          ? _value.saleValue
          : saleValue // ignore: cast_nullable_to_non_nullable
              as int,
      miningOutputResource: freezed == miningOutputResource
          ? _value.miningOutputResource
          : miningOutputResource // ignore: cast_nullable_to_non_nullable
              as Resource?,
      canOnlyBePlacedOn: freezed == canOnlyBePlacedOn
          ? _value.canOnlyBePlacedOn
          : canOnlyBePlacedOn // ignore: cast_nullable_to_non_nullable
              as List<Resource>?,
      restValue: freezed == restValue
          ? _value.restValue
          : restValue // ignore: cast_nullable_to_non_nullable
              as double?,
      storeCost: freezed == storeCost
          ? _value.storeCost
          : storeCost // ignore: cast_nullable_to_non_nullable
              as int?,
      spawnedResourceHitboxWidth: freezed == spawnedResourceHitboxWidth
          ? _value.spawnedResourceHitboxWidth
          : spawnedResourceHitboxWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      spawnedResourceHitboxHeight: freezed == spawnedResourceHitboxHeight
          ? _value.spawnedResourceHitboxHeight
          : spawnedResourceHitboxHeight // ignore: cast_nullable_to_non_nullable
              as double?,
      spawnedResourceHitboxOffsetX: null == spawnedResourceHitboxOffsetX
          ? _value.spawnedResourceHitboxOffsetX
          : spawnedResourceHitboxOffsetX // ignore: cast_nullable_to_non_nullable
              as double,
      spawnedResourceHitboxOffsetY: null == spawnedResourceHitboxOffsetY
          ? _value.spawnedResourceHitboxOffsetY
          : spawnedResourceHitboxOffsetY // ignore: cast_nullable_to_non_nullable
              as double,
      smeltsInto: freezed == smeltsInto
          ? _value.smeltsInto
          : smeltsInto // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res>? get growsInto {
    if (_value.growsInto == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.growsInto!, (value) {
      return _then(_value.copyWith(growsInto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res>? get miningOutputResource {
    if (_value.miningOutputResource == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.miningOutputResource!, (value) {
      return _then(_value.copyWith(miningOutputResource: value) as $Val);
    });
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
      String namePlural,
      String assetFileName16,
      String description,
      String? assetFileNameLarge,
      String? assetFileNameWhenFull,
      bool isLiquid,
      int amountPerSlot,
      List<Ingredient> ingredients,
      double interactionRadius,
      double? secondsToSmelt,
      double? secondsToCraft,
      double? secondsToMine,
      String? miningToolRequiredIdentifier,
      double hungerDecreaseOnConsumption,
      double thirstDecreaseOnConsumption,
      bool canPlace,
      bool canPickUp,
      bool canConstruct,
      bool canSmelt,
      double placementWidth,
      double placementHeight,
      List<Resource> requiredToMine,
      int slots,
      @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson)
      StorageType storageType,
      int resourcesPerSlot,
      int outputSlotSize,
      bool isSeed,
      int secondsToGrow,
      Resource? growsInto,
      int farmYieldMin,
      int farmYieldMax,
      bool contentsWillSell,
      int saleValue,
      Resource? miningOutputResource,
      List<Resource>? canOnlyBePlacedOn,
      double? restValue,
      int? storeCost,
      double? spawnedResourceHitboxWidth,
      double? spawnedResourceHitboxHeight,
      double spawnedResourceHitboxOffsetX,
      double spawnedResourceHitboxOffsetY,
      String? smeltsInto});

  @override
  $ResourceCopyWith<$Res>? get growsInto;
  @override
  $ResourceCopyWith<$Res>? get miningOutputResource;
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
    Object? namePlural = null,
    Object? assetFileName16 = null,
    Object? description = null,
    Object? assetFileNameLarge = freezed,
    Object? assetFileNameWhenFull = freezed,
    Object? isLiquid = null,
    Object? amountPerSlot = null,
    Object? ingredients = null,
    Object? interactionRadius = null,
    Object? secondsToSmelt = freezed,
    Object? secondsToCraft = freezed,
    Object? secondsToMine = freezed,
    Object? miningToolRequiredIdentifier = freezed,
    Object? hungerDecreaseOnConsumption = null,
    Object? thirstDecreaseOnConsumption = null,
    Object? canPlace = null,
    Object? canPickUp = null,
    Object? canConstruct = null,
    Object? canSmelt = null,
    Object? placementWidth = null,
    Object? placementHeight = null,
    Object? requiredToMine = null,
    Object? slots = null,
    Object? storageType = null,
    Object? resourcesPerSlot = null,
    Object? outputSlotSize = null,
    Object? isSeed = null,
    Object? secondsToGrow = null,
    Object? growsInto = freezed,
    Object? farmYieldMin = null,
    Object? farmYieldMax = null,
    Object? contentsWillSell = null,
    Object? saleValue = null,
    Object? miningOutputResource = freezed,
    Object? canOnlyBePlacedOn = freezed,
    Object? restValue = freezed,
    Object? storeCost = freezed,
    Object? spawnedResourceHitboxWidth = freezed,
    Object? spawnedResourceHitboxHeight = freezed,
    Object? spawnedResourceHitboxOffsetX = null,
    Object? spawnedResourceHitboxOffsetY = null,
    Object? smeltsInto = freezed,
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
      namePlural: null == namePlural
          ? _value.namePlural
          : namePlural // ignore: cast_nullable_to_non_nullable
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
      interactionRadius: null == interactionRadius
          ? _value.interactionRadius
          : interactionRadius // ignore: cast_nullable_to_non_nullable
              as double,
      secondsToSmelt: freezed == secondsToSmelt
          ? _value.secondsToSmelt
          : secondsToSmelt // ignore: cast_nullable_to_non_nullable
              as double?,
      secondsToCraft: freezed == secondsToCraft
          ? _value.secondsToCraft
          : secondsToCraft // ignore: cast_nullable_to_non_nullable
              as double?,
      secondsToMine: freezed == secondsToMine
          ? _value.secondsToMine
          : secondsToMine // ignore: cast_nullable_to_non_nullable
              as double?,
      miningToolRequiredIdentifier: freezed == miningToolRequiredIdentifier
          ? _value.miningToolRequiredIdentifier
          : miningToolRequiredIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      hungerDecreaseOnConsumption: null == hungerDecreaseOnConsumption
          ? _value.hungerDecreaseOnConsumption
          : hungerDecreaseOnConsumption // ignore: cast_nullable_to_non_nullable
              as double,
      thirstDecreaseOnConsumption: null == thirstDecreaseOnConsumption
          ? _value.thirstDecreaseOnConsumption
          : thirstDecreaseOnConsumption // ignore: cast_nullable_to_non_nullable
              as double,
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
      canSmelt: null == canSmelt
          ? _value.canSmelt
          : canSmelt // ignore: cast_nullable_to_non_nullable
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
      isSeed: null == isSeed
          ? _value.isSeed
          : isSeed // ignore: cast_nullable_to_non_nullable
              as bool,
      secondsToGrow: null == secondsToGrow
          ? _value.secondsToGrow
          : secondsToGrow // ignore: cast_nullable_to_non_nullable
              as int,
      growsInto: freezed == growsInto
          ? _value.growsInto
          : growsInto // ignore: cast_nullable_to_non_nullable
              as Resource?,
      farmYieldMin: null == farmYieldMin
          ? _value.farmYieldMin
          : farmYieldMin // ignore: cast_nullable_to_non_nullable
              as int,
      farmYieldMax: null == farmYieldMax
          ? _value.farmYieldMax
          : farmYieldMax // ignore: cast_nullable_to_non_nullable
              as int,
      contentsWillSell: null == contentsWillSell
          ? _value.contentsWillSell
          : contentsWillSell // ignore: cast_nullable_to_non_nullable
              as bool,
      saleValue: null == saleValue
          ? _value.saleValue
          : saleValue // ignore: cast_nullable_to_non_nullable
              as int,
      miningOutputResource: freezed == miningOutputResource
          ? _value.miningOutputResource
          : miningOutputResource // ignore: cast_nullable_to_non_nullable
              as Resource?,
      canOnlyBePlacedOn: freezed == canOnlyBePlacedOn
          ? _value._canOnlyBePlacedOn
          : canOnlyBePlacedOn // ignore: cast_nullable_to_non_nullable
              as List<Resource>?,
      restValue: freezed == restValue
          ? _value.restValue
          : restValue // ignore: cast_nullable_to_non_nullable
              as double?,
      storeCost: freezed == storeCost
          ? _value.storeCost
          : storeCost // ignore: cast_nullable_to_non_nullable
              as int?,
      spawnedResourceHitboxWidth: freezed == spawnedResourceHitboxWidth
          ? _value.spawnedResourceHitboxWidth
          : spawnedResourceHitboxWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      spawnedResourceHitboxHeight: freezed == spawnedResourceHitboxHeight
          ? _value.spawnedResourceHitboxHeight
          : spawnedResourceHitboxHeight // ignore: cast_nullable_to_non_nullable
              as double?,
      spawnedResourceHitboxOffsetX: null == spawnedResourceHitboxOffsetX
          ? _value.spawnedResourceHitboxOffsetX
          : spawnedResourceHitboxOffsetX // ignore: cast_nullable_to_non_nullable
              as double,
      spawnedResourceHitboxOffsetY: null == spawnedResourceHitboxOffsetY
          ? _value.spawnedResourceHitboxOffsetY
          : spawnedResourceHitboxOffsetY // ignore: cast_nullable_to_non_nullable
              as double,
      smeltsInto: freezed == smeltsInto
          ? _value.smeltsInto
          : smeltsInto // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResourceImpl extends _Resource {
  const _$ResourceImpl(
      {required this.identifier,
      required this.name,
      required this.namePlural,
      required this.assetFileName16,
      this.description = defaultDescription,
      this.assetFileNameLarge,
      this.assetFileNameWhenFull,
      this.isLiquid = false,
      this.amountPerSlot = 25,
      final List<Ingredient> ingredients = const [],
      this.interactionRadius = 32.0,
      this.secondsToSmelt,
      this.secondsToCraft,
      this.secondsToMine,
      this.miningToolRequiredIdentifier,
      this.hungerDecreaseOnConsumption = 0,
      this.thirstDecreaseOnConsumption = 0,
      this.canPlace = false,
      this.canPickUp = false,
      this.canConstruct = false,
      this.canSmelt = false,
      this.placementWidth = TILE_SIZE,
      this.placementHeight = TILE_SIZE,
      final List<Resource> requiredToMine = const [],
      this.slots = 0,
      @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson)
      this.storageType = StorageType.none,
      this.resourcesPerSlot = 0,
      this.outputSlotSize = 0,
      this.isSeed = false,
      this.secondsToGrow = 5,
      this.growsInto,
      this.farmYieldMin = 1,
      this.farmYieldMax = 1,
      this.contentsWillSell = false,
      this.saleValue = 0,
      this.miningOutputResource,
      final List<Resource>? canOnlyBePlacedOn = null,
      this.restValue,
      this.storeCost,
      this.spawnedResourceHitboxWidth,
      this.spawnedResourceHitboxHeight,
      this.spawnedResourceHitboxOffsetX = 0.0,
      this.spawnedResourceHitboxOffsetY = 0.0,
      this.smeltsInto})
      : _ingredients = ingredients,
        _requiredToMine = requiredToMine,
        _canOnlyBePlacedOn = canOnlyBePlacedOn,
        super._();

  factory _$ResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResourceImplFromJson(json);

  @override
  final String identifier;
  @override
  final String name;
  @override
  final String namePlural;
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
  @JsonKey()
  final double interactionRadius;
  @override
  final double? secondsToSmelt;
  @override
  final double? secondsToCraft;
  @override
  final double? secondsToMine;
  @override
  final String? miningToolRequiredIdentifier;
  @override
  @JsonKey()
  final double hungerDecreaseOnConsumption;
  @override
  @JsonKey()
  final double thirstDecreaseOnConsumption;
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
  final bool canSmelt;
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
  @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson)
  final StorageType storageType;
  @override
  @JsonKey()
  final int resourcesPerSlot;
  @override
  @JsonKey()
  final int outputSlotSize;
  @override
  @JsonKey()
  final bool isSeed;
  @override
  @JsonKey()
  final int secondsToGrow;
  @override
  final Resource? growsInto;
  @override
  @JsonKey()
  final int farmYieldMin;
  @override
  @JsonKey()
  final int farmYieldMax;
  @override
  @JsonKey()
  final bool contentsWillSell;
  @override
  @JsonKey()
  final int saleValue;
  @override
  final Resource? miningOutputResource;
  final List<Resource>? _canOnlyBePlacedOn;
  @override
  @JsonKey()
  List<Resource>? get canOnlyBePlacedOn {
    final value = _canOnlyBePlacedOn;
    if (value == null) return null;
    if (_canOnlyBePlacedOn is EqualUnmodifiableListView)
      return _canOnlyBePlacedOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? restValue;
  @override
  final int? storeCost;
  @override
  final double? spawnedResourceHitboxWidth;
  @override
  final double? spawnedResourceHitboxHeight;
  @override
  @JsonKey()
  final double spawnedResourceHitboxOffsetX;
  @override
  @JsonKey()
  final double spawnedResourceHitboxOffsetY;
  @override
  final String? smeltsInto;

  @override
  String toString() {
    return 'Resource(identifier: $identifier, name: $name, namePlural: $namePlural, assetFileName16: $assetFileName16, description: $description, assetFileNameLarge: $assetFileNameLarge, assetFileNameWhenFull: $assetFileNameWhenFull, isLiquid: $isLiquid, amountPerSlot: $amountPerSlot, ingredients: $ingredients, interactionRadius: $interactionRadius, secondsToSmelt: $secondsToSmelt, secondsToCraft: $secondsToCraft, secondsToMine: $secondsToMine, miningToolRequiredIdentifier: $miningToolRequiredIdentifier, hungerDecreaseOnConsumption: $hungerDecreaseOnConsumption, thirstDecreaseOnConsumption: $thirstDecreaseOnConsumption, canPlace: $canPlace, canPickUp: $canPickUp, canConstruct: $canConstruct, canSmelt: $canSmelt, placementWidth: $placementWidth, placementHeight: $placementHeight, requiredToMine: $requiredToMine, slots: $slots, storageType: $storageType, resourcesPerSlot: $resourcesPerSlot, outputSlotSize: $outputSlotSize, isSeed: $isSeed, secondsToGrow: $secondsToGrow, growsInto: $growsInto, farmYieldMin: $farmYieldMin, farmYieldMax: $farmYieldMax, contentsWillSell: $contentsWillSell, saleValue: $saleValue, miningOutputResource: $miningOutputResource, canOnlyBePlacedOn: $canOnlyBePlacedOn, restValue: $restValue, storeCost: $storeCost, spawnedResourceHitboxWidth: $spawnedResourceHitboxWidth, spawnedResourceHitboxHeight: $spawnedResourceHitboxHeight, spawnedResourceHitboxOffsetX: $spawnedResourceHitboxOffsetX, spawnedResourceHitboxOffsetY: $spawnedResourceHitboxOffsetY, smeltsInto: $smeltsInto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.namePlural, namePlural) ||
                other.namePlural == namePlural) &&
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
            (identical(other.interactionRadius, interactionRadius) ||
                other.interactionRadius == interactionRadius) &&
            (identical(other.secondsToSmelt, secondsToSmelt) ||
                other.secondsToSmelt == secondsToSmelt) &&
            (identical(other.secondsToCraft, secondsToCraft) ||
                other.secondsToCraft == secondsToCraft) &&
            (identical(other.secondsToMine, secondsToMine) ||
                other.secondsToMine == secondsToMine) &&
            (identical(other.miningToolRequiredIdentifier, miningToolRequiredIdentifier) ||
                other.miningToolRequiredIdentifier ==
                    miningToolRequiredIdentifier) &&
            (identical(other.hungerDecreaseOnConsumption, hungerDecreaseOnConsumption) ||
                other.hungerDecreaseOnConsumption ==
                    hungerDecreaseOnConsumption) &&
            (identical(other.thirstDecreaseOnConsumption, thirstDecreaseOnConsumption) ||
                other.thirstDecreaseOnConsumption ==
                    thirstDecreaseOnConsumption) &&
            (identical(other.canPlace, canPlace) ||
                other.canPlace == canPlace) &&
            (identical(other.canPickUp, canPickUp) ||
                other.canPickUp == canPickUp) &&
            (identical(other.canConstruct, canConstruct) ||
                other.canConstruct == canConstruct) &&
            (identical(other.canSmelt, canSmelt) ||
                other.canSmelt == canSmelt) &&
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
                other.outputSlotSize == outputSlotSize) &&
            (identical(other.isSeed, isSeed) || other.isSeed == isSeed) &&
            (identical(other.secondsToGrow, secondsToGrow) ||
                other.secondsToGrow == secondsToGrow) &&
            (identical(other.growsInto, growsInto) ||
                other.growsInto == growsInto) &&
            (identical(other.farmYieldMin, farmYieldMin) ||
                other.farmYieldMin == farmYieldMin) &&
            (identical(other.farmYieldMax, farmYieldMax) ||
                other.farmYieldMax == farmYieldMax) &&
            (identical(other.contentsWillSell, contentsWillSell) ||
                other.contentsWillSell == contentsWillSell) &&
            (identical(other.saleValue, saleValue) || other.saleValue == saleValue) &&
            (identical(other.miningOutputResource, miningOutputResource) || other.miningOutputResource == miningOutputResource) &&
            const DeepCollectionEquality().equals(other._canOnlyBePlacedOn, _canOnlyBePlacedOn) &&
            (identical(other.restValue, restValue) || other.restValue == restValue) &&
            (identical(other.storeCost, storeCost) || other.storeCost == storeCost) &&
            (identical(other.spawnedResourceHitboxWidth, spawnedResourceHitboxWidth) || other.spawnedResourceHitboxWidth == spawnedResourceHitboxWidth) &&
            (identical(other.spawnedResourceHitboxHeight, spawnedResourceHitboxHeight) || other.spawnedResourceHitboxHeight == spawnedResourceHitboxHeight) &&
            (identical(other.spawnedResourceHitboxOffsetX, spawnedResourceHitboxOffsetX) || other.spawnedResourceHitboxOffsetX == spawnedResourceHitboxOffsetX) &&
            (identical(other.spawnedResourceHitboxOffsetY, spawnedResourceHitboxOffsetY) || other.spawnedResourceHitboxOffsetY == spawnedResourceHitboxOffsetY) &&
            (identical(other.smeltsInto, smeltsInto) || other.smeltsInto == smeltsInto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        identifier,
        name,
        namePlural,
        assetFileName16,
        description,
        assetFileNameLarge,
        assetFileNameWhenFull,
        isLiquid,
        amountPerSlot,
        const DeepCollectionEquality().hash(_ingredients),
        interactionRadius,
        secondsToSmelt,
        secondsToCraft,
        secondsToMine,
        miningToolRequiredIdentifier,
        hungerDecreaseOnConsumption,
        thirstDecreaseOnConsumption,
        canPlace,
        canPickUp,
        canConstruct,
        canSmelt,
        placementWidth,
        placementHeight,
        const DeepCollectionEquality().hash(_requiredToMine),
        slots,
        storageType,
        resourcesPerSlot,
        outputSlotSize,
        isSeed,
        secondsToGrow,
        growsInto,
        farmYieldMin,
        farmYieldMax,
        contentsWillSell,
        saleValue,
        miningOutputResource,
        const DeepCollectionEquality().hash(_canOnlyBePlacedOn),
        restValue,
        storeCost,
        spawnedResourceHitboxWidth,
        spawnedResourceHitboxHeight,
        spawnedResourceHitboxOffsetX,
        spawnedResourceHitboxOffsetY,
        smeltsInto
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      __$$ResourceImplCopyWithImpl<_$ResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResourceImplToJson(
      this,
    );
  }
}

abstract class _Resource extends Resource {
  const factory _Resource(
      {required final String identifier,
      required final String name,
      required final String namePlural,
      required final String assetFileName16,
      final String description,
      final String? assetFileNameLarge,
      final String? assetFileNameWhenFull,
      final bool isLiquid,
      final int amountPerSlot,
      final List<Ingredient> ingredients,
      final double interactionRadius,
      final double? secondsToSmelt,
      final double? secondsToCraft,
      final double? secondsToMine,
      final String? miningToolRequiredIdentifier,
      final double hungerDecreaseOnConsumption,
      final double thirstDecreaseOnConsumption,
      final bool canPlace,
      final bool canPickUp,
      final bool canConstruct,
      final bool canSmelt,
      final double placementWidth,
      final double placementHeight,
      final List<Resource> requiredToMine,
      final int slots,
      @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson)
      final StorageType storageType,
      final int resourcesPerSlot,
      final int outputSlotSize,
      final bool isSeed,
      final int secondsToGrow,
      final Resource? growsInto,
      final int farmYieldMin,
      final int farmYieldMax,
      final bool contentsWillSell,
      final int saleValue,
      final Resource? miningOutputResource,
      final List<Resource>? canOnlyBePlacedOn,
      final double? restValue,
      final int? storeCost,
      final double? spawnedResourceHitboxWidth,
      final double? spawnedResourceHitboxHeight,
      final double spawnedResourceHitboxOffsetX,
      final double spawnedResourceHitboxOffsetY,
      final String? smeltsInto}) = _$ResourceImpl;
  const _Resource._() : super._();

  factory _Resource.fromJson(Map<String, dynamic> json) =
      _$ResourceImpl.fromJson;

  @override
  String get identifier;
  @override
  String get name;
  @override
  String get namePlural;
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
  double get interactionRadius;
  @override
  double? get secondsToSmelt;
  @override
  double? get secondsToCraft;
  @override
  double? get secondsToMine;
  @override
  String? get miningToolRequiredIdentifier;
  @override
  double get hungerDecreaseOnConsumption;
  @override
  double get thirstDecreaseOnConsumption;
  @override
  bool get canPlace;
  @override
  bool get canPickUp;
  @override
  bool get canConstruct;
  @override
  bool get canSmelt;
  @override
  double get placementWidth;
  @override
  double get placementHeight;
  @override
  List<Resource> get requiredToMine;
  @override
  int get slots;
  @override
  @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson)
  StorageType get storageType;
  @override
  int get resourcesPerSlot;
  @override
  int get outputSlotSize;
  @override
  bool get isSeed;
  @override
  int get secondsToGrow;
  @override
  Resource? get growsInto;
  @override
  int get farmYieldMin;
  @override
  int get farmYieldMax;
  @override
  bool get contentsWillSell;
  @override
  int get saleValue;
  @override
  Resource? get miningOutputResource;
  @override
  List<Resource>? get canOnlyBePlacedOn;
  @override
  double? get restValue;
  @override
  int? get storeCost;
  @override
  double? get spawnedResourceHitboxWidth;
  @override
  double? get spawnedResourceHitboxHeight;
  @override
  double get spawnedResourceHitboxOffsetX;
  @override
  double get spawnedResourceHitboxOffsetY;
  @override
  String? get smeltsInto;
  @override
  @JsonKey(ignore: true)
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
