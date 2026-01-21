import 'package:flutter/material.dart';
import '../../../../../core/widgets/hover_scale.dart';

class HeroCTA extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const HeroCTA({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
