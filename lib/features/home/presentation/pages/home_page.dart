import 'package:flutter/material.dart';

import 'package:new_portfolio/core/utils/section_id.dart';

import 'package:new_portfolio/features/home/presentation/widgets/contact/contact_section.dart';
import 'package:new_portfolio/features/home/presentation/widgets/experience/experience_section.dart';
import 'package:new_portfolio/features/home/presentation/widgets/footer/footer_section.dart';
import 'package:new_portfolio/features/home/presentation/widgets/hero/hero_section.dart';

import 'package:new_portfolio/features/home/presentation/widgets/navbar/top_nav_bar.dart';
import 'package:new_portfolio/features/home/presentation/widgets/projects/project_section.dart';
import 'package:new_portfolio/features/home/presentation/widgets/skills/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final Map<SectionId, GlobalKey> _sectionKeys = {
    SectionId.hero: GlobalKey(),
    SectionId.skills: GlobalKey(),
    SectionId.projects: GlobalKey(),
    SectionId.experience: GlobalKey(),
    SectionId.contact: GlobalKey(),
  };

  void _scrollToSection(SectionId section) {
    final key = _sectionKeys[section];
    final context = key?.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  key: _sectionKeys[SectionId.hero],
                  child: const HeroSection(),
                ),
                Container(
                  key: _sectionKeys[SectionId.skills],
                  child: const SkillsSection(),
                ),
                Container(
                  key: _sectionKeys[SectionId.projects],
                  child: const ProjectsSection(),
                ),
                Container(
                  key: _sectionKeys[SectionId.experience],
                  child: const ExperienceSection(),
                ),
                Container(
                  key: _sectionKeys[SectionId.contact],
                  child: const ContactSection(),
                ),
                FooterSection(scrollController: _scrollController),
              ],
            ),
          ),

          /// Sticky Navbar
          TopNavBar(
            scrollController: _scrollController,
            onItemTap: _scrollToSection,
          ),
        ],
      ),
    );
  }
}
