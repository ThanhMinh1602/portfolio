import 'package:get/get.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';
import 'package:new_portfolio/data/models/skill_model.dart';
import 'package:new_portfolio/data/models/education_model.dart';
import 'package:new_portfolio/data/models/company_model.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/routes/app_routes.dart';
import 'package:new_portfolio/services/my_info_service.dart';

class HomeController extends GetxController {
  // Dependency Injection
  final MyInfoService _myInfoService = Get.find<MyInfoService>();

  // Biến lưu trạng thái loading
  var isLoading = true.obs;

  // Các getter để truy cập dữ liệu từ service
  Rxn<MyInfoModel> get myInfo => _myInfoService.myInfo;
  RxList<SkillModel> get skills => _myInfoService.skills;
  RxList<EducationModel> get educations => _myInfoService.educations;
  RxList<CompanyModel> get companies => _myInfoService.companies;
  RxList<ProjectModel> get projects => _myInfoService.projects;

  @override
  void onInit() {
    super.onInit();
    // Đảm bảo dữ liệu đã được tải
    checkDataLoaded();
  }

  void checkDataLoaded() {
    // Đơn giản hoá việc kiểm tra: nếu myInfo đã có dữ liệu, coi như đã tải xong
    isLoading.value = false;
  }

  // Phương thức điều hướng đến trang chi tiết công ty
  void goToCompanyDetails(CompanyModel company) {
    Get.toNamed(AppRoutes.COMPANY_DETAILS, arguments: {'company': company});
  }

  // Phương thức điều hướng đến trang chi tiết dự án
  void goToProjectDetails(ProjectModel project) {
    Get.toNamed(AppRoutes.PROJECT_DETAILS, arguments: {'project': project});
  }
}
