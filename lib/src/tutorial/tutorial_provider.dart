import 'package:craftown/src/models/toast_message.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/tutorial/tutorial_step.dart';
import 'package:craftown/src/tutorial/tutorial_steps.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tutorial_provider.g.dart';

@Riverpod(keepAlive: true)
class Tutorial extends _$Tutorial {
  @override
  TutorialStep? build() {
    return TutorialSteps.step0;
  }

  void set(TutorialStep? step) {
    state = step;
    if (step != null) {
      checkProgress();
    }
  }

  void nextStep() {
    if (state == null) {
      state = TutorialSteps.step0;
    } else {
      final newIndex = state!.index + 1;

      if (newIndex > TutorialSteps.allSteps.length - 1) {
        completeTutorial();
        return;
      }

      state = TutorialSteps.allSteps[newIndex];
      checkProgress();
    }
  }

  void completeTutorial() {
    state = null;
    ref.read(toastMessagesListProvider.notifier).add(
          "Tutorial Completed!",
          type: ToastMessageType.success,
        );
  }

  void checkProgress() {
    if (state == null) return;
    bool completed = true;

    if (state!.resourcesRequired.isNotEmpty) {
      for (final ingredient in state!.resourcesRequired) {
        if (!ref.read(inventoryMapProvider).containsKey(ingredient.resource.identifier)) {
          completed = false;
          break;
        }

        final count = ref.read(inventoryMapProvider)[ingredient.resource.identifier];

        if (count == null || count < ingredient.quantity) {
          completed = false;
          break;
        }
      }
    }

    if (state!.placedResourcesRequired.isNotEmpty) {
      for (final ingredient in state!.placedResourcesRequired) {
        final count =
            ref.read(placedResourcesListProvider).where((element) => element.sprite.resource.identifier == ingredient.resource.identifier).length;

        if (count < ingredient.quantity) {
          completed = false;
          break;
        }
      }
    }

    if (completed) {
      ref.read(toastMessagesListProvider.notifier).add("${state!.name} completed!");
      nextStep();
    }
  }
}
