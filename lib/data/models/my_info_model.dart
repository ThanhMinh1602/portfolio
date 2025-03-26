import 'package:new_portfolio/data/models/company_model.dart';
import 'package:new_portfolio/data/models/education_model.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/data/models/skill_model.dart';

class MyInfoModel {
  final String name;
  final String phone;
  final String email;
  final String github;
  final String location;
  final String role;
  final String shortTermGoal;
  final String longTermGoal;
  final EducationModel education;
  final List<SkillModel> skills;

  final List<CompanyModel> workExperience;
  final List<ProjectModel> personalProjects;
  final List<String> interests;

  MyInfoModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.github,
    required this.location,
    required this.role,
    required this.shortTermGoal,
    required this.longTermGoal,
    required this.education,
    required this.skills,
    required this.workExperience,
    required this.personalProjects,
    required this.interests,
  });
}
