import 'package:flutter/material.dart';
import 'package:new_portfolio/core/widgets/responsive_builder.dart';
import 'package:new_portfolio/features/home/presentation/widgets/contact/contact_form.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenType) {
        switch (screenType) {
          case ScreenType.desktop:
            return const _DesktopContactForm();
          case ScreenType.tablet:
            return const _TabletContactForm();
          case ScreenType.mobile:
            return const _MobileContactForm();
        }
      },
    );
  }
}

class _DesktopContactForm extends StatelessWidget {
  const _DesktopContactForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 100),
      child: const SizedBox(
        width: 600,
        child: ContactForm(),
      ),
    );
  }
}


class _TabletContactForm extends StatelessWidget {
  const _TabletContactForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 80),
      child: const ContactForm(),
    );
  }
}


class _MobileContactForm extends StatelessWidget {
  const _MobileContactForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: const ContactForm(),
    );
  }
}

