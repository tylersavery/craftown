import 'package:craftown/src/menus/providers/research_menu_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResearchButton extends ConsumerWidget {
  const ResearchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: "Research Menu",
      child: InkWell(
        onTap: () {
          ref.read(researchMenuProvider.notifier).open();
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
          child: PixelArtImageAsset(
            "assets/images/research-12x17.png",
            width: 12,
            height: 17,
          ),
        ),
      ),
    );
  }
}
