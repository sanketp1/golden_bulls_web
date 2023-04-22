import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String successButtonText;
  final String errorButtonText;
  final bool isSuccess;

  CustomDialog({
    required this.title,
    required this.message,
    required this.successButtonText,
    required this.errorButtonText,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        ElevatedButton(
          child: Text(isSuccess ? successButtonText : errorButtonText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
