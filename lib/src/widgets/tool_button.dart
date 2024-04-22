import 'package:craftown/src/menus/providers/tool_menu_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolButton extends ConsumerWidget {
  const ToolButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tool = ref.watch(selectedToolProvider);

    return Tooltip(
      message: "Selected Tool",
      child: InkWell(
        onTap: () {
          ref.read(toolMenuProvider.notifier).open();
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
          child: tool == null
              ? SizedBox()
              : Center(
                  child: PixelArtImageAsset(
                    tool.assetPath,
                    width: 16,
                    height: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
