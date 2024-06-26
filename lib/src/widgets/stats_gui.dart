import 'package:craftown/src/constants.dart';
import 'package:craftown/src/menus/providers/research_menu_provider.dart';
import 'package:craftown/src/menus/widgets/research_menu.dart';
import 'package:craftown/src/models/stats.dart';
import 'package:craftown/src/providers/calendar_provider.dart';
import 'package:craftown/src/providers/dirty_resources_sustainability_penalty_provider.dart';
import 'package:craftown/src/providers/power_available_provider.dart';
import 'package:craftown/src/providers/power_consumption_provider.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsGui extends ConsumerWidget {
  const StatsGui({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final researchingState = ref.watch(researchMenuProvider);

    return SizedBox(
      width: 180,
      child: Column(
        children: [
          Container(
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(builder: (context, ref, _) {
                final state = ref.watch(statsDetailProvider);
                final calendar = ref.watch(calendarProvider);

                final powerAvailable = ref.watch(powerAvailableProvider);
                final powerUse = ref.watch(powerConsumptionProvider);

                final showPowerInfo = powerAvailable > 0 || powerUse > 0;

                double powerUsePercent = 0.0;

                if (powerAvailable == 0) {
                  powerUsePercent = 1;
                } else if (powerUse == 0) {
                  powerUsePercent = 0;
                } else {
                  powerUsePercent = powerUse / powerAvailable;
                }

                final sustainability = state.sustainability - ref.watch(dirtyResourcesSustainablityPenaltyProvider);

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: DEBUG_CHANGE_DATE
                              ? () {
                                  ref.read(calendarProvider.notifier).nextMonth();
                                }
                              : null,
                          child: Tooltip(
                            message: "Date",
                            child: Text(
                              "${calendar.month.label}, ${calendar.year}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Tooltip(
                          message: "Coins",
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PixelArtImageAsset(
                                "assets/images/coins-16x16.png",
                                width: 16,
                                height: 16,
                              ),
                              Text(
                                "${state.dollars}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    _StatRow(type: StatType.sustainability, value: sustainability),
                    _StatRow(type: StatType.energy, value: state.energy),
                    _StatRow(type: StatType.hunger, value: state.hunger),
                    _StatRow(type: StatType.thirst, value: state.thirst),
                    if (showPowerInfo) _StatRow(type: StatType.powerUse, value: powerUsePercent),
                  ],
                );
              }),
            ),
          ),
          if (researchingState.isResearching != null && researchingState.researchStarted != null)
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Container(
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Researching ${researchingState.isResearching!.name}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      ResearchProgressIndicator(
                          researchStarted: researchingState.researchStarted!, researchCompletes: researchingState.researchCompletes)
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final StatType type;
  final double value;
  const _StatRow({
    required this.type,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;

    if (type.positiveIsGood) {
      if (value > .3) {
        color = Colors.orange;
      }
      if (value > .5) {
        color = Colors.yellow;
      }
      if (value > .7) {
        color = Colors.green;
      }
    } else {
      color = Colors.green;

      if (value > .3) {
        color = Colors.yellow;
      }
      if (value > .5) {
        color = Colors.orange;
      }
      if (value > .7) {
        color = Colors.red;
      }
    }
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            "${type.label}:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
        Expanded(
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            color: color,
            value: value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: SizedBox(
            width: 24,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${(value * (type.isPercent ? 100 : 1)).round()}${type.unitLabel}",
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
