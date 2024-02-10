import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_step.freezed.dart';
part 'tutorial_step.g.dart';

@freezed
class TutorialStep with _$TutorialStep {
  const TutorialStep._();

  const factory TutorialStep({
    required int index,
    required String name,
    required String description,
    @Default([]) List<Ingredient> resourcesRequired,
    @Default([]) List<Ingredient> placedResourcesRequired,
  }) = _TutorialStep;

  factory TutorialStep.fromJson(Map<String, dynamic> json) => _$TutorialStepFromJson(json);
}
