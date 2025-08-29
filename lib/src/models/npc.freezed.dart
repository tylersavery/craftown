// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'npc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Npc _$NpcFromJson(Map<String, dynamic> json) {
  return _Npc.fromJson(json);
}

/// @nodoc
mixin _$Npc {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Character get character => throw _privateConstructorUsedError;
  NpcTier get tier => throw _privateConstructorUsedError;
  NpcState get state => throw _privateConstructorUsedError;
  NpcTask get currentTask => throw _privateConstructorUsedError;
  List<InventorySlot> get inventory => throw _privateConstructorUsedError;
  double get hunger => throw _privateConstructorUsedError;
  double get thirst => throw _privateConstructorUsedError;
  double get energy => throw _privateConstructorUsedError;
  double get tileX => throw _privateConstructorUsedError;
  double get tileY => throw _privateConstructorUsedError;
  String? get targetMachineId => throw _privateConstructorUsedError;
  String? get sourceMachineId => throw _privateConstructorUsedError;
  String? get destinationMachineId => throw _privateConstructorUsedError;
  String? get itemToTransport => throw _privateConstructorUsedError;
  int get itemQuantityToTransport => throw _privateConstructorUsedError;
  double get lastWorkTime => throw _privateConstructorUsedError;
  double get lastRestTime => throw _privateConstructorUsedError;
  double get maxWorkHours => throw _privateConstructorUsedError;
  double get minRestHours => throw _privateConstructorUsedError;

  /// Serializes this Npc to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Npc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NpcCopyWith<Npc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NpcCopyWith<$Res> {
  factory $NpcCopyWith(Npc value, $Res Function(Npc) then) =
      _$NpcCopyWithImpl<$Res, Npc>;
  @useResult
  $Res call(
      {String id,
      String name,
      Character character,
      NpcTier tier,
      NpcState state,
      NpcTask currentTask,
      List<InventorySlot> inventory,
      double hunger,
      double thirst,
      double energy,
      double tileX,
      double tileY,
      String? targetMachineId,
      String? sourceMachineId,
      String? destinationMachineId,
      String? itemToTransport,
      int itemQuantityToTransport,
      double lastWorkTime,
      double lastRestTime,
      double maxWorkHours,
      double minRestHours});

  $CharacterCopyWith<$Res> get character;
}

/// @nodoc
class _$NpcCopyWithImpl<$Res, $Val extends Npc> implements $NpcCopyWith<$Res> {
  _$NpcCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Npc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = null,
    Object? tier = null,
    Object? state = null,
    Object? currentTask = null,
    Object? inventory = null,
    Object? hunger = null,
    Object? thirst = null,
    Object? energy = null,
    Object? tileX = null,
    Object? tileY = null,
    Object? targetMachineId = freezed,
    Object? sourceMachineId = freezed,
    Object? destinationMachineId = freezed,
    Object? itemToTransport = freezed,
    Object? itemQuantityToTransport = null,
    Object? lastWorkTime = null,
    Object? lastRestTime = null,
    Object? maxWorkHours = null,
    Object? minRestHours = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as NpcTier,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NpcState,
      currentTask: null == currentTask
          ? _value.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as NpcTask,
      inventory: null == inventory
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventorySlot>,
      hunger: null == hunger
          ? _value.hunger
          : hunger // ignore: cast_nullable_to_non_nullable
              as double,
      thirst: null == thirst
          ? _value.thirst
          : thirst // ignore: cast_nullable_to_non_nullable
              as double,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      tileX: null == tileX
          ? _value.tileX
          : tileX // ignore: cast_nullable_to_non_nullable
              as double,
      tileY: null == tileY
          ? _value.tileY
          : tileY // ignore: cast_nullable_to_non_nullable
              as double,
      targetMachineId: freezed == targetMachineId
          ? _value.targetMachineId
          : targetMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceMachineId: freezed == sourceMachineId
          ? _value.sourceMachineId
          : sourceMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationMachineId: freezed == destinationMachineId
          ? _value.destinationMachineId
          : destinationMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemToTransport: freezed == itemToTransport
          ? _value.itemToTransport
          : itemToTransport // ignore: cast_nullable_to_non_nullable
              as String?,
      itemQuantityToTransport: null == itemQuantityToTransport
          ? _value.itemQuantityToTransport
          : itemQuantityToTransport // ignore: cast_nullable_to_non_nullable
              as int,
      lastWorkTime: null == lastWorkTime
          ? _value.lastWorkTime
          : lastWorkTime // ignore: cast_nullable_to_non_nullable
              as double,
      lastRestTime: null == lastRestTime
          ? _value.lastRestTime
          : lastRestTime // ignore: cast_nullable_to_non_nullable
              as double,
      maxWorkHours: null == maxWorkHours
          ? _value.maxWorkHours
          : maxWorkHours // ignore: cast_nullable_to_non_nullable
              as double,
      minRestHours: null == minRestHours
          ? _value.minRestHours
          : minRestHours // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of Npc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get character {
    return $CharacterCopyWith<$Res>(_value.character, (value) {
      return _then(_value.copyWith(character: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NpcImplCopyWith<$Res> implements $NpcCopyWith<$Res> {
  factory _$$NpcImplCopyWith(_$NpcImpl value, $Res Function(_$NpcImpl) then) =
      __$$NpcImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Character character,
      NpcTier tier,
      NpcState state,
      NpcTask currentTask,
      List<InventorySlot> inventory,
      double hunger,
      double thirst,
      double energy,
      double tileX,
      double tileY,
      String? targetMachineId,
      String? sourceMachineId,
      String? destinationMachineId,
      String? itemToTransport,
      int itemQuantityToTransport,
      double lastWorkTime,
      double lastRestTime,
      double maxWorkHours,
      double minRestHours});

  @override
  $CharacterCopyWith<$Res> get character;
}

/// @nodoc
class __$$NpcImplCopyWithImpl<$Res> extends _$NpcCopyWithImpl<$Res, _$NpcImpl>
    implements _$$NpcImplCopyWith<$Res> {
  __$$NpcImplCopyWithImpl(_$NpcImpl _value, $Res Function(_$NpcImpl) _then)
      : super(_value, _then);

  /// Create a copy of Npc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = null,
    Object? tier = null,
    Object? state = null,
    Object? currentTask = null,
    Object? inventory = null,
    Object? hunger = null,
    Object? thirst = null,
    Object? energy = null,
    Object? tileX = null,
    Object? tileY = null,
    Object? targetMachineId = freezed,
    Object? sourceMachineId = freezed,
    Object? destinationMachineId = freezed,
    Object? itemToTransport = freezed,
    Object? itemQuantityToTransport = null,
    Object? lastWorkTime = null,
    Object? lastRestTime = null,
    Object? maxWorkHours = null,
    Object? minRestHours = null,
  }) {
    return _then(_$NpcImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as NpcTier,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NpcState,
      currentTask: null == currentTask
          ? _value.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as NpcTask,
      inventory: null == inventory
          ? _value._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventorySlot>,
      hunger: null == hunger
          ? _value.hunger
          : hunger // ignore: cast_nullable_to_non_nullable
              as double,
      thirst: null == thirst
          ? _value.thirst
          : thirst // ignore: cast_nullable_to_non_nullable
              as double,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      tileX: null == tileX
          ? _value.tileX
          : tileX // ignore: cast_nullable_to_non_nullable
              as double,
      tileY: null == tileY
          ? _value.tileY
          : tileY // ignore: cast_nullable_to_non_nullable
              as double,
      targetMachineId: freezed == targetMachineId
          ? _value.targetMachineId
          : targetMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceMachineId: freezed == sourceMachineId
          ? _value.sourceMachineId
          : sourceMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationMachineId: freezed == destinationMachineId
          ? _value.destinationMachineId
          : destinationMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemToTransport: freezed == itemToTransport
          ? _value.itemToTransport
          : itemToTransport // ignore: cast_nullable_to_non_nullable
              as String?,
      itemQuantityToTransport: null == itemQuantityToTransport
          ? _value.itemQuantityToTransport
          : itemQuantityToTransport // ignore: cast_nullable_to_non_nullable
              as int,
      lastWorkTime: null == lastWorkTime
          ? _value.lastWorkTime
          : lastWorkTime // ignore: cast_nullable_to_non_nullable
              as double,
      lastRestTime: null == lastRestTime
          ? _value.lastRestTime
          : lastRestTime // ignore: cast_nullable_to_non_nullable
              as double,
      maxWorkHours: null == maxWorkHours
          ? _value.maxWorkHours
          : maxWorkHours // ignore: cast_nullable_to_non_nullable
              as double,
      minRestHours: null == minRestHours
          ? _value.minRestHours
          : minRestHours // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NpcImpl extends _Npc {
  const _$NpcImpl(
      {required this.id,
      required this.name,
      required this.character,
      required this.tier,
      this.state = NpcState.idle,
      this.currentTask = NpcTask.none,
      final List<InventorySlot> inventory = const [],
      this.hunger = 100.0,
      this.thirst = 100.0,
      this.energy = 100.0,
      this.tileX = 0.0,
      this.tileY = 0.0,
      this.targetMachineId,
      this.sourceMachineId,
      this.destinationMachineId,
      this.itemToTransport,
      this.itemQuantityToTransport = 0,
      this.lastWorkTime = 0.0,
      this.lastRestTime = 0.0,
      this.maxWorkHours = 8.0,
      this.minRestHours = 16.0})
      : _inventory = inventory,
        super._();

  factory _$NpcImpl.fromJson(Map<String, dynamic> json) =>
      _$$NpcImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Character character;
  @override
  final NpcTier tier;
  @override
  @JsonKey()
  final NpcState state;
  @override
  @JsonKey()
  final NpcTask currentTask;
  final List<InventorySlot> _inventory;
  @override
  @JsonKey()
  List<InventorySlot> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  @override
  @JsonKey()
  final double hunger;
  @override
  @JsonKey()
  final double thirst;
  @override
  @JsonKey()
  final double energy;
  @override
  @JsonKey()
  final double tileX;
  @override
  @JsonKey()
  final double tileY;
  @override
  final String? targetMachineId;
  @override
  final String? sourceMachineId;
  @override
  final String? destinationMachineId;
  @override
  final String? itemToTransport;
  @override
  @JsonKey()
  final int itemQuantityToTransport;
  @override
  @JsonKey()
  final double lastWorkTime;
  @override
  @JsonKey()
  final double lastRestTime;
  @override
  @JsonKey()
  final double maxWorkHours;
  @override
  @JsonKey()
  final double minRestHours;

  @override
  String toString() {
    return 'Npc(id: $id, name: $name, character: $character, tier: $tier, state: $state, currentTask: $currentTask, inventory: $inventory, hunger: $hunger, thirst: $thirst, energy: $energy, tileX: $tileX, tileY: $tileY, targetMachineId: $targetMachineId, sourceMachineId: $sourceMachineId, destinationMachineId: $destinationMachineId, itemToTransport: $itemToTransport, itemQuantityToTransport: $itemQuantityToTransport, lastWorkTime: $lastWorkTime, lastRestTime: $lastRestTime, maxWorkHours: $maxWorkHours, minRestHours: $minRestHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NpcImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.currentTask, currentTask) ||
                other.currentTask == currentTask) &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory) &&
            (identical(other.hunger, hunger) || other.hunger == hunger) &&
            (identical(other.thirst, thirst) || other.thirst == thirst) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.tileX, tileX) || other.tileX == tileX) &&
            (identical(other.tileY, tileY) || other.tileY == tileY) &&
            (identical(other.targetMachineId, targetMachineId) ||
                other.targetMachineId == targetMachineId) &&
            (identical(other.sourceMachineId, sourceMachineId) ||
                other.sourceMachineId == sourceMachineId) &&
            (identical(other.destinationMachineId, destinationMachineId) ||
                other.destinationMachineId == destinationMachineId) &&
            (identical(other.itemToTransport, itemToTransport) ||
                other.itemToTransport == itemToTransport) &&
            (identical(
                    other.itemQuantityToTransport, itemQuantityToTransport) ||
                other.itemQuantityToTransport == itemQuantityToTransport) &&
            (identical(other.lastWorkTime, lastWorkTime) ||
                other.lastWorkTime == lastWorkTime) &&
            (identical(other.lastRestTime, lastRestTime) ||
                other.lastRestTime == lastRestTime) &&
            (identical(other.maxWorkHours, maxWorkHours) ||
                other.maxWorkHours == maxWorkHours) &&
            (identical(other.minRestHours, minRestHours) ||
                other.minRestHours == minRestHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        character,
        tier,
        state,
        currentTask,
        const DeepCollectionEquality().hash(_inventory),
        hunger,
        thirst,
        energy,
        tileX,
        tileY,
        targetMachineId,
        sourceMachineId,
        destinationMachineId,
        itemToTransport,
        itemQuantityToTransport,
        lastWorkTime,
        lastRestTime,
        maxWorkHours,
        minRestHours
      ]);

  /// Create a copy of Npc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NpcImplCopyWith<_$NpcImpl> get copyWith =>
      __$$NpcImplCopyWithImpl<_$NpcImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NpcImplToJson(
      this,
    );
  }
}

abstract class _Npc extends Npc {
  const factory _Npc(
      {required final String id,
      required final String name,
      required final Character character,
      required final NpcTier tier,
      final NpcState state,
      final NpcTask currentTask,
      final List<InventorySlot> inventory,
      final double hunger,
      final double thirst,
      final double energy,
      final double tileX,
      final double tileY,
      final String? targetMachineId,
      final String? sourceMachineId,
      final String? destinationMachineId,
      final String? itemToTransport,
      final int itemQuantityToTransport,
      final double lastWorkTime,
      final double lastRestTime,
      final double maxWorkHours,
      final double minRestHours}) = _$NpcImpl;
  const _Npc._() : super._();

  factory _Npc.fromJson(Map<String, dynamic> json) = _$NpcImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Character get character;
  @override
  NpcTier get tier;
  @override
  NpcState get state;
  @override
  NpcTask get currentTask;
  @override
  List<InventorySlot> get inventory;
  @override
  double get hunger;
  @override
  double get thirst;
  @override
  double get energy;
  @override
  double get tileX;
  @override
  double get tileY;
  @override
  String? get targetMachineId;
  @override
  String? get sourceMachineId;
  @override
  String? get destinationMachineId;
  @override
  String? get itemToTransport;
  @override
  int get itemQuantityToTransport;
  @override
  double get lastWorkTime;
  @override
  double get lastRestTime;
  @override
  double get maxWorkHours;
  @override
  double get minRestHours;

  /// Create a copy of Npc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NpcImplCopyWith<_$NpcImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
