import 'dart:math';

import 'package:craftown/src/utils/device.dart';
import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  final Function() handleClose;
  final String title;
  final String? shortcutKey;
  final double width;
  final Widget child;
  final double? maxContentHeightOverride;
  const MenuContainer({
    super.key,
    required this.title,
    required this.handleClose,
    required this.width,
    required this.child,
    this.maxContentHeightOverride,
    this.shortcutKey,
  });

  @override
  Widget build(BuildContext context) {
    final maxContentHeight = MediaQuery.of(context).size.height - 32 - 64;
    // ignore: no_leading_underscores_for_local_identifiers
    final _maxContentHeight = maxContentHeightOverride != null ? min(maxContentHeightOverride!, maxContentHeight) : maxContentHeight;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            handleClose();
          },
          child: Container(
            color: Colors.black26,
            width: double.infinity,
            height: double.infinity,
          ),
          //  child: BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          //   child: Container(
          //     color: Colors.black26,
          //     width: double.infinity,
          //     height: double.infinity,
          //   ),
          // ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            if (shortcutKey != null && !isTouchDevice(context)) ...[
                              SizedBox(width: 8),
                              Icon(Icons.keyboard, size: 18, color: Colors.black87),
                              SizedBox(width: 3),
                              Transform.translate(
                                offset: Offset(0, 1),
                                child: Text(
                                  shortcutKey!.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black87,
                                    height: 1,
                                  ),
                                ),
                              )
                            ]
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            handleClose();
                          },
                          child: const Icon(
                            Icons.close,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: _maxContentHeight),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
