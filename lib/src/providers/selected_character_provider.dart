import 'package:craftown/src/models/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_character_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedCharacter extends _$SelectedCharacter {
  @override
  Character build() {
    return Character(
      name: "Bob",
      skin: CharacterSkin.maleWhiteBlondHair,
    );
  }

  void set(Character character) {
    state = character;
  }
}
