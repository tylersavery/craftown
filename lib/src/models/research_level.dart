import 'package:craftown/src/models/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'research_level.freezed.dart';
part 'research_level.g.dart';

@freezed
class ResearchLevel with _$ResearchLevel {
  const ResearchLevel._();

  const factory ResearchLevel({
    required String identifier,
    required String name,
    @Default([]) List<ResearchLevel> prerequisites,
    required Duration timeToUnlock,
    required List<Ingredient> cost,
  }) = _ResearchLevel;

  factory ResearchLevel.fromJson(Map<String, dynamic> json) => _$ResearchLevelFromJson(json);
}
