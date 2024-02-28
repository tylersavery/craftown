import 'package:craftown/src/providers/audio_provider.dart';
import 'package:craftown/src/singletons.dart';
import 'package:craftown/src/widgets/app.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  await FlameAudio.audioCache.loadAll(AudioAsset.values.map((a) => a.assetName).toList());

  await Singletons.initialize();

  runApp(
    Phoenix(
      child: ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'PixelifySans',
          ),
          home: App(),
        ),
      ),
    ),
  );
}
