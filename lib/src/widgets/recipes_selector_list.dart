import 'package:craftown/src/providers/recipes_list_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeSelectorList extends ConsumerWidget {
  final int? selectedIndex;
  final Function(int index) onSelect;
  const RecipeSelectorList({
    super.key,
    required this.onSelect,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.read(recipesListProvider);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final resource = recipes[index];
        final isSelected = selectedIndex != null && selectedIndex == index;

        return InkWell(
          onTap: () {
            onSelect(index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.pink.withOpacity(0.1) : Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: PixelArtImageAsset(
                      resource.assetPath16,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(resource.name),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
