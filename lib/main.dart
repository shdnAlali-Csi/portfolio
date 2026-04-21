import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shdn Alali Portfolio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primaryColor: Colors.blueAccent,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _controller = ScrollController();

  void scrollTo(double offset) {
    _controller.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: const Text("Shdn Alali Portfolio"),
        actions: [
          TextButton(onPressed: () => scrollTo(0), child: const Text("Home")),
          TextButton(onPressed: () => scrollTo(500), child: const Text("About")),
          TextButton(onPressed: () => scrollTo(900), child: const Text("Skills")),
          TextButton(onPressed: () => scrollTo(1200), child: const Text("Projects")),
          TextButton(onPressed: () => scrollTo(1700), child: const Text("Contact")),
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}

// ---------------- HERO ----------------
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Shdn Alali",
            style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Data Engineer & Flutter Developer",
            style: TextStyle(fontSize: 24, color: Colors.blueAccent),
          ),
          SizedBox(height: 20),
          Text(
            "SQL • Oracle • Data Modeling • ERD • Flutter • REST APIs",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// ---------------- ABOUT ----------------
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("About Me", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
            "Data Engineer specialized in SQL, Oracle Database, Data Modeling and ERD design. "
            "Also experienced in Flutter development and building mobile applications integrated with backend systems.",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// ---------------- SKILLS ----------------
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      "SQL",
      "Oracle DB",
      "Data Modeling",
      "ERD Design",
      "Flutter",
      "Dart",
      "REST API",
      "Git",
      "OOP",
    ];

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Skills", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills
                .map((s) => Chip(
                      label: Text(s),
                      backgroundColor: Colors.blueAccent.withOpacity(0.2),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

// ---------------- PROJECTS ----------------
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Projects", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ProjectCard(
            title: "CarCare App",
            description: "Flutter mobile app for car management and services system.",
          ),
          SizedBox(height: 20),
          ProjectCard(
            title: "Restaurant Data Warehouse",
            description: "Oracle DB, PL/SQL, ERD, and analytical data warehouse design.",
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const ProjectCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(description, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

// ---------------- CONTACT ----------------
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Contact", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Email: shdnalali285@gmail.com"),
          Text("Phone: +963981474617"),
          Text("Location: Damascus, Syria"),
          Text("GitHub: github.com/shdnAlali-Csi"),
        ],
      ),
    );
  }
}