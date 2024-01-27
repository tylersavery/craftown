import 'package:craftown/src/singletons.dart';
import 'package:craftown/src/widgets/app.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  await Singletons.initialize();

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'PixelifySans',
        ),
        home: App(),
      ),
    ),
  );
}
