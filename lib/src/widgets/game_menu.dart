import 'package:craftown/src/constants.dart';
import 'package:craftown/src/models/game_menu_state.dart';
import 'package:craftown/src/providers/game_menu_provider.dart';
import 'package:craftown/src/providers/saved_games_provider.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameMenu extends ConsumerWidget {
  const GameMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subMenu = ref.watch(gameMenuProvider).subMenuVisible;

    return MenuContainer(
      title: "Menu${subMenu != null ? ': ${subMenu.label}' : ''}",
      handleClose: () {
        ref.read(gameMenuProvider.notifier).close();
      },
      width: GAME_MENU_WIDTH,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(builder: (context) {
          switch (subMenu) {
            case null:
              return _RootMenu();
            case SubMenu.loadGame:
              return _LoadGameMenu();
          }
        }),
      ),
    );
  }
}

class _RootMenu extends ConsumerWidget {
  const _RootMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _MenuItem(
          label: "Save Game",
          onPressed: () {
            ref.read(savedGameProvider.notifier).saveGame();
          },
        ),
        _MenuItem(
          label: "Load Game",
          onPressed: () async {
            await ref.read(gameMenuProvider.notifier).showLoadGameSubmenu();
          },
        ),
        _MenuItem(
          label: "Settings",
          onPressed: () {},
        ),
        _MenuItem(
          label: "Help",
          onPressed: () {},
        ),
        _MenuItem(
          label: "Back to Game",
          onPressed: () {
            ref.read(gameMenuProvider.notifier).close();
          },
        ),
        _MenuItem(
          label: "Quit to Menu",
          onPressed: () {},
        ),
        _MenuItem(
          label: "Quit to Desktop",
          onPressed: () {},
        ),
      ],
    );
  }
}

class _LoadGameMenu extends ConsumerWidget {
  const _LoadGameMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saves = ref.watch(savedGameProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 300,
        maxWidth: GAME_MENU_WIDTH - 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _MenuItem(
            label: "Cancel",
            onPressed: () {
              ref.read(gameMenuProvider.notifier).backToRoot();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: saves.length,
              itemBuilder: (context, index) {
                final save = saves[index];

                return _MenuItem(
                    label: save.label,
                    onPressed: () {
                      ref.read(gameMenuProvider.notifier).loadGame(save);
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const _MenuItem({
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          color: Colors.black12,
          width: GAME_MENU_WIDTH - 32,
          height: 32,
          child: Center(
              child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
            ),
          )),
        ),
      ),
    );
  }
}
