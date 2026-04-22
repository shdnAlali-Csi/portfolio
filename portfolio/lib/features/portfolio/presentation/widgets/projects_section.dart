import 'package:flutter/material.dart';
import '../../models/project_item.dart';
import 'shared_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.compact,
    required this.title,
    required this.subtitle,
    required this.projects,
  });

  final bool compact;
  final String title;
  final String subtitle;
  final List<ProjectItem> projects;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 20 : 64,
        vertical: compact ? 24 : 44,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: title, subtitle: subtitle),
          const SizedBox(height: 20),
          ...projects.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final project = entry.value;
              return Padding(
                padding: EdgeInsets.only(bottom: index == projects.length - 1 ? 0 : 18),
                child: ProjectCard(project: project),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(project.period, style: const TextStyle(color: Color(0xFF90A9D5))),
          const SizedBox(height: 4),
          Text(project.tech, style: const TextStyle(color: Color(0xFF59C9FF))),
          const SizedBox(height: 12),
          ...project.highlights.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7, right: 8),
                    child: CircleAvatar(
                      radius: 2,
                      backgroundColor: Color(0xFF7DCBFF),
                    ),
                  ),
                  Expanded(child: Text(item, style: const TextStyle(height: 1.5))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
