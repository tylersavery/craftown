import 'dart:async';

import 'package:collection/collection.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/data/research_levels.dart';
import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/menus/providers/research_menu_provider.dart';
import 'package:craftown/src/models/research_level.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:craftown/src/providers/research_list_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';

import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResearchMenuWidget extends ConsumerWidget {
  const ResearchMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final researchLevels = ResearchLevels.allResearchLevels;

    return MenuContainer(
      title: "Research",
      handleClose: () {
        ref.read(researchMenuProvider.notifier).close();
      },
      width: RESEARCH_MENU_WIDTH,
      maxContentHeightOverride: 300,
      child: SizedBox(
        width: RESEARCH_MENU_WIDTH,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: researchLevels.length,
            itemBuilder: (context, index) {
              final researchLevel = researchLevels[index];

              return _ResearchCard(researchLevel: researchLevel);
            },
          ),
        ),
      ),
    );
  }
}

class _ResearchCard extends ConsumerWidget {
  final ResearchLevel researchLevel;
  const _ResearchCard({
    required this.researchLevel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.read(researchMenuProvider.notifier);
    final menuState = ref.watch(researchMenuProvider);
    final state = ref.watch(researchListProvider);
    final isResearched = state.firstWhereOrNull((r) => r.identifier == researchLevel.identifier) != null;

    bool canResearch = !isResearched && menuState.isResearching == null;

    if (canResearch) {
      for (final level in researchLevel.prerequisites) {
        if (state.firstWhereOrNull((r) => r.identifier == level.identifier) == null) {
          canResearch = false;
          break;
        }
      }
    }

    final isResearching = menuState.isResearching?.identifier == researchLevel.identifier;

    final unlocks = Resources.all.where((r) => r.researchRequirements.contains(researchLevel)).toList();

    return Card(
      color: isResearching ? Colors.green.shade200 : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: isResearched ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank_outlined),
            title: Text(researchLevel.name),
            subtitle:
                researchLevel.prerequisites.isNotEmpty ? Text("Requires: ${researchLevel.prerequisites.map((e) => e.name).join(", ")}") : Text(""),
            trailing: Builder(builder: (context) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: canResearch
                        ? () {
                            menuProvider.startResearch(researchLevel);
                          }
                        : null,
                    child: Text("Research"),
                  ),
                  SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: () {
                      if (menuState.expandedResearchLevel?.identifier == researchLevel.identifier) {
                        menuProvider.contractResearchLevelInfo();
                      } else {
                        menuProvider.expandResearchLevelInfo(researchLevel);
                      }
                    },
                    child: Text("Info"),
                  )
                ],
              );
            }),
          ),
          if (isResearching && menuState.researchStarted != null)
            Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(
                    bottom: 4,
                  ),
                  child: ResearchProgressIndicator(researchStarted: menuState.researchStarted!, researchCompletes: menuState.researchCompletes),
                );
              },
            ),
          if (menuState.expandedResearchLevel?.identifier == researchLevel.identifier)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Cost:",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: researchLevel.cost.map((ingredient) {
                        final r = ingredient.resource;

                        final inventoryCount = ref.watch(inventoryMapProvider)[ingredient.resource.identifier] ?? 0;
                        final hasEnough = inventoryCount >= ingredient.quantity;

                        return Container(
                          decoration: BoxDecoration(
                            color: hasEnough || isResearched || isResearching ? Colors.black12 : Colors.red.shade100,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PixelArtImageAsset(
                                  r.assetPath16,
                                  width: 16,
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(ingredient.resource.name),
                                ),
                                Text(hasEnough ? "x ${ingredient.quantity}" : "$inventoryCount/${ingredient.quantity}"),
                              ],
                            ),
                          ),
                        );
                      }).toList()),
                  Divider(),
                  Text(
                    "Unlocks:",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: unlocks.map((r) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PixelArtImageAsset(
                                  r.assetPath16,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(r.name),
                              ],
                            ),
                          ),
                        );
                      }).toList())
                ],
              ),
            )
        ],
      ),
    );
  }
}

class ResearchProgressIndicator extends StatefulWidget {
  final DateTime researchStarted;
  final DateTime researchCompletes;

  const ResearchProgressIndicator({
    required this.researchStarted,
    required this.researchCompletes,
  });

  @override
  State<ResearchProgressIndicator> createState() => _ResearchProgressIndicatorState();
}

class _ResearchProgressIndicatorState extends State<ResearchProgressIndicator> {
  late final Timer timer;

  late DateTime now;

  @override
  void initState() {
    now = DateTime.now();

    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        now = DateTime.now();
      });
      if (now.isAfter(widget.researchCompletes)) {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.researchCompletes.difference(widget.researchStarted).inMilliseconds;
    final n = now.difference(widget.researchStarted).inMilliseconds;

    final value = n / c;

    return LinearProgressIndicator(
      color: Colors.green,
      minHeight: 4,
      value: value,
    );
  }
}
