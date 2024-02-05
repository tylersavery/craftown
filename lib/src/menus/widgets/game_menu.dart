import 'package:craftown/src/constants.dart';
import 'package:craftown/src/menus/providers/game_menu_provider.dart';
import 'package:craftown/src/menus/models/game_menu_state.dart';
import 'package:craftown/src/providers/saved_game_list_provider.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameMenuWidget extends ConsumerWidget {
  const GameMenuWidget({super.key});

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
        padding: const EdgeInsets.all(0),
        child: Builder(builder: (context) {
          switch (subMenu) {
            case null:
              return _RootMenu();
            case SubMenu.saveGame:
              return _SaveGameMenu();
            case SubMenu.loadGame:
              return _LoadGameMenu();
          }
        }),
      ),
    );
  }
}

class _RootMenu extends ConsumerWidget {
  const _RootMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 8),
          _MenuItem(
            label: "Save Game",
            onPressed: () {
              ref.read(gameMenuProvider.notifier).showSaveGameSubmenu();

              // ref.read(savedGameProvider.notifier).saveGame();
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
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _SaveGameMenu extends ConsumerWidget {
  const _SaveGameMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saves = ref.watch(savedGameListProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 300,
        maxWidth: GAME_MENU_WIDTH,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _MenuItem(
            label: "New Save",
            onPressed: () async {
              final String? filename = await showDialog(
                context: context,
                builder: (context) {
                  final controller = TextEditingController();
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    contentPadding: EdgeInsets.zero,
                    insetPadding: EdgeInsets.zero,
                    buttonPadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.zero,
                    actionsPadding: EdgeInsets.zero,
                    iconPadding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 4, right: 8),
                      child: Text(
                        "Save Game",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 3),
                      child: Container(
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            controller: controller,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Filename",
                              contentPadding: EdgeInsets.zero,
                              counterText: null,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            autofocus: true,
                            autocorrect: false,
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(null);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(controller.text);
                        },
                        child: Text("Save"),
                      )
                    ],
                  );
                },
              );

              if (filename == null) {
                return;
              }
              ref.read(savedGameListProvider.notifier).saveGame(filename);
              ref.read(gameMenuProvider.notifier).backToRoot();
            },
          ),
          _MenuItem(
            label: "Cancel",
            onPressed: () {
              ref.read(gameMenuProvider.notifier).backToRoot();
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: saves.length,
            itemBuilder: (context, index) {
              final save = saves[index];

              return _MenuItem(
                label: save.label,
                onPressed: () {
                  ref.read(savedGameListProvider.notifier).saveGame(save.fileName, overwrite: save);
                  ref.read(gameMenuProvider.notifier).backToRoot();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LoadGameMenu extends ConsumerWidget {
  const _LoadGameMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saves = ref.watch(savedGameListProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 300,
        maxWidth: GAME_MENU_WIDTH,
      ),
      child: SingleChildScrollView(
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
            ListView.builder(
              shrinkWrap: true,
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
          ],
        ),
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          color: Colors.black12,
          width: GAME_MENU_WIDTH - 32,
          height: 28,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
