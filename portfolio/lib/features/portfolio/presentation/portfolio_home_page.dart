import 'package:flutter/material.dart';
import '../data/portfolio_content.dart';
import 'widgets/about_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/shared_widgets.dart';
import 'widgets/skills_section.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final compact = width < 900;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        titleSpacing: 24,
        elevation: 0,
        backgroundColor: const Color(0xFF0A0F1E),
        title: const Text(
          'Shdn Alali',
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.3),
        ),
        actions: compact
            ? const [SizedBox(width: 8)]
            : [
                TopNavButton(
                  title: PortfolioContent.navHome,
                  onTap: () => _scrollToKey(_heroKey),
                ),
                TopNavButton(
                  title: PortfolioContent.navAbout,
                  onTap: () => _scrollToKey(_aboutKey),
                ),
                TopNavButton(
                  title: PortfolioContent.navSkills,
                  onTap: () => _scrollToKey(_skillsKey),
                ),
                TopNavButton(
                  title: PortfolioContent.navProjects,
                  onTap: () => _scrollToKey(_projectsKey),
                ),
                TopNavButton(
                  title: PortfolioContent.navContact,
                  onTap: () => _scrollToKey(_contactKey),
                ),
                const SizedBox(width: 16),
              ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: _heroKey,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0C1325), Color(0xFF0A0F1E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: HeroSection(
                compact: compact,
                heroBadge: PortfolioContent.heroBadge,
                heroTitle: PortfolioContent.heroTitle,
                heroDescription: PortfolioContent.heroDescription,
                hireMeLabel: PortfolioContent.hireMe,
                viewProjectsLabel: PortfolioContent.viewProjects,
                onContactTap: () => _scrollToKey(_contactKey),
                onProjectsTap: () => _scrollToKey(_projectsKey),
              ),
            ),
            AboutSection(
              key: _aboutKey,
              compact: compact,
              title: PortfolioContent.aboutTitle,
              subtitle: PortfolioContent.aboutSubtitle,
              description: PortfolioContent.aboutDescription,
            ),
            SkillsSection(
              key: _skillsKey,
              compact: compact,
              title: PortfolioContent.skillsTitle,
              subtitle: PortfolioContent.skillsSubtitle,
              skills: PortfolioContent.skills,
            ),
            ProjectsSection(
              key: _projectsKey,
              compact: compact,
              title: PortfolioContent.projectsTitle,
              subtitle: PortfolioContent.projectsSubtitle,
              projects: PortfolioContent.projects,
            ),
            ContactSection(
              key: _contactKey,
              compact: compact,
              title: PortfolioContent.contactTitle,
              subtitle: PortfolioContent.contactSubtitle,
              footer: PortfolioContent.contactFooter,
              email: PortfolioContent.email,
              phone: PortfolioContent.phone,
              location: PortfolioContent.location,
              github: PortfolioContent.github,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
