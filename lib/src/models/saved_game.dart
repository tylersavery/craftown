import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/models/inventory_slot.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'saved_game.freezed.dart';
part 'saved_game.g.dart';

@freezed
class SavedGame with _$SavedGame {
  const SavedGame._();

  const factory SavedGame({
    required Character character,
    required DateTime savedAt,
    @Default([]) List<InventorySlot> inventory,
    required double playerPositionX,
    required double playerPositionY,
    @Default([]) List<PlacedResource> placedResources,
  }) = _SavedGame;

  factory SavedGame.fromJson(Map<String, dynamic> json) => _$SavedGameFromJson(json);

  String get savedAtLabel {
    return DateFormat('MM/dd').add_jms().format(savedAt);
  }

  String get label {
    return "${character.name} - $savedAtLabel";
  }
}
