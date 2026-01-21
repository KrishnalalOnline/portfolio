import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String tooltip;
  final bool showLabel;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
    this.showLabel = false,
  });

  Future<void> _launch() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Tooltip(
      message: tooltip,
      child: InkResponse(
        onTap: _launch,
        radius: 24,
        child: Container(
          // width: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 44,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(30),
            color: theme.colorScheme.surface,
            border: Border.all(
              color: theme.colorScheme.outline.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              FaIcon(
                icon,
                size: 20,
                color: theme.colorScheme.primary,
              ),
              if (showLabel) ...[
                const SizedBox(width: 8),
                Text(
                  tooltip,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}