import 'package:get/get.dart';
import 'package:new_portfolio/pages/projectdetails/controllers/project_details_controller.dart';

class ProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectDetailsController>(() => ProjectDetailsController());
  }
}
