import 'package:flutter/material.dart';
import 'package:new_portfolio/core/utils/section_id.dart';

class TopNavBar extends StatefulWidget {
  final ScrollController scrollController;
  final void Function(SectionId) onItemTap;

  const TopNavBar({
    super.key,
    required this.scrollController,
    required this.onItemTap,
  });

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}


class _TopNavBarState extends State<TopNavBar> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final shouldShow = widget.scrollController.offset > 80;
    if (shouldShow != _visible) {
      setState(() => _visible = shouldShow);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedSlide(
      offset: _visible ? Offset.zero : const Offset(0, -1),
      duration: const Duration(milliseconds: 300),
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: Material(
          elevation: 8,
          color: theme.colorScheme.surface,
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: 64,
              child: Row(
                children: [
                  const SizedBox(width: 24),

                  Text(
                    'Krishnalal A K',
                    style: theme.textTheme.titleMedium,
                  ),

                  const Spacer(),

                  _NavItem(
                    label: 'Home',
                    onTap: () =>
                        widget.onItemTap(SectionId.hero),
                  ),
                  _NavItem(
                    label: 'Skills',
                    onTap: () =>
                        widget.onItemTap(SectionId.skills),
                  ),
                  _NavItem(
                    label: 'Projects',
                    onTap: () =>
                        widget.onItemTap(SectionId.projects),
                  ),
                  _NavItem(
                    label: 'Experience',
                    onTap: () =>
                        widget.onItemTap(SectionId.experience),
                  ),
                  _NavItem(
                    label: 'Contact',
                    onTap: () =>
                        widget.onItemTap(SectionId.contact),
                  ),

                  const SizedBox(width: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(label),
      ),
    );
  }
}
