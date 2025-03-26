class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String? videoUrl;
  final String? branch;
  final String? fontendLink;
  final String? backendLink;
  final String? timeline;
  final String? role;

  ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.features,
    this.videoUrl,
    this.branch = 'main',
    this.fontendLink,
    this.backendLink,
    this.timeline,
    this.role,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      title: map['title'] as String,
      description: map['description'] as String,
      technologies: List<String>.from(map['technologies']),
      features: List<String>.from(map['features']),
      videoUrl: map['videoUrl'] as String?,
      branch: map['branch'] as String?,
      fontendLink: map['link'] as String?,
      backendLink: map['backendLink'] as String?,
      timeline: map['timeline'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'technologies': technologies,
      'features': features,
      'videoUrl': videoUrl,
      'branch': branch,
      'link': fontendLink,
      'backendLink': backendLink,
      'timeline': timeline,
      'role': role,
    };
  }
}
