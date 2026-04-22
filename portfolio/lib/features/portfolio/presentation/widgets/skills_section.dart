import 'package:flutter/material.dart';
import 'shared_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
    required this.compact,
    required this.title,
    required this.subtitle,
    required this.skills,
  });

  final bool compact;
  final String title;
  final String subtitle;
  final List<String> skills;

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
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(skill),
                    backgroundColor: const Color(0xFF122245),
                    labelStyle: const TextStyle(color: Color(0xFFD6E7FF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Color(0xFF2B4574)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
