import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext, ScreenType) builder;

  const ResponsiveBuilder({super.key, required this.builder});

  static ScreenType getScreenType(double width) {
    if (width >= 1200) return ScreenType.desktop;
    if (width >= 768) return ScreenType.tablet;
    return ScreenType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = getScreenType(constraints.maxWidth);
        return builder(context, screenType);
      },
    );
  }
}
