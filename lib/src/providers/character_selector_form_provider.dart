import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/providers/app_provider.dart';
import 'package:craftown/src/providers/selected_character_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_selector_form_provider.g.dart';

@Riverpod(keepAlive: true)
class CharacterSelectorForm extends _$CharacterSelectorForm {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Character build() {
    return Character(skin: CharacterSkin.values.first, name: "");
  }

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
    ref.read(appProvider.notifier).set(AppState.overview);
  }
}

// final characterSelectorFormProvider = NotifierProvider<CharacterSelectorFormProvider, Character>(CharacterSelectorFormProvider.new);
