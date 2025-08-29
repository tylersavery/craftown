import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'npc_task.freezed.dart';
part 'npc_task.g.dart';

enum TaskType {
  transport,
  collect,
  deliver,
  automate,
}

enum TaskPriority {
  low(1),
  normal(5),
  high(10),
  urgent(20);
  
  const TaskPriority(this.weight);
  final int weight;
}

@freezed
class NpcTaskDefinition with _$NpcTaskDefinition {
  const NpcTaskDefinition._();

  const factory NpcTaskDefinition({
    required String id,
    required TaskType type,
    required String name,
    @Default(TaskPriority.normal) TaskPriority priority,
    @Default(true) bool enabled,
    String? sourceMachineId,
    String? destinationMachineId,
    Resource? itemFilter,
    @Default(0) int maxQuantityPerTrip,
    @Default(false) bool keepRunning,
    @Default(0.0) double createdAt,
  }) = _NpcTaskDefinition;

  factory NpcTaskDefinition.fromJson(Map<String, dynamic> json) => _$NpcTaskDefinitionFromJson(json);
  
  bool get isValid {
    switch (type) {
      case TaskType.transport:
      case TaskType.automate:
        return sourceMachineId != null && destinationMachineId != null;
      case TaskType.collect:
        return sourceMachineId != null;
      case TaskType.deliver:
        return destinationMachineId != null;
    }
  }
  
  String get description {
    switch (type) {
      case TaskType.transport:
        return "Transport ${itemFilter?.name ?? 'items'} from source to destination";
      case TaskType.collect:
        return "Collect ${itemFilter?.name ?? 'items'} from machine";
      case TaskType.deliver:
        return "Deliver ${itemFilter?.name ?? 'items'} to machine";
      case TaskType.automate:
        return "Automate ${itemFilter?.name ?? 'item'} transport";
    }
  }
}