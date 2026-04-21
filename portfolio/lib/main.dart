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
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0F1E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF38BDF8),
          secondary: Color(0xFF22D3EE),
          surface: Color(0xFF101A33),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.w800, height: 1.2),
          headlineMedium: TextStyle(fontWeight: FontWeight.w700),
          titleLarge: TextStyle(fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(color: Color(0xFFC8D2F0)),
          bodyMedium: TextStyle(color: Color(0xFFAEB9D8)),
        ),
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
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();
  bool _isArabic = true;

  Map<String, String> get t => _isArabic ? _ar : _en;

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

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

    return Directionality(
      textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
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
              ? [
                  _LanguageButton(
                    label: _isArabic ? 'EN' : 'AR',
                    onTap: () => setState(() => _isArabic = !_isArabic),
                  ),
                  const SizedBox(width: 8),
                ]
              : [
                  _TopNavButton(
                    title: t['navHome']!,
                    onTap: () => _scrollToKey(_heroKey),
                  ),
                  _TopNavButton(
                    title: t['navAbout']!,
                    onTap: () => _scrollToKey(_aboutKey),
                  ),
                  _TopNavButton(
                    title: t['navSkills']!,
                    onTap: () => _scrollToKey(_skillsKey),
                  ),
                  _TopNavButton(
                    title: t['navProjects']!,
                    onTap: () => _scrollToKey(_projectsKey),
                  ),
                  _TopNavButton(
                    title: t['navContact']!,
                    onTap: () => _scrollToKey(_contactKey),
                  ),
                  _LanguageButton(
                    label: _isArabic ? 'EN' : 'AR',
                    onTap: () => setState(() => _isArabic = !_isArabic),
                  ),
                  const SizedBox(width: 16),
                ],
        ),
        body: SingleChildScrollView(
          controller: _controller,
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
                  onContactTap: () => _scrollToKey(_contactKey),
                  onProjectsTap: () => _scrollToKey(_projectsKey),
                  t: t,
                ),
              ),
              AboutSection(key: _aboutKey, compact: compact, t: t),
              SkillsSection(key: _skillsKey, compact: compact, t: t),
              ProjectsSection(key: _projectsKey, compact: compact, t: t),
              ContactSection(key: _contactKey, compact: compact, t: t),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final bool compact;
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;
  final Map<String, String> t;

  const HeroSection({
    super.key,
    required this.compact,
    required this.onContactTap,
    required this.onProjectsTap,
    required this.t,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = compact ? 20.0 : 64.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: compact ? 34 : 74),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0E1E40),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF38BDF8).withOpacity(0.3)),
            ),
            child: Text(
              t['heroBadge']!,
              style: TextStyle(color: Color(0xFF9AE6FF), fontSize: 12),
            ),
          ),
          SizedBox(height: compact ? 18 : 28),
          Text(
            t['heroTitle']!,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: compact ? 34 : 58,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              t['heroDesc']!,
              style: TextStyle(fontSize: 17, color: Color(0xFFC7D4F6), height: 1.6),
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
                child: Text(t['hireMe']!),
              ),
              OutlinedButton(
                onPressed: onProjectsTap,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  side: const BorderSide(color: Color(0xFF355080)),
                  foregroundColor: Colors.white,
                ),
                child: Text(t['viewProjects']!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  final bool compact;
  final Map<String, String> t;
  const AboutSection({super.key, required this.compact, required this.t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: compact ? 20 : 64, vertical: compact ? 24 : 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            title: t['about']!,
            subtitle: t['aboutSubtitle']!,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: _cardDecoration(),
            child: Text(
              t['aboutDesc']!,
              style: TextStyle(fontSize: 16, height: 1.7),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final bool compact;
  final Map<String, String> t;
  const SkillsSection({super.key, required this.compact, required this.t});

  @override
  Widget build(BuildContext context) {
    const skills = [
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: compact ? 20 : 64, vertical: compact ? 24 : 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            title: t['skills']!,
            subtitle: t['skillsSubtitle']!,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills
                .map((s) => Chip(
                      label: Text(s),
                      backgroundColor: const Color(0xFF122245),
                      labelStyle: const TextStyle(color: Color(0xFFD6E7FF)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFF2B4574)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  final bool compact;
  final Map<String, String> t;
  const ProjectsSection({super.key, required this.compact, required this.t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: compact ? 20 : 64, vertical: compact ? 24 : 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            title: t['projects']!,
            subtitle: t['projectsSubtitle']!,
          ),
          const SizedBox(height: 20),
          ProjectCard(
            title: t['project1Title']!,
            tech: t['project1Tech']!,
            period: t['project1Period']!,
            highlights: [
              t['project1H1']!,
              t['project1H2']!,
              t['project1H3']!,
            ],
          ),
          const SizedBox(height: 18),
          ProjectCard(
            title: t['project2Title']!,
            tech: t['project2Tech']!,
            period: t['project2Period']!,
            highlights: [
              t['project2H1']!,
              t['project2H2']!,
              t['project2H3']!,
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String tech;
  final String period;
  final List<String> highlights;

  const ProjectCard({
    super.key,
    required this.title,
    required this.tech,
    required this.period,
    required this.highlights,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(period, style: const TextStyle(color: Color(0xFF90A9D5))),
          const SizedBox(height: 4),
          Text(tech, style: const TextStyle(color: Color(0xFF59C9FF))),
          const SizedBox(height: 12),
          ...highlights.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7, right: 8),
                    child: CircleAvatar(radius: 2, backgroundColor: Color(0xFF7DCBFF)),
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

class ContactSection extends StatelessWidget {
  final bool compact;
  final Map<String, String> t;
  const ContactSection({super.key, required this.compact, required this.t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: compact ? 20 : 64, vertical: compact ? 24 : 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            title: t['contact']!,
            subtitle: t['contactSubtitle']!,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: _cardDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ContactRow(icon: Icons.email_outlined, value: 'shdnalali285@gmail.com'),
                SizedBox(height: 12),
                _ContactRow(icon: Icons.phone_outlined, value: '+963981474617'),
                SizedBox(height: 12),
                _ContactRow(icon: Icons.location_on_outlined, value: 'Damascus, Syria'),
                SizedBox(height: 12),
                _ContactRow(icon: Icons.code_outlined, value: 'github.com/shdnAlali-Csi'),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            t['contactFooter']!,
            style: TextStyle(color: Color(0xFF79D5FF), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _TopNavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _TopNavButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(title, style: const TextStyle(color: Color(0xFFD5E6FF))),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _LanguageButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF355080)),
          foregroundColor: const Color(0xFFD8E9FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(label),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 34, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(subtitle, style: const TextStyle(color: Color(0xFFAABBE0))),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const _ContactRow({required this.icon, required this.value});

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

BoxDecoration _cardDecoration() {
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

const Map<String, String> _en = {
  'navHome': 'Home',
  'navAbout': 'About',
  'navSkills': 'Skills',
  'navProjects': 'Projects',
  'navContact': 'Contact',
  'heroBadge': 'Data Engineer | SQL | Oracle | Flutter',
  'heroTitle': 'Building reliable data systems\nthat power smart products',
  'heroDesc':
      'I am Shdn Alali, a Data Engineer with hands-on experience in Oracle databases, data modeling, and building practical Flutter applications integrated with backend APIs.',
  'hireMe': 'Hire Me',
  'viewProjects': 'View Projects',
  'about': 'About',
  'aboutSubtitle': 'A focused profile with practical delivery mindset',
  'aboutDesc':
      'Data Engineer with strong expertise in SQL and Oracle Database, specializing in data modeling and ERD design to build scalable, efficient structures. I translate system requirements into clean schemas, enforce business rules with PL/SQL, and support analytics with data warehouse models. I also bring Flutter experience to deliver full data-driven solutions from database to user interface.',
  'skills': 'Core Skills',
  'skillsSubtitle': 'Technologies and strengths I use to deliver value',
  'projects': 'Projects',
  'projectsSubtitle': 'Selected work that matches data engineering roles',
  'project1Title': 'CarCare - Car Management and Services',
  'project1Tech': 'Flutter, Dart, REST API Integration',
  'project1Period': '01/2026 - Present',
  'project1H1':
      'Built responsive UI for car management, emergency assistance, fuel and wash requests.',
  'project1H2':
      'Created reusable components to accelerate feature delivery and keep the app consistent.',
  'project1H3':
      'Collaborated with team members to deliver a clean, user-friendly mobile experience.',
  'project2Title': 'Restaurant Reservation Data Warehouse',
  'project2Tech': 'Oracle, PL/SQL, Data Modeling, Materialized Views',
  'project2Period': '11/2025 - 01/2026',
  'project2H1':
      'Designed ERD and relational schema for reservation workflows on Oracle Database.',
  'project2H2':
      'Implemented PL/SQL procedures/triggers for validation, conflict prevention and automation.',
  'project2H3':
      'Built audit logging with JSON before/after values and delivered a dimensional analytics model.',
  'contact': 'Contact',
  'contactSubtitle': 'Open to internships and full-time opportunities',
  'contactFooter': 'Let us build reliable data products together.',
};

const Map<String, String> _ar = {
  'navHome': 'الرئيسية',
  'navAbout': 'نبذة',
  'navSkills': 'المهارات',
  'navProjects': 'المشاريع',
  'navContact': 'التواصل',
  'heroBadge': 'مهندس بيانات | SQL | Oracle | Flutter',
  'heroTitle': 'ابني أنظمة بيانات موثوقة\nتدعم منتجات ذكية',
  'heroDesc':
      'أنا شهدن العلي، مهندس بيانات بخبرة عملية في قواعد بيانات Oracle ونمذجة البيانات، مع خبرة في تطوير تطبيقات Flutter وربطها مع واجهات API الخلفية.',
  'hireMe': 'وظفني',
  'viewProjects': 'عرض المشاريع',
  'about': 'نبذة عني',
  'aboutSubtitle': 'ملف مهني عملي يركز على الإنجاز',
  'aboutDesc':
      'مهندس بيانات بخبرة قوية في SQL وOracle Database، متخصص في Data Modeling وERD لبناء هياكل بيانات فعالة وقابلة للتوسع. أحول متطلبات الأنظمة إلى مخططات واضحة، وأطبق قواعد العمل عبر PL/SQL، وأدعم التحليلات بنماذج Data Warehouse. كما أمتلك خبرة Flutter لتقديم حلول متكاملة من قاعدة البيانات حتى واجهة المستخدم.',
  'skills': 'المهارات الأساسية',
  'skillsSubtitle': 'التقنيات ونقاط القوة التي أستخدمها لتقديم قيمة حقيقية',
  'projects': 'المشاريع',
  'projectsSubtitle': 'أعمال مختارة مناسبة لأدوار هندسة البيانات',
  'project1Title': 'CarCare - إدارة وخدمات السيارات',
  'project1Tech': 'Flutter, Dart, REST API Integration',
  'project1Period': '01/2026 - حتى الآن',
  'project1H1': 'طورت واجهات متجاوبة لإدارة السيارة والطوارئ وطلبات الوقود والغسيل.',
  'project1H2': 'أنشأت مكونات Flutter قابلة لإعادة الاستخدام لتسريع التطوير وتحسين الاتساق.',
  'project1H3': 'تعاونت مع الفريق لتقديم تجربة استخدام نظيفة وسهلة.',
  'project2Title': 'مستودع بيانات حجوزات المطاعم',
  'project2Tech': 'Oracle, PL/SQL, Data Modeling, Materialized Views',
  'project2Period': '11/2025 - 01/2026',
  'project2H1': 'صممت ERD والمخطط العلاقي لنظام الحجوزات باستخدام Oracle Database.',
  'project2H2': 'طبقت إجراءات ومشغلات PL/SQL للتحقق ومنع التعارض وأتمتة القواعد.',
  'project2H3': 'أنشأت نظام تدقيق JSON ونموذج تحليلي متعدد الأبعاد للتقارير.',
  'contact': 'التواصل',
  'contactSubtitle': 'متاح لفرص التدريب والعمل بدوام كامل',
  'contactFooter': 'جاهز لبناء منتجات بيانات موثوقة مع فريقك.',
};