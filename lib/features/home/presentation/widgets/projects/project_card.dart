import 'package:flutter/material.dart';
import 'package:new_portfolio/features/home/presentation/widgets/projects/project_items.dart';

class ProjectCard extends StatelessWidget {
  final ProjectItem project;

  const ProjectCard({required this.project});

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
          Text(project.title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            project.type,
            style: theme.textTheme.bodySmall
                ?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Text(
            project.description,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.technologies
                .map(
                  (tech) => Chip(
                    label: Text(tech),
                    materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
