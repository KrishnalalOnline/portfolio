import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_portfolio/features/home/presentation/widgets/social_icon_btn.dart';
import '../../../../../core/widgets/responsive_builder.dart';
import 'hero_title.dart';
import 'hover_cta.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenType) {
        switch (screenType) {
          case ScreenType.desktop:
            return const _DesktopHero();
          case ScreenType.tablet:
            return const _TabletHero();
          case ScreenType.mobile:
            return const _MobileHero();
        }
      },
    );
  }
}

class _DesktopHero extends StatelessWidget {
  const _DesktopHero();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroTitle(),
                SizedBox(height: 24),
                Text(
                  'Building scalable Flutter apps\nwith clean architecture',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 24),

                Row(
                  children: [
                    SocialIconButton(
                      icon: FontAwesomeIcons.download, // placeholder for GitHub icon
                      url: 'https://drive.google.com/file/d/1_1XsCgKTI8-mIqdSnifwFYnQpunwtCVK/view?usp=sharing',
                      tooltip: 'Download Resume',
                      showLabel: true,
                    ),

                    const SizedBox(width: 12),

                    SocialIconButton(
                      icon: FontAwesomeIcons.github, // placeholder for GitHub icon
                      url: 'https://github.com/KrishnalalOnline',
                      tooltip: 'GitHub',
                    ),

                    const SizedBox(width: 12),

                    SocialIconButton(
                      icon: FontAwesomeIcons.linkedin, // placeholder for LinkedIn icon
                      url: 'https://in.linkedin.com/in/krishnalal-online',
                      tooltip: 'LinkedIn',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          const Icon(Icons.code, size: 180), // placeholder for Rive later
        ],
      ),
    );
  }
}

class _TabletHero extends StatelessWidget {
  const _TabletHero();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroTitle(),
          SizedBox(height: 20),
          Text(
            'Building scalable Flutter apps\nwith clean architecture',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 32),
          Icon(Icons.code, size: 140),
        ],
      ),
    );
  }
}

class _MobileHero extends StatelessWidget {
  const _MobileHero();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroTitle(),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Building scalable Flutter apps\nwith clean architecture',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
