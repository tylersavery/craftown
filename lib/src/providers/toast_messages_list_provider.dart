import 'dart:math';

import 'package:craftown/src/models/stats.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_messages_list_provider.g.dart';

@Riverpod(keepAlive: true)
class ToastMessagesList extends _$ToastMessagesList {
  final rng = Random();

  @override
  List<ToastMessage> build() {
    return [];
  }

  add(
    String message, {
    ToastMessageType type = ToastMessageType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    final identifier = rng.nextDouble().toString();
    final toastMessage = ToastMessage(identifier: identifier, message: message, type: type, duration: duration);

    state = [...state, toastMessage];

    Future.delayed(duration, () {
      remove(toastMessage);
    });
  }

  remove(ToastMessage toastMessage) {
    state = [...state]..removeWhere((t) => t.identifier == toastMessage.identifier);
  }
}
