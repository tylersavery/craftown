import 'dart:math';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/modifier_key_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventorySlotWrap extends ConsumerWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  final double slotSize;

  const InventorySlotWrap({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    this.slotSize = 48.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(inventoryListProvider);

    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 4,
      runSpacing: 4,
      children: inventory.asMap().entries.map((entry) {
        final index = entry.key;
        final slot = entry.value;

        return InkWell(
          onDoubleTap: () {
            final amountToMove = min(INVENTORY_MOVE_WHEN_SHIFT_PRESSED, slot.count);
            for (int i = 0; i < amountToMove; i++) {
              onTap(index);
            }
          },
          onTap: () {
            if (ref.read(modifierKeyProvider).shiftPressed) {
              final amountToMove = min(INVENTORY_MOVE_WHEN_SHIFT_PRESSED, slot.count);

              for (int i = 0; i < amountToMove; i++) {
                onTap(index);
              }
            } else {
              onTap(index);
            }
          },
          child: Container(
            width: slotSize,
            height: slotSize,
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                width: 2,
                color: index == selectedIndex ? Colors.green : Colors.black12,
              ),
            ),
            child: Stack(
              children: [
                if (slot.count > 0)
                  Center(
                    child: PixelArtImageAsset(
                      "assets/images/resources/${slot.resource!.assetFileName16}",
                      width: 32,
                      height: 32,
                    ),
                  ),
                if (slot.count > 0)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        slot.count.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
