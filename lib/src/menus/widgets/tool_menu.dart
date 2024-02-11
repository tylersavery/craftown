import 'package:craftown/src/constants.dart';
import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/menus/providers/tool_menu_provider.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolMenuWidget extends ConsumerWidget {
  const ToolMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.read(toolMenuProvider.notifier);
    final selectedTool = ref.watch(selectedToolProvider);

    return MenuContainer(
      title: "Tools",
      shortcutKey: "T",
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
                children: Tools.allTools.asMap().entries.map((entry) {
                  final tool = entry.value;
                  final index = entry.key;
                  final isSelected = selectedTool == tool;

                  bool isAvailable = true;

                  for (final r in tool.resourcesRequired) {
                    if (!ref.watch(inventoryMapProvider).containsKey(r.identifier)) {
                      isAvailable = false;
                      break;
                    }
                  }

                  return InkWell(
                    onTap: () {
                      menuProvider.setSelected(tool, true);
                    },
                    child: Opacity(
                      opacity: isAvailable ? 1 : 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: isSelected ? Colors.green : Colors.transparent,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PixelArtImageAsset(
                                tool.assetPath,
                                width: 32,
                                height: 32,
                              ),
                              if (!JOYSTICK_ENABLED && isAvailable)
                                Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                            ],
                          ),
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
