import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  final ScrollController scrollController;

  const FooterSection({
    super.key,
    required this.scrollController,
  });

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final year = DateTime.now().year;

    return Material(
      elevation: 6,
      color: theme.colorScheme.surface,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;

            return isMobile
                ? _MobileFooter(
                    year: year,
                    onTop: _scrollToTop,
                  )
                : _DesktopFooter(
                    year: year,
                    onTop: _scrollToTop,
                  );
          },
        ),
      ),
    );
  }
}


class _DesktopFooter extends StatelessWidget {
  final int year;
  final VoidCallback onTop;

  const _DesktopFooter({
    required this.year,
    required this.onTop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Left
        Expanded(
          child: Text(
            '© $year Krishnalal A K',
            style: theme.textTheme.bodyMedium,
          ),
        ),

        // Center
        Text(
          'Built with Flutter • Crafted with ❤️',
          style: theme.textTheme.bodySmall,
        ),

        // Right
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onTop,
              icon: const Icon(Icons.arrow_upward, size: 18),
              label: const Text('Top'),
            ),
          ),
        ),
      ],
    );
  }
}

class _MobileFooter extends StatelessWidget {
  final int year;
  final VoidCallback onTop;

  const _MobileFooter({
    required this.year,
    required this.onTop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          '© $year Krishnalal A K',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 6),
        Text(
          'Built with Flutter • Crafted with ❤️',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        TextButton.icon(
          onPressed: onTop,
          icon: const Icon(Icons.arrow_upward, size: 18),
          label: const Text('Back to top'),
        ),
      ],
    );
  }
}

