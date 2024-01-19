import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_slot.freezed.dart';

@freezed
class InventorySlot with _$InventorySlot {
  const factory InventorySlot({
    Resource? resource,
    @Default(0) int count,
  }) = _InventorySlot;
}
