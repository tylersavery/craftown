import 'dart:math';

import 'package:craftown/src/models/stats.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToastMessagesProvider extends StateNotifier<List<ToastMessage>> {
  final Ref ref;
  final rng = Random();
  ToastMessagesProvider(this.ref) : super([]);

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

final toastMessagesProvider = StateNotifierProvider<ToastMessagesProvider, List<ToastMessage>>((ref) {
  return ToastMessagesProvider(ref);
});
