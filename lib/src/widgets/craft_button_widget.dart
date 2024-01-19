import 'package:craftown/src/providers/craft_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CraftButtonWidget extends ConsumerWidget {
  const CraftButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(craftMenuProvider.notifier).open();
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.black45,
          border: Border.all(
            width: 1,
            color: Colors.white38,
          ),
        ),
        child: const Icon(
          Icons.build,
          size: 16,
          color: Colors.white70,
        ),
      ),
    );
  }
}
