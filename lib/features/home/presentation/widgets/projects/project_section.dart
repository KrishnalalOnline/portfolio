import 'package:flutter/material.dart';
import 'package:new_portfolio/features/home/presentation/widgets/projects/project_card.dart';
import '../../../../../core/widgets/responsive_builder.dart';
import 'project_items.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenType) {
        switch (screenType) {
          case ScreenType.desktop:
            return const _DesktopProjects();
          case ScreenType.tablet:
            return const _TabletProjects();
          case ScreenType.mobile:
            return const _MobileProjects();
        }
      },
    );
  }
}

const projectItems = [
  ProjectItem(
    title: 'Flutter Mobile Application',
    type: 'Mobile App',
    description:
        'Developed a Flutter-based mobile application with responsive UI '
        'and backend integration.',
    technologies: [
      'Flutter',
      'REST API',
      'Firebase Authentication',
      'Firestore',
      'BLoC',
    ],
  ),
  ProjectItem(
    title: 'Flutter Web Application',
    type: 'Web App',
    description:
        'Built a web application using Flutter Web with API integration '
        'and optimized layout for different screen sizes.',
    technologies: [
      'Flutter Web',
      'REST API',
      'Responsive UI',
      'Git',
    ],
  ),
  ProjectItem(
    title: 'Backend API Service',
    type: 'Backend',
    description:
        'Developed backend services to support Flutter applications '
        'with secure data handling.',
    technologies: [
      'PHP',
      'SQL',
      'REST API',
      'Google Cloud',
    ],
  ),
];


class _DesktopProjects extends StatelessWidget {
  const _DesktopProjects();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projectItems.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1.25,
            ),
            itemBuilder: (_, index) =>
                ProjectCard(project: projectItems[index]),
          ),
        ],
      ),
    );
  }
}


class _TabletProjects extends StatelessWidget {
  const _TabletProjects();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projectItems.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (_, index) =>
                ProjectCard(project: projectItems[index]),
          ),
        ],
      ),
    );
  }
}


class _MobileProjects extends StatelessWidget {
  const _MobileProjects();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          ...projectItems.map(
            (project) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ProjectCard(project: project),
            ),
          ),
        ],
      ),
    );
  }
}
