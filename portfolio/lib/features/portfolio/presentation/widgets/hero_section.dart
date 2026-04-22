import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.compact,
    required this.heroBadge,
    required this.heroTitle,
    required this.heroDescription,
    required this.hireMeLabel,
    required this.viewProjectsLabel,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  final bool compact;
  final String heroBadge;
  final String heroTitle;
  final String heroDescription;
  final String hireMeLabel;
  final String viewProjectsLabel;
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = compact ? 20.0 : 64.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: compact ? 34 : 74,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0E1E40),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFF38BDF8).withOpacity(0.3),
              ),
            ),
            child: Text(
              heroBadge,
              style: const TextStyle(color: Color(0xFF9AE6FF), fontSize: 12),
            ),
          ),
          SizedBox(height: compact ? 18 : 28),
          Text(
            heroTitle,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: compact ? 34 : 58,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              heroDescription,
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFFC7D4F6),
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: compact ? 20 : 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: onContactTap,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  backgroundColor: const Color(0xFF38BDF8),
                  foregroundColor: const Color(0xFF00122A),
                ),
                child: Text(hireMeLabel),
              ),
              OutlinedButton(
                onPressed: onProjectsTap,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  side: const BorderSide(color: Color(0xFF355080)),
                  foregroundColor: Colors.white,
                ),
                child: Text(viewProjectsLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
