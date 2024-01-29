import 'dart:math';

import 'package:flame/components.dart';

Random rnd = Random();

Vector2 randomVector2() => (Vector2.random(rnd) - Vector2.random(rnd)) * 200;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

String randomString([int length = 16]) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(rnd.nextInt(_chars.length)),
      ),
    );

int randomInt(int min, int max) {
  return rnd.nextInt(max - min + 1) + min;
}

T randomItemInList<T>(List<T> list) {
  final random = Random();
  int index = random.nextInt(list.length);
  return list[index];
}
