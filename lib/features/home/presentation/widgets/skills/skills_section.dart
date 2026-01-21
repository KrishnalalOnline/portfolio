import 'package:flutter/material.dart';
import 'package:new_portfolio/core/widgets/skill_card.dart';
import '../../../../../core/widgets/responsive_builder.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenType) {
        switch (screenType) {
          case ScreenType.desktop:
            return const _DesktopSkills();
          case ScreenType.tablet:
            return const _TabletSkills();
          case ScreenType.mobile:
            return const _MobileSkills();
        }
      },
    );
  }
}

class _DesktopSkills extends StatelessWidget {
  const _DesktopSkills();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 40),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SkillCard(
                title: 'Flutter',
                icon: Icons.flutter_dash,
                skills: ['Mobile', 'Web', 'Animations', 'Responsive UI'],
              ),
              SkillCard(
                title: 'Architecture & State',
                icon: Icons.account_tree_outlined,
                skills: [
                  'Clean Architecture',
                  'BLoC',
                  'Provider',
                  'GetIt (DI)',
                ],
              ),
              SkillCard(
                title: 'Backend',
                icon: Icons.storage_outlined,
                skills: ['PHP', 'REST APIs', 'SQL'],
              ),
              SkillCard(
                title: 'Firebase',
                icon: Icons.cloud_outlined,
                skills: ['Auth', 'Firestore', 'Cloud Functions'],
              ),
              SkillCard(
                title: 'Cloud',
                icon: Icons.cloud_queue,
                skills: ['Google Cloud', 'App Hosting', 'API Integration'],
              ),
              SkillCard(
                title: 'Tools & CI/CD',
                icon: Icons.build_outlined,
                skills: ['Git', 'Codemagic', 'CI/CD', 'Figma'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabletSkills extends StatelessWidget {
  const _TabletSkills();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SkillCard(
                title: 'Flutter',
                icon: Icons.flutter_dash,
                skills: ['Mobile', 'Web', 'Animations', 'Responsive UI'],
              ),
              SkillCard(
                title: 'Architecture & State',
                icon: Icons.account_tree_outlined,
                skills: ['Clean Architecture', 'BLoC', 'Provider', 'GetIt'],
              ),
              SkillCard(
                title: 'Backend',
                icon: Icons.storage_outlined,
                skills: ['PHP', 'REST APIs', 'SQL'],
              ),
              SkillCard(
                title: 'Firebase',
                icon: Icons.cloud_outlined,
                skills: ['Auth', 'Firestore', 'Functions'],
              ),
              SkillCard(
                title: 'Cloud',
                icon: Icons.cloud_queue,
                skills: ['Google Cloud', 'Hosting', 'APIs'],
              ),
              SkillCard(
                title: 'Tools & CI/CD',
                icon: Icons.build_outlined,
                skills: ['Git', 'Codemagic', 'CI/CD', 'Figma'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MobileSkills extends StatelessWidget {
  const _MobileSkills();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 24),

          const SkillCard(
            title: 'Flutter',
            icon: Icons.flutter_dash,
            skills: ['Mobile', 'Web', 'Animations', 'Responsive UI'],
          ),
          const SizedBox(height: 16),

          const SkillCard(
            title: 'Architecture & State',
            icon: Icons.account_tree_outlined,
            skills: ['Clean Architecture', 'BLoC', 'Provider', 'GetIt'],
          ),
          const SizedBox(height: 16),

          const SkillCard(
            title: 'Backend',
            icon: Icons.storage_outlined,
            skills: ['PHP', 'REST APIs', 'SQL'],
          ),
          const SizedBox(height: 16),

          const SkillCard(
            title: 'Firebase',
            icon: Icons.cloud_outlined,
            skills: ['Auth', 'Firestore', 'Functions'],
          ),
          const SizedBox(height: 16),

          const SkillCard(
            title: 'Cloud',
            icon: Icons.cloud_queue,
            skills: ['Google Cloud', 'Hosting', 'APIs'],
          ),
          const SizedBox(height: 16),

          const SkillCard(
            title: 'Tools & CI/CD',
            icon: Icons.build_outlined,
            skills: ['Git', 'Codemagic', 'CI/CD', 'Figma'],
          ),
        ],
      ),
    );
  }
}
