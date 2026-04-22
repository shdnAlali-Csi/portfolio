import 'package:flutter/material.dart';

class TopNavButton extends StatelessWidget {
  const TopNavButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(color: Color(0xFFD5E6FF)),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontSize: 34, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(subtitle, style: const TextStyle(color: Color(0xFFAABBE0))),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  const ContactRow({
    super.key,
    required this.icon,
    required this.value,
  });

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF7DD3FC), size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Color(0xFFD4E4FF)),
          ),
        ),
      ],
    );
  }
}

BoxDecoration cardDecoration() {
  return BoxDecoration(
    color: const Color(0xFF101A33),
    borderRadius: BorderRadius.circular(18),
    border: Border.all(color: const Color(0xFF2A426C)),
    boxShadow: const [
      BoxShadow(
        color: Color.fromRGBO(1, 7, 18, 0.35),
        blurRadius: 20,
        offset: Offset(0, 10),
      ),
    ],
  );
}
