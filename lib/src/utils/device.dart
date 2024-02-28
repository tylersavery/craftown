import 'package:flutter/material.dart';

bool isTouchDevice(BuildContext context) {
  final platform = Theme.of(context).platform;

  return platform == TargetPlatform.android || platform == TargetPlatform.iOS || platform == TargetPlatform.fuchsia;
}
