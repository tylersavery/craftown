import 'dart:async';

import 'package:craftown/src/craftown.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MiningCollectedIndicator extends PositionComponent with HasGameRef<Craftown>, HasPaint {
  final String text;
  late TextComponent textComponent;
  MiningCollectedIndicator({required this.text, super.position, super.size});

  @override
  FutureOr<void> onLoad() {
    textComponent = TextComponent(
      text: text,
      textRenderer: TextPaint(
        style: TextStyle(
          fontFamily: 'PixelifySans',
          color: Colors.black.withOpacity(opacity),
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    add(textComponent);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    textComponent.textRenderer = TextPaint(
        style: TextStyle(
      fontFamily: 'PixelifySans',
      color: Colors.black.withOpacity(opacity),
      fontSize: 8,
      fontWeight: FontWeight.bold,
    ));
    super.update(dt);
  }
}
