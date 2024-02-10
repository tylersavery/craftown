import 'package:craftown/src/constants.dart';
import 'package:craftown/src/menus/models/store_menu_state.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/modifier_key_provider.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class StoreMenu extends _$StoreMenu {
  @override
  StoreMenuState build() {
    return StoreMenuState();
  }

  void open() {
    state = state.copyWith(isOpen: true);
  }

  void close() {
    state = state.copyWith(isOpen: false);
  }

  bool purchase(Resource resource) {
    if (DEBUG_STORE) {
      if (ref.read(modifierKeyProvider).shiftPressed) {
        for (int i = 0; i < 5; i++) {
          ref.read(inventoryListProvider.notifier).addResource(resource);
        }
      } else {
        ref.read(inventoryListProvider.notifier).addResource(resource);
      }

      return true;
    }

    if (resource.storeCost == null) {
      return false;
    }

    final availableDollars = ref.read(statsDetailProvider).dollars;

    if (availableDollars < resource.storeCost!) {
      ref.read(toastMessagesListProvider.notifier).add("Not enough coins to purchase ${resource.name}");
      return false;
    }

    final success = ref.read(inventoryListProvider.notifier).addResource(resource);

    if (!success) {
      return false;
    }

    ref.read(statsDetailProvider.notifier).decreaseDollars(resource.storeCost!);
    ref.read(statsDetailProvider.notifier).decreaseSustainability(0.05);

    ref.read(toastMessagesListProvider.notifier).add("Purchased ${resource.name} for ${resource.storeCost} coins");

    return true;
  }
}
