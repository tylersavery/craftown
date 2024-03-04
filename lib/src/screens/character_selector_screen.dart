import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/providers/app_provider.dart';
import 'package:craftown/src/providers/character_selector_form_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSelectorScreen extends ConsumerWidget {
  const CharacterSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(characterSelectorFormProvider.notifier);
    final state = ref.watch(characterSelectorFormProvider);

    return Scaffold(
      backgroundColor: Colors.lightGreen.shade300,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Form(
            key: provider.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Choose Your Character",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Wrap(
                  children: CharacterSkin.values.map((skin) {
                    return InkWell(
                      onTap: () {
                        provider.setSkin(skin);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: state.skin == skin ? Colors.green : Colors.transparent,
                            width: 6,
                          ),
                        ),
                        child: PixelArtImageAsset(
                          skin.thumbnailAssetPath,
                          width: 64,
                          height: 64,
                          isSpriteSheet: true,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 8,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextFormField(
                    controller: provider.nameController,
                    validator: provider.nameValidator,
                    decoration: InputDecoration(
                      hintText: "Your Name",
                    ),
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: provider.submit,
                  child: Text("Next"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    ref.read(appProvider.notifier).set(AppState.mainMenu);
                  },
                  child: Text(
                    "Back to Menu",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
