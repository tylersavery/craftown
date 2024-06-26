import 'dart:async';
import 'package:flutter/material.dart';

class HoldDownButton extends StatefulWidget {
  final String label;
  final Duration duration;
  final Function() onComplete;
  final String? disabledMessage;
  final bool completeOnClick;
  final bool small;
  final bool showHint;
  const HoldDownButton({
    super.key,
    required this.label,
    required this.duration,
    required this.onComplete,
    this.disabledMessage,
    this.completeOnClick = false,
    this.small = false,
    this.showHint = false,
  });

  @override
  State<HoldDownButton> createState() => _HoldDownButtonState();
}

class _HoldDownButtonState extends State<HoldDownButton> {
  Timer? _timer;
  double _progress = 0.0;

  void _startTimer() {
    _progress = 0.0;
    final int totalMilliseconds = widget.duration.inMilliseconds;
    const int interval = 250;

    _timer = Timer.periodic(Duration(milliseconds: interval), (timer) {
      if (widget.disabledMessage != null) {
        return;
      }
      setState(() {
        _progress += interval / totalMilliseconds;
        if (_progress >= 1.0) {
          _progress = 1.0;
          widget.onComplete();
          _progress = 0.0;
        }
      });
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    setState(() {
      _progress = 0.0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          cursor: widget.disabledMessage == null ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
          child: GestureDetector(
            onTapDown: (_) {
              if (widget.disabledMessage != null) {
                return;
              }

              if (widget.completeOnClick) {
                return;
              }
              _startTimer();
            },
            onTapUp: (_) {
              if (widget.completeOnClick) {
                widget.onComplete();
                return;
              }
              _cancelTimer();
            },
            onTapCancel: () {
              if (widget.completeOnClick) {
                return;
              }
              _cancelTimer();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border(
                  left: BorderSide(
                    width: 2,
                    color: Colors.black12,
                  ),
                  top: BorderSide(
                    width: 2,
                    color: Colors.black12,
                  ),
                  right: BorderSide(
                    width: 2,
                    color: Colors.black12,
                  ),
                ),
              ),
              width: double.infinity,
              height: widget.small ? 32 : 80,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.label,
                        style: TextStyle(fontSize: widget.small ? 16 : 24, height: 1),
                      ),
                      if (widget.disabledMessage != null)
                        Text(
                          widget.disabledMessage!,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1,
                            color: Colors.black54,
                          ),
                        ),
                      if (widget.showHint && !widget.completeOnClick)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "(Hold Button Down)",
                            style: TextStyle(
                              fontSize: 12,
                              height: 1,
                              color: Colors.black54,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border(
              left: BorderSide(
                width: 2,
                color: Colors.black12,
              ),
              bottom: BorderSide(
                width: 2,
                color: Colors.black12,
              ),
              right: BorderSide(
                width: 2,
                color: Colors.black12,
              ),
            ),
          ),
          child: LinearProgressIndicator(
            value: _progress,
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
