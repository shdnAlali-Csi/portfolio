import 'package:flutter/material.dart';
import 'shared_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.compact,
    required this.title,
    required this.subtitle,
    required this.footer,
    required this.email,
    required this.phone,
    required this.location,
    required this.github,
  });

  final bool compact;
  final String title;
  final String subtitle;
  final String footer;
  final String email;
  final String phone;
  final String location;
  final String github;

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
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: cardDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactRow(icon: Icons.email_outlined, value: email),
                const SizedBox(height: 12),
                ContactRow(icon: Icons.phone_outlined, value: phone),
                const SizedBox(height: 12),
                ContactRow(icon: Icons.location_on_outlined, value: location),
                const SizedBox(height: 12),
                ContactRow(icon: Icons.code_outlined, value: github),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            footer,
            style: const TextStyle(
              color: Color(0xFF79D5FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
