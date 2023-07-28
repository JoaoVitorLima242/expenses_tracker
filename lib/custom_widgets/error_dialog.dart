import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  void _onClose(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Invalid Input'),
      content: const Text(
          'Please make sure a valid title, amount, date e category was entered.'),
      actions: [
        TextButton(
          onPressed: () => _onClose(context),
          child: const Text('Okay'),
        )
      ],
    );
  }
}
