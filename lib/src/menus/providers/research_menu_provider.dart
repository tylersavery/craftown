import 'package:collection/collection.dart';
import 'package:craftown/src/models/research_level.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:craftown/src/providers/audio_provider.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:craftown/src/providers/research_list_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:craftown/src/menus/models/research_menu_state.dart';

part 'research_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class ResearchMenu extends _$ResearchMenu {
  final ScrollController scrollController = ScrollController();

  @override
  ResearchMenuState build() {
    scrollController.addListener(_onScroll);

    return ResearchMenuState();
  }

  void _playSound() {
    ref.read(audioNotifierProvider.notifier).playRandomBlip();
  }

  void _onScroll() {
    state = state.copyWith(scrollOffset: scrollController.offset);
  }

  void open() {
    _playSound();
    state = state.copyWith(isOpen: true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(state.scrollOffset);
      }
    });
    Future.delayed(Duration(milliseconds: 10), () {});
  }

  void close() {
    _playSound();

    state = state.copyWith(isOpen: false);
  }

  void expandResearchLevelInfo(ResearchLevel researchLevel) {
    _playSound();
    state = state.copyWith(expandedResearchLevel: researchLevel);
  }

  void contractResearchLevelInfo() {
    _playSound();

    state = state.copyWith(expandedResearchLevel: null);
  }

  bool startResearch(ResearchLevel researchLevel) {
    if (state.isResearching != null) {
      print("Research already in progress");
      return false;
    }

    final researchList = ref.read(researchListProvider);

    final isResearched = researchList.firstWhereOrNull((r) => r.identifier == researchLevel.identifier) != null;

    if (isResearched) {
      print("Already researched");
      return false;
    }

    bool canResearch = !isResearched;
    if (canResearch) {
      for (final level in researchLevel.prerequisites) {
        if (researchList.firstWhereOrNull((r) => r.identifier == level.identifier) == null) {
          canResearch = false;
          break;
        }
      }
    }

    if (!canResearch) {
      print("Can't research");
      return false;
    }

    final List<Resource> missingResources = [];
    final inventory = ref.read(inventoryMapProvider);
    for (final ingredient in researchLevel.cost) {
      if (inventory.containsKey(ingredient.resource.identifier)) {
        final quantity = inventory[ingredient.resource.identifier];

        if (quantity != null && quantity < ingredient.quantity) {
          missingResources.add(ingredient.resource);
        }
      } else {
        missingResources.add(ingredient.resource);
      }
    }

    if (missingResources.isNotEmpty) {
      ref.read(toastMessagesListProvider.notifier).add("Missing Resources: ${missingResources.map((r) => r.namePlural).join(', ')}.");
      return false;
    }

    ref.read(inventoryListProvider.notifier).removeIngredients(researchLevel.cost);

    continueResearch(researchLevel);
    _playSound();

    return true;
  }

  void continueResearch(ResearchLevel researchLevel, {DateTime? researchStarted}) {
    state = state.copyWith(
      isResearching: researchLevel,
      researchStarted: researchStarted ?? DateTime.now(),
    );

    final completesIn = state.researchCompletes.difference(DateTime.now());

    Future.delayed(completesIn, () {
      if (state.isResearching != null) {
        ref.read(researchListProvider.notifier).completeResearch(state.isResearching!);
        ref.read(toastMessagesListProvider.notifier).add(
              "${state.isResearching!.name} Research complete!",
              type: ToastMessageType.success,
            );
      }

      state = state.copyWith(
        isResearching: null,
        researchStarted: null,
      );
    });
  }
}
