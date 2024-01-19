import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'toast_message.freezed.dart';

enum ToastMessageType {
  info(Colors.blue, Colors.white),
  error(Colors.red, Colors.white),
  success(Colors.green, Colors.white),
  ;

  final Color bgColor;
  final Color fgColor;
  const ToastMessageType(this.bgColor, this.fgColor);
}

@freezed
class ToastMessage with _$ToastMessage {
  const factory ToastMessage({
    required String identifier,
    required String message,
    @Default(ToastMessageType.info) ToastMessageType type,
    @Default(Duration(milliseconds: 2000)) Duration duration,
    @Default(true) bool isVisible,
  }) = _ToastMessage;
}
