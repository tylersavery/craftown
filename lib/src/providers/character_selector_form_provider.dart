import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/providers/app_state_provider.dart';
import 'package:craftown/src/providers/selected_character_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSelectorFormProvider extends StateNotifier<Character> {
  final Ref ref;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  CharacterSelectorFormProvider(this.ref, Character initialState) : super(initialState);

  void setSkin(CharacterSkin skin) {
    state = state.copyWith(skin: skin);
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Your name is required.";
    }
    return null;
  }

  void submit() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final character = state.copyWith(name: nameController.text);
    ref.read(selectedCharacterProvider.notifier).set(character);
    ref.read(appStateProvider.notifier).set(AppState.inGame);
  }
}

final characterSelectorFormProvider = StateNotifierProvider<CharacterSelectorFormProvider, Character>((ref) {
  final initialState = Character(skin: CharacterSkin.values.first, name: "");
  return CharacterSelectorFormProvider(ref, initialState);
});
