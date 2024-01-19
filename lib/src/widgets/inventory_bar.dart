import 'dart:math';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/providers/inventory_menu_provider.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventoryBar extends ConsumerWidget {
  const InventoryBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.read(inventoryMenuProvider.notifier);
    final inventory = ref.watch(inventoryProvider);

    final truncatedInventory = inventory.sublist(0, INVENTORY_ITEM_BAR_COUNT);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...truncatedInventory.asMap().entries.map(
          (entry) {
            final index = entry.key;
            final slot = entry.value;

            return Container(
              key: Key("${slot.resource?.identifier}_${slot.count}_$index"),
              decoration: BoxDecoration(
                color: Colors.black45,
                border: Border(
                  right: const BorderSide(
                    color: Colors.white38,
                    width: 1,
                  ),
                ),
              ),
              width: 32,
              height: 32,
              child: slot.resource == null
                  ? null
                  : InkWell(
                      onTap: () {
                        menuProvider.openWith(index);
                      },
                      child: Stack(
                        children: [
                          if (slot.count > 0)
                            Center(
                              child: Image.asset(
                                "assets/images/resources/${slot.resource!.assetFileName16}",
                                width: 16,
                                height: 16,
                                fit: BoxFit.contain,
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
                                    color: Colors.white,
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
          },
        ).toList(),
        InkWell(
          onTap: () {
            menuProvider.resetAndOpen();
          },
          child: Container(
            key: Key("more"),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Center(
              child: Transform.translate(
                offset: Offset(0, -3),
                child: Text(
                  '...',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
