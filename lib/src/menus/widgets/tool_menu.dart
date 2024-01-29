import 'package:craftown/src/constants.dart';
import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/menus/providers/tool_menu_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolMenu extends ConsumerWidget {
  const ToolMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.read(toolMenuProvider.notifier);
    final selectedTool = ref.watch(selectedToolProvider);
    return MenuContainer(
      title: "Tools",
      handleClose: () {
        ref.read(toolMenuProvider.notifier).close();
      },
      width: TOOL_MENU_WIDTH,
      maxContentHeightOverride: 88,
      child: SizedBox(
        width: TOOL_MENU_WIDTH,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: Tools.allTools.map((tool) {
                  final isSelected = selectedTool == tool;

                  return InkWell(
                    onTap: () {
                      menuProvider.setSelected(tool, true);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: isSelected ? Colors.green : Colors.transparent,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PixelArtImageAsset(
                          tool.assetPath,
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
      ),
    );
  }
}
