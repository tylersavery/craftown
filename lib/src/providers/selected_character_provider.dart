import 'package:craftown/src/models/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCharacterProvider extends StateNotifier<Character> {
  SelectedCharacterProvider(Character initialState) : super(initialState);

  void set(Character character) {
    state = character;
  }
}

final selectedCharacterProvider = StateNotifierProvider<SelectedCharacterProvider, Character>((ref) {
  return SelectedCharacterProvider(
    Character(
      name: "Bob",
      skin: CharacterSkin.femaleBlackBlackHair,
    ),
  );
});
