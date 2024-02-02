import 'package:craftown/src/constants.dart';
import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/menus/providers/store_menu_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';

import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreMenuWidget extends ConsumerWidget {
  const StoreMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resources = Resources.availableInStore;

    return MenuContainer(
      title: "Shop",
      handleClose: () {
        ref.read(storeMenuProvider.notifier).close();
      },
      width: STORE_MENU_WIDTH,
      maxContentHeightOverride: 88,
      child: SizedBox(
        width: STORE_MENU_WIDTH,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              alignment: WrapAlignment.center,
              children: resources.map((r) {
                return InkWell(
                  onTap: () {
                    ref.read(storeMenuProvider.notifier).purchase(r);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PixelArtImageAsset(
                          r.assetPath16,
                          width: 32,
                          height: 32,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "\$${r.storeCost}",
                          style: TextStyle(height: 1),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
