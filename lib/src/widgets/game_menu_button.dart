import 'package:craftown/src/menus/providers/game_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameMenuButton extends ConsumerWidget {
  const GameMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: "Menu",
      child: InkWell(
        onTap: () {
          ref.read(gameMenuProvider.notifier).open();
        },
        child: Container(
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
