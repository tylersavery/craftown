import 'package:craftown/src/models/calendar_state.dart';
import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/models/farmland.dart';
import 'package:craftown/src/models/inventory_slot.dart';
import 'package:craftown/src/models/placed_farmland.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/research_level.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/stats.dart';
import 'package:craftown/src/tutorial/tutorial_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'saved_game.freezed.dart';
part 'saved_game.g.dart';

@freezed
class SavedGame with _$SavedGame {
  const SavedGame._();

  const factory SavedGame({
    required String identifier,
    required String fileName,
    required Character character,
    required DateTime savedAt,
    @Default([]) List<InventorySlot> inventory,
    required double playerPositionX,
    required double playerPositionY,
    @Default([]) List<PlacedResource> placedResources,
    required Stats stats,
    Resource? inHand,
    @Default([]) List<Farmland> farmlands,
    @Default([]) List<ResearchLevel> researchLevels,
    ResearchLevel? isResearching,
    DateTime? researchStarted,
    required CalendarState calendarState,
    @Default([]) List<PlacedFarmland> placedFarmlands,
    TutorialStep? tutorialStep,
  }) = _SavedGame;

  factory SavedGame.fromJson(Map<String, dynamic> json) => _$SavedGameFromJson(json);

  String get savedAtLabel {
    return DateFormat('MM/dd').add_jms().format(savedAt);
  }

  String get label {
    return "$fileName - $savedAtLabel";
  }
}
