import 'package:flutter/material.dart';
import '../../../../../core/widgets/responsive_builder.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenType) {
        switch (screenType) {
          case ScreenType.desktop:
            return const _DesktopAbout();
          case ScreenType.tablet:
            return const _TabletAbout();
          case ScreenType.mobile:
            return const _MobileAbout();
        }
      },
    );
  }
}


class _DesktopAbout extends StatelessWidget {
  const _DesktopAbout();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'About Me',
              style: theme.textTheme.headlineMedium,
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            flex: 5,
            child: Text(
              'I am a Flutter engineer focused on building scalable, '
              'high-performance applications for mobile and web.\n\n'
              'I work extensively with Clean Architecture, BLoC, and '
              'modern Flutter tooling to create maintainable, testable, '
              'and production-ready applications.\n\n'
              'My approach emphasizes code quality, performance, and '
              'thoughtful user experience.',
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}


class _TabletAbout extends StatelessWidget {
  const _TabletAbout();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          Text(
            'I am a Flutter engineer focused on building scalable, '
            'high-performance applications for mobile and web.\n\n'
            'I specialize in Clean Architecture, BLoC, and modern '
            'Flutter tooling to create maintainable and testable systems.',
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}


class _MobileAbout extends StatelessWidget {
  const _MobileAbout();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Flutter engineer focused on scalable mobile and web apps. '
            'Clean Architecture, BLoC, and performance-driven development '
            'are at the core of my work.',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
