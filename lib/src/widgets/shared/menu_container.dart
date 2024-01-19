import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  final Function() handleClose;
  final String title;
  final double width;
  final Widget child;
  const MenuContainer({
    super.key,
    required this.title,
    required this.handleClose,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
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
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
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
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
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
                child,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
