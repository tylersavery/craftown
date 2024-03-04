import 'package:craftown/src/providers/app_provider.dart';
import 'package:craftown/src/providers/selected_character_provider.dart';
import 'package:craftown/src/utils/device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewScreen extends ConsumerWidget {
  final bool forOnboarding;
  const OverviewScreen({
    super.key,
    this.forOnboarding = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "How to Play",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'PixelifySans',
                    ),
                    children: [
                      TextSpan(text: "Welcome to Craftown, ${ref.watch(selectedCharacterProvider).name}!"),
                      TextSpan(text: "\n\n"),
                      TextSpan(
                          text: isTouchDevice(context)
                              ? "Use the joystick to walk around. Tap your screen to interact. Double tap for bulk actions."
                              : "Walk with the arrow keys or WASD. Click with your mouse to interact. Hold shift for bulk actions."),
                      TextSpan(text: "\n\n"),
                      TextSpan(text: "You've been provided with a few starting items to help get your adventure started."),
                      TextSpan(text: "\n\n"),
                      TextSpan(text: "Mine resources, craft items, automate your workflow."),
                      TextSpan(text: "\n\n"),
                      TextSpan(text: "Don't forget to watch your stats. If you get too tired, thirsty, or hungry, you will pass out."),
                      TextSpan(text: "\n\n"),
                      TextSpan(text: "Good luck, and have fun!"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(appProvider.notifier).set(AppState.inGame);
                  },
                  child: Text("Start Game"),
                ),
                SizedBox(
                  height: 16,
                ),
                if (forOnboarding)
                  TextButton(
                    onPressed: () {
                      ref.read(appProvider.notifier).set(AppState.characterSelection);
                    },
                    child: Text(
                      "Change Character",
                    ),
                  )
                else
                  TextButton(
                    onPressed: () {
                      ref.read(appProvider.notifier).set(AppState.inGame);
                    },
                    child: Text(
                      "Close",
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
