import '../models/project_item.dart';

class PortfolioContent {
  static const navHome = 'Home';
  static const navAbout = 'About';
  static const navSkills = 'Skills';
  static const navProjects = 'Projects';
  static const navContact = 'Contact';

  static const heroBadge = 'Data Engineer | SQL | Oracle | Flutter';
  static const heroTitle = 'Building reliable data systems\nthat power smart products';
  static const heroDescription =
      'I am Shdn Alali, a Data Engineer with hands-on experience in Oracle databases, data modeling, and building practical Flutter applications integrated with backend APIs.';
  static const hireMe = 'Hire Me';
  static const viewProjects = 'View Projects';

  static const aboutTitle = 'About';
  static const aboutSubtitle = 'A focused profile with practical delivery mindset';
  static const aboutDescription =
      'Data Engineer with strong expertise in SQL and Oracle Database, specializing in data modeling and ERD design to build scalable, efficient structures. I translate system requirements into clean schemas, enforce business rules with PL/SQL, and support analytics with data warehouse models. I also bring Flutter experience to deliver full data-driven solutions from database to user interface.';

  static const skillsTitle = 'Core Skills';
  static const skillsSubtitle = 'Technologies and strengths I use to deliver value';
  static const skills = <String>[
    'SQL',
    'Oracle Database',
    'Data Modeling',
    'ERD Design',
    'Schema Design',
    'PL/SQL',
    'Query Optimization',
    'Data Analysis',
    'Flutter',
    'Dart',
    'REST API Integration',
    'Git / Version Control',
    'OOP',
    'Problem Solving',
  ];

  static const projectsTitle = 'Projects';
  static const projectsSubtitle = 'Selected work that matches data engineering roles';
  static const projects = <ProjectItem>[
    ProjectItem(
      title: 'CarCare - Car Management and Services',
      tech: 'Flutter, Dart, REST API Integration',
      period: '01/2026 - Present',
      highlights: [
        'Built responsive UI for car management, emergency assistance, fuel and wash requests.',
        'Created reusable components to accelerate feature delivery and keep the app consistent.',
        'Collaborated with team members to deliver a clean, user-friendly mobile experience.',
      ],
    ),
    ProjectItem(
      title: 'Restaurant Reservation Data Warehouse',
      tech: 'Oracle, PL/SQL, Data Modeling, Materialized Views',
      period: '11/2025 - 01/2026',
      highlights: [
        'Designed ERD and relational schema for reservation workflows on Oracle Database.',
        'Implemented PL/SQL procedures/triggers for validation, conflict prevention and automation.',
        'Built audit logging with JSON before/after values and delivered a dimensional analytics model.',
      ],
    ),
  ];

  static const contactTitle = 'Contact';
  static const contactSubtitle = 'Open to internships and full-time opportunities';
  static const contactFooter = 'Let us build reliable data products together.';

  static const email = 'shdnalali285@gmail.com';
  static const phone = '+963981474617';
  static const location = 'Damascus, Syria';
  static const github = 'github.com/shdnAlali-Csi';
}
