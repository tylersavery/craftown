import 'package:craftown/src/screens/game_screen.dart';
import 'package:craftown/src/providers/app_provider.dart';
import 'package:craftown/src/screens/character_selector_screen.dart';
import 'package:craftown/src/screens/main_menu_screen.dart';
import 'package:craftown/src/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);

    return Builder(builder: (context) {
      switch (state) {
        case AppState.characterSelection:
          return CharacterSelectorScreen();
        case AppState.overview:
          return OverviewScreen();
        case AppState.inGame:
          return GameScreen();
        default:
          return MainMenuScreen();
      }
    });
  }
}
