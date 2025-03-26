import 'package:get/get.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';
import 'package:new_portfolio/data/models/skill_model.dart';
import 'package:new_portfolio/data/models/education_model.dart';
import 'package:new_portfolio/data/models/company_model.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/data/mock/my_info_mock.dart';

class MyInfoService extends GetxService {
  static MyInfoService get to => Get.find();

  // Biến lưu trữ dữ liệu
  final _myInfo = Rxn<MyInfoModel>();
  final _skills = <SkillModel>[].obs;
  final _educations = <EducationModel>[].obs;
  final _companies = <CompanyModel>[].obs;
  final _projects = <ProjectModel>[].obs;

  // Getter các reactive variables
  Rxn<MyInfoModel> get myInfo => _myInfo;
  RxList<SkillModel> get skills => _skills;
  RxList<EducationModel> get educations => _educations;
  RxList<CompanyModel> get companies => _companies;
  RxList<ProjectModel> get projects => _projects;

  // Phương thức khởi tạo service
  Future<MyInfoService> init() async {
    await loadInitialData();
    await fetchMyInfo();
    await fetchSkills();
    await fetchEducations();
    await fetchCompanies();
    await fetchProjects();
    return this;
  }

  Future<void> loadInitialData() async {
    _myInfo.value = mockMyInfo;
  }

  Future<void> fetchMyInfo() async {
    if (_myInfo.value == null) {
      _myInfo.value = mockMyInfo;
    }
  }

  Future<void> fetchSkills() async {
    if (_myInfo.value != null) {
      _skills.value = _myInfo.value!.skills;
    }
  }

  Future<void> fetchEducations() async {
    if (_myInfo.value != null) {
      _educations.value = [_myInfo.value!.education];
    }
  }

  Future<void> fetchCompanies() async {
    if (_myInfo.value != null) {
      _companies.value = _myInfo.value!.workExperience;
    }
  }

  Future<void> fetchProjects() async {
    if (_myInfo.value != null) {
      _projects.value = [
        ..._myInfo.value!.personalProjects,
        ..._myInfo.value!.workProjects,
      ];
    }
  }
}
