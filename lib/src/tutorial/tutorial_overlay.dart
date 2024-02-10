import 'package:craftown/src/tutorial/tutorial_provider.dart';
import 'package:craftown/src/tutorial/tutorial_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TutorialOverlay extends ConsumerWidget {
  const TutorialOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tutorialStep = ref.watch(tutorialProvider);

    if (tutorialStep == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black38,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Tutorial (${(tutorialStep.index + 1)}/${TutorialSteps.allSteps.length})",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
              Text(
                tutorialStep.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300),
                child: Text(
                  tutorialStep.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
