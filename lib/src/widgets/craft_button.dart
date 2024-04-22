import 'package:craftown/src/menus/providers/craft_menu_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CraftButton extends ConsumerWidget {
  const CraftButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: "Craft Menu",
      child: InkWell(
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
          child: Center(
            child: PixelArtImageAsset(
              "assets/images/tools/craft_bench.png",
              width: 16,
              height: 16,
            ),
          ),
        ),
      ),
    );
  }
}
