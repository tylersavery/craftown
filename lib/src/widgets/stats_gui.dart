import 'package:craftown/src/providers/stats_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsGui extends StatelessWidget {
  const StatsGui({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(builder: (context, ref, _) {
          final state = ref.watch(statsProvider);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _StatRow(label: "Sustainability", value: state.sustainability),
              _StatRow(label: "Energy", value: state.energy),
            ],
          );
        }),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final double value;
  const _StatRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    if (value > .3) {
      color = Colors.orange;
    }
    if (value > .5) {
      color = Colors.yellow;
    }
    if (value > .7) {
      color = Colors.green;
    }
    return Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(
            "$label:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
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
      ],
    );
  }
}