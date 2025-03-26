import 'package:get/get.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';
import 'package:new_portfolio/data/models/skill_model.dart';
import 'package:new_portfolio/data/models/education_model.dart';
import 'package:new_portfolio/data/models/company_model.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/routes/app_routes.dart';
import 'package:new_portfolio/services/my_info_service.dart';

class HomeController extends GetxController {
  final MyInfoService _myInfoService = Get.find<MyInfoService>();

  var isLoading = true.obs;

  Rxn<MyInfoModel> get myInfo => _myInfoService.myInfo;
  RxList<SkillModel> get skills => _myInfoService.skills;
  RxList<EducationModel> get educations => _myInfoService.educations;
  RxList<CompanyModel> get companies => _myInfoService.companies;
  RxList<ProjectModel> get projects => _myInfoService.projects;

  @override
  void onInit() {
    super.onInit();

    checkDataLoaded();
  }

  void checkDataLoaded() {
    isLoading.value = false;
  }

  void goToCompanyDetails(CompanyModel company) {
    Get.toNamed(AppRoutes.COMPANY_DETAILS, arguments: {'company': company});
  }

  void goToProjectDetails(ProjectModel project) {
    Get.toNamed(AppRoutes.PROJECT_DETAILS, arguments: {'project': project});
  }
}
