import 'package:flutter/material.dart';
import 'shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.compact,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  final bool compact;
  final String title;
  final String subtitle;
  final String description;

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
          Container(
            padding: const EdgeInsets.all(22),
            decoration: cardDecoration(),
            child: Text(
              description,
              style: const TextStyle(fontSize: 16, height: 1.7),
            ),
          ),
        ],
      ),
    );
  }
}
