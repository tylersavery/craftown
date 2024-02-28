import 'package:flutter/material.dart';

class ConfirmDialog {
  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String body,
  }) async {
    final confirmed = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(),
            title: Text(title),
            content: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 320),
              child: Text(
                body,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("Yes"),
              ),
            ],
          );
        });

    return confirmed == true;
  }
}
