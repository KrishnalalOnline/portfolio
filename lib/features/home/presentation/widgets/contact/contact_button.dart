import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final String label;

  const ContactButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // TODO: implement actual navigation
      },
      child: Text(label),
    );
  }
}
