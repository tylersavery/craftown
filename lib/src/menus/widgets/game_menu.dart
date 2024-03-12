import 'dart:io';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/menus/providers/game_menu_provider.dart';
import 'package:craftown/src/menus/models/game_menu_state.dart';
import 'package:craftown/src/models/saved_game.dart';
import 'package:craftown/src/providers/audio_provider.dart';
import 'package:craftown/src/providers/saved_game_list_provider.dart';
import 'package:craftown/src/utils/dialogs.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GameMenuWidget extends ConsumerWidget {
  const GameMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subMenu = ref.watch(gameMenuProvider).subMenuVisible;

    return MenuContainer(
      title: "Menu${subMenu != null ? ': ${subMenu.label}' : ''}",
      shortcutKey: subMenu == null ? "ESC" : null,
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
              return LoadGameMenu();
            case SubMenu.credits:
              return _CreditsGameMenu();
            case SubMenu.settings:
              return _SettingsGameMenu();
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
            label: "Credits",
            onPressed: () {
              ref.read(gameMenuProvider.notifier).showCreditsSubmenu();
            },
          ),
          _MenuItem(
            label: "Settings",
            onPressed: () {
              ref.read(gameMenuProvider.notifier).showSettingsMenu();
            },
          ),
          // _MenuItem(
          //   label: "Help",
          //   onPressed: () {},
          // ),

          _MenuItem(
            label: "Quit to Menu",
            onPressed: () async {
              final confirmed = await ConfirmDialog.show(
                context: context,
                title: "Quit to Menu?",
                body: "Are you sure you want to quit to menu? All unsaved changes will be lost.",
              );

              if (confirmed) {
                if (context.mounted) {
                  Phoenix.rebirth(context);
                }
              }
            },
          ),
          if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux))
            _MenuItem(
              label: "Quit to Desktop",
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
          SizedBox(
            height: 16,
          ),
          _MenuItem(
            label: "Back to Game",
            onPressed: () {
              ref.read(gameMenuProvider.notifier).close();
            },
          ),
          SizedBox(height: 8),
          Text(
            "Craftown v$VERSION",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _CreditsGameMenu extends ConsumerWidget {
  const _CreditsGameMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            // Text("Craftown was created by Tyler Savery of "),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontFamily: "PixelifySans",
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(text: "Craftown was created by"),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "Tyler Savery",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.green.shade700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrlString("https://www.youtube.com/channel/UCz0aDbkQ0mZh1VEBnhjD_JQ");
                        },
                    ),
                    TextSpan(text: " "),
                    TextSpan(text: "of"),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "The Young Astronauts",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.red.shade700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrlString("https://theyoungastronauts.com");
                        },
                    ),
                    TextSpan(text: "."),
                    TextSpan(text: " "),
                    TextSpan(text: "Many of the assets were create by"),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "Szadi art",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.purple.shade700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrlString("https://szadiart.itch.io/");
                        },
                    ),
                    TextSpan(text: "."),
                    TextSpan(text: " "),
                    TextSpan(text: "This project is currently"),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "open source",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.pink.shade600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrlString("https://github.com/tylersavery/craftown");
                        },
                    ),
                    TextSpan(text: " "),
                    TextSpan(text: "and was created for the"),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "Flutter",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent.shade700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrlString("https://flutter.dev");
                        },
                    ),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "Global Gamers Challenge",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.green.shade700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrlString("https://flutter.dev/global-gamers");
                        },
                    ),
                    TextSpan(text: "."),
                    TextSpan(text: " "),
                    TextSpan(text: "Shout out to the folks at"),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "Blue Fire",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue.shade600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrlString("https://blue-fire.xyz/");
                        },
                    ),
                    TextSpan(text: " "),
                    TextSpan(text: "for their hard work on the game engine used,"),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "Flame",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.orange.shade700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrlString("https://flame-engine.org/");
                        },
                    ),
                    TextSpan(text: "!"),
                  ],
                ),
              ),
            ),
            _MenuItem(
              label: "Back",
              onPressed: () {
                ref.read(gameMenuProvider.notifier).backToRoot();
              },
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsGameMenu extends ConsumerWidget {
  const _SettingsGameMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            CheckboxListTile(
              value: ref.watch(audioNotifierProvider).soundEnabled,
              onChanged: (value) {
                if (value != null) {
                  ref.read(audioNotifierProvider.notifier).setSoundEnabled(value);
                }
              },
              title: Text("Sound Enabled"),
            ),
            CheckboxListTile(
              value: ref.watch(audioNotifierProvider).musicEnabled,
              onChanged: (value) {
                if (value != null) {
                  ref.read(audioNotifierProvider.notifier).setMusicEnabled(value);
                }
              },
              title: Text("Music Enabled"),
            ),
            _MenuItem(
              label: "Back",
              onPressed: () {
                ref.read(gameMenuProvider.notifier).backToRoot();
              },
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
        ),
      ),
    );
  }
}

class LoadGameMenu extends ConsumerWidget {
  final Function()? onCancelOverride;
  final Function(SavedGame save)? onSelectOverride;
  const LoadGameMenu({this.onCancelOverride, this.onSelectOverride, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saves = ref.watch(savedGameListProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 300,
        maxWidth: GAME_MENU_WIDTH,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _MenuItem(
                label: "Cancel",
                onPressed: () {
                  if (onCancelOverride != null) {
                    onCancelOverride!();
                    return;
                  }
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
                        if (onSelectOverride != null) {
                          onSelectOverride!(save);
                          return;
                        }
                        ref.read(gameMenuProvider.notifier).loadGame(save);
                      });
                },
              ),
            ],
          ),
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
          width: GAME_MENU_WIDTH - 32,
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(
              width: 2,
              color: Colors.black12,
            ),
          ),
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
