import 'package:craftown/src/providers/rotate_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RotateButton extends ConsumerWidget {
  const RotateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(rotateProvider.notifier);
    final state = ref.watch(rotateProvider);
    return Container(
      color: Colors.black38,
      child: RotatedBox(
        quarterTurns: state.quarterTurns,
        child: IconButton(
          onPressed: () {
            provider.rotateClockwise();
          },
          icon: Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
