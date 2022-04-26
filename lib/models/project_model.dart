// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectModel {
  final String image;
  final String title;
  final String description;
  final bool currentWork;
  final List<String> technologies;

  ProjectModel({
    required this.image,
    required this.title,
    required this.description,
    required this.technologies,
    required this.currentWork,
  });

  @override
  String toString() {
    return 'ProjectModel(image: $image, title: $title, description: $description, currentWork: $currentWork, technologies: $technologies)';
  }
}
