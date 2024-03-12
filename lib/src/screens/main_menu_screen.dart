import 'dart:io';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/menus/widgets/game_menu.dart';
import 'package:craftown/src/providers/app_provider.dart';
import 'package:craftown/src/providers/saved_game_list_provider.dart';
import 'package:craftown/src/utils/dialogs.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainMenuScreen extends ConsumerWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/menu_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400, maxHeight: 200),
                  child: Image.asset(
                    'assets/images/logo_light.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Button(
                    label: "New Game",
                    onPressed: () {
                      ref.read(appProvider.notifier).set(AppState.characterSelection);
                    },
                  ),
                  _Button(
                    label: "Load Game",
                    onPressed: () async {
                      await ref.read(savedGameListProvider.notifier).loadList();
                      ref.read(appProvider.notifier).set(AppState.mainMenuLoadingGame);
                    },
                  ),
                  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux))
                    _Button(
                      label: "Quit Game",
                      onPressed: () async {
                        final confirmed = await ConfirmDialog.show(
                          context: context,
                          title: "Quit to Desktop?",
                          body: "Are you sure you want to quit to desktop? All unsaved changes will be lost.",
                        );
                        if (confirmed) {
                          exit(0);
                        }
                      },
                    ),
                ],
              ),
            ),
            if (ref.watch(appProvider) == AppState.mainMenuLoadingGame)
              Center(
                child: MenuContainer(
                  title: "Load Game",
                  handleClose: () {
                    ref.read(appProvider.notifier).set(AppState.mainMenu);
                  },
                  width: GAME_MENU_WIDTH,
                  child: LoadGameMenu(onSelectOverride: (save) {
                    ref.read(savedGameListProvider.notifier).loadGame(save);
                    ref.read(appProvider.notifier).set(AppState.inGame);
                  }, onCancelOverride: () {
                    ref.read(appProvider.notifier).set(AppState.mainMenu);
                  }),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "v$VERSION",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const _Button({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 28,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
