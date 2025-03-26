import 'package:get/get.dart';
import 'package:new_portfolio/pages/companydetails/controllers/company_details_controller.dart';

class CompanyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyDetailsController>(() => CompanyDetailsController());
  }
}
