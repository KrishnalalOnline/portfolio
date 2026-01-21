import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter/widget_previews.dart';

class HeroTitle extends StatelessWidget {
  @Preview(name: 'Hero Title')
  const HeroTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'KRISHNALAL A K',
          style: Theme.of(context).textTheme.headlineLarge,
        ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3),
        // Text(
        //   'Flutter Engineer',
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
      ],
    );
  }
}
