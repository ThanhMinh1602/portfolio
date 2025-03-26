import 'package:new_portfolio/data/models/project_model.dart';

class CompanyModel {
  final String name;
  final String position;
  final String duration;
  final String location;
  final String? description;
  final List<ProjectModel>? projects;
  final List<String>? images;
  CompanyModel({
    required this.name,
    required this.position,
    required this.duration,
    required this.location,
    this.description,
    this.projects,
    this.images,
  });
}
