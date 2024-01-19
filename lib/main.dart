import 'package:craftown/src/layout/game_layout.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(
    ProviderScope(
      child: Focus(
        onKey: (node, event) => KeyEventResult.handled,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'PixelifySans',
          ),
          home: GameLayout(),
        ),
      ),
    ),
  );
}
