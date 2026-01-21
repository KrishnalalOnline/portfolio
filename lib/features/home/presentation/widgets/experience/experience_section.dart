import 'package:flutter/material.dart';
import 'package:new_portfolio/features/home/presentation/widgets/projects/experience_item.dart';
import '../../../../../core/widgets/responsive_builder.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenType) {
        switch (screenType) {
          case ScreenType.desktop:
            return const _DesktopExperience();
          case ScreenType.tablet:
            return const _TabletExperience();
          case ScreenType.mobile:
            return const _MobileExperience();
        }
      },
    );
  }
}

const experienceItems = [
  ExperienceItem(
    role: 'Flutter Developer',
    organization: 'Professional Experience',
    duration: 'Present',
    points: [
      'Developed mobile and web applications using Flutter',
      'Implemented responsive UI and reusable widget components',
      'Integrated REST APIs for data communication',
      'Used Firebase Authentication and Firestore for backend services',
      'Applied Clean Architecture principles for maintainable code',
      'Used BLoC and Provider for state management',
      'Worked with Git for version control',
      'Used Codemagic for CI/CD workflows',
      'Collaborated with designers using Figma',
    ],
  ),
  ExperienceItem(
    role: 'Full Stack Developer',
    organization: 'Project-Based Experience',
    duration: 'Previous',
    points: [
      'Developed backend services using PHP',
      'Worked with SQL databases for data storage',
      'Designed and consumed RESTful APIs',
      'Integrated backend services with Flutter applications',
      'Worked with Google Cloud services for deployment',
      'Handled complete development lifecycle of applications',
    ],
  ),
];


class _DesktopExperience extends StatelessWidget {
  const _DesktopExperience();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Experience', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 48),
          ...experienceItems.map(
            (item) => _TimelineItem(item: item),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final ExperienceItem item;

  const _TimelineItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Container(
                width: 2,
                height: 140,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(width: 32),
          Expanded(child: _ExperienceCard(item: item)),
        ],
      ),
    );
  }
}


class _ExperienceCard extends StatelessWidget {
  final ExperienceItem item;

  const _ExperienceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.role, style: theme.textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            '${item.organization} • ${item.duration}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          ...item.points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 6),
                  const SizedBox(width: 12),
                  Expanded(child: Text(point)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _TabletExperience extends StatelessWidget {
  const _TabletExperience();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Experience',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experienceItems.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (_, index) =>
                _ExperienceCard(item: experienceItems[index]),
          ),
        ],
      ),
    );
  }
}


class _MobileExperience extends StatelessWidget {
  const _MobileExperience();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Experience',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 24),
          ...experienceItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ExperienceCard(item: item),
            ),
          ),
        ],
      ),
    );
  }
}

