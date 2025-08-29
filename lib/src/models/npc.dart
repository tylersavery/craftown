import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/models/inventory_slot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'npc.freezed.dart';
part 'npc.g.dart';

enum NpcTier {
  apprentice(1, 5, "Apprentice"),
  journeyman(2, 10, "Journeyman"),
  expert(3, 15, "Expert"),
  master(4, 20, "Master");

  const NpcTier(this.level, this.inventorySlots, this.displayName);
  
  final int level;
  final int inventorySlots;
  final String displayName;
}

enum NpcState {
  idle,
  walkingToTarget,
  workingAtMachine,
  carryingItems,
  resting,
  eating,
  drinking,
  goingHome,
  sleeping,
}

enum NpcTask {
  none,
  transportItems,
  collectFromMachine,
  deliverToMachine,
}

@freezed
class Npc with _$Npc {
  const Npc._();

  const factory Npc({
    required String id,
    required String name,
    required Character character,
    required NpcTier tier,
    @Default(NpcState.idle) NpcState state,
    @Default(NpcTask.none) NpcTask currentTask,
    @Default([]) List<InventorySlot> inventory,
    @Default(100.0) double hunger,
    @Default(100.0) double thirst,
    @Default(100.0) double energy,
    @Default(0.0) double tileX,
    @Default(0.0) double tileY,
    String? targetMachineId,
    String? sourceMachineId,
    String? destinationMachineId,
    String? itemToTransport,
    @Default(0) int itemQuantityToTransport,
    @Default(0.0) double lastWorkTime,
    @Default(0.0) double lastRestTime,
    @Default(8.0) double maxWorkHours,
    @Default(16.0) double minRestHours,
  }) = _Npc;

  factory Npc.fromJson(Map<String, dynamic> json) => _$NpcFromJson(json);

  bool get isHungry => hunger < 30.0;
  bool get isThirsty => thirst < 30.0;
  bool get isTired => energy < 20.0;
  
  bool get needsBreak => isHungry || isThirsty || isTired;
  
  bool get isWorking => [
    NpcState.walkingToTarget,
    NpcState.workingAtMachine,
    NpcState.carryingItems,
  ].contains(state);
  
  bool get isResting => [
    NpcState.resting,
    NpcState.eating,
    NpcState.drinking,
    NpcState.goingHome,
    NpcState.sleeping,
  ].contains(state);

  bool get canCarryItem => inventory.length < tier.inventorySlots;
  
  int get availableInventorySlots => tier.inventorySlots - inventory.length;
}