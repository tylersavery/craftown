import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/menus/providers/craft_menu_provider.dart';
import 'package:craftown/src/menus/providers/game_menu_provider.dart';
import 'package:craftown/src/menus/providers/inventory_menu_provider.dart';
import 'package:craftown/src/menus/providers/research_menu_provider.dart';
import 'package:craftown/src/menus/providers/resource_contents_menu_provider.dart';
import 'package:craftown/src/menus/providers/store_menu_provider.dart';
import 'package:craftown/src/menus/providers/tool_menu_provider.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keyboard_shortcut_provider.g.dart';

@Riverpod(keepAlive: true)
class KeyboardShortcut extends _$KeyboardShortcut {
  @override
  bool build() {
    return true;
  }

  bool anyMenusOpen() {
    if (ref.read(gameMenuProvider).isOpen) return true;
    if (ref.read(inventoryMenuProvider).isOpen) return true;
    if (ref.read(craftMenuProvider).isOpen) return true;
    if (ref.read(researchMenuProvider).isOpen) return true;
    if (ref.read(storeMenuProvider).isOpen) return true;
    if (ref.read(toolMenuProvider).isOpen) return true;
    if (ref.read(resourceContentsMenuProvider).isOpen) return true;

    return false;
  }

  void handleInventoryShortcut() {
    _closeAllMenus(except: inventoryMenuProvider);
    if (ref.read(inventoryMenuProvider).isOpen) {
      ref.read(inventoryMenuProvider.notifier).close();
    } else {
      ref.read(inventoryMenuProvider.notifier).open();
    }
  }

  void handleResearchShortcut() {
    _closeAllMenus(except: researchMenuProvider);
    if (ref.read(researchMenuProvider).isOpen) {
      ref.read(researchMenuProvider.notifier).close();
    } else {
      ref.read(researchMenuProvider.notifier).open();
    }
  }

  void handleCraftShortcut() {
    _closeAllMenus(except: craftMenuProvider);
    if (ref.read(craftMenuProvider).isOpen) {
      ref.read(craftMenuProvider.notifier).close();
    } else {
      ref.read(craftMenuProvider.notifier).open();
    }
  }

  void handleStoreMenuShortcut() {
    _closeAllMenus(except: storeMenuProvider);
    if (ref.read(storeMenuProvider).isOpen) {
      ref.read(storeMenuProvider.notifier).close();
    } else {
      ref.read(storeMenuProvider.notifier).open();
    }
  }

  void handleToolMenuShortcut() {
    _closeAllMenus(except: toolMenuProvider);
    if (ref.read(toolMenuProvider).isOpen) {
      ref.read(toolMenuProvider.notifier).close();
    } else {
      ref.read(toolMenuProvider.notifier).open();
    }
  }

  void handleToolShortcut(int toolNumber) {
    Tool? tool;

    switch (toolNumber) {
      case 1:
        tool = Tools.pick;
        break;
      case 2:
        tool = Tools.axe;
        break;
      case 3:
        tool = Tools.shovel;
        break;
      case 4:
        tool = Tools.sythe;
        break;
      case 5:
        tool = Tools.waterBucket;
        break;
    }

    if (tool != null) {
      bool isAvailable = true;

      for (final r in tool.resourcesRequired) {
        if (!ref.read(inventoryMapProvider).containsKey(r.identifier)) {
          isAvailable = false;
          break;
        }
      }

      if (isAvailable) {
        ref.read(toolMenuProvider.notifier).setSelected(tool);
      }
    }
  }

  void handleEscapePressed() {
    if (anyMenusOpen()) {
      _closeAllMenus();
    } else {
      ref.read(gameMenuProvider.notifier).open();
    }
  }

  void _closeAllMenus({NotifierProvider? except}) {
    if (ref.read(gameMenuProvider).isOpen && except != gameMenuProvider) {
      ref.read(gameMenuProvider.notifier).close();
    }

    if (ref.read(inventoryMenuProvider).isOpen && except != inventoryMenuProvider) {
      ref.read(inventoryMenuProvider.notifier).close();
    }

    if (ref.read(craftMenuProvider).isOpen && except != craftMenuProvider) {
      ref.read(craftMenuProvider.notifier).close();
    }
    if (ref.read(researchMenuProvider).isOpen && except != researchMenuProvider) {
      ref.read(researchMenuProvider.notifier).close();
    }

    if (ref.read(storeMenuProvider).isOpen && except != storeMenuProvider) {
      ref.read(storeMenuProvider.notifier).close();
    }

    if (ref.read(toolMenuProvider).isOpen && except != toolMenuProvider) {
      ref.read(toolMenuProvider.notifier).close();
    }

    if (ref.read(resourceContentsMenuProvider).isOpen && except != resourceContentsMenuProvider) {
      ref.read(resourceContentsMenuProvider.notifier).close();
    }
  }
}
