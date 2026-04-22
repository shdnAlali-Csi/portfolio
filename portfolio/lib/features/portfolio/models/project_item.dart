class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.tech,
    required this.period,
    required this.highlights,
  });

  final String title;
  final String tech;
  final String period;
  final List<String> highlights;
}
