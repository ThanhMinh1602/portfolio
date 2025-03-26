import 'package:get/get.dart';
import 'package:new_portfolio/data/models/company_model.dart';

class CompanyDetailsController extends GetxController {
  var isLoading = true.obs;
  var company = Rx<CompanyModel?>(null);

  @override
  void onInit() {
    super.onInit();
    // Lấy thông tin company từ arguments
    final Map<String, dynamic>? args = Get.arguments;
    if (args != null && args.containsKey('company')) {
      company.value = args['company'] as CompanyModel;
      isLoading.value = false;
    } else {
      fetchCompanyDetails();
    }
  }

  void fetchCompanyDetails() async {
    try {
      isLoading(true);
      // Có thể lấy company ID từ route parameters
      final String? companyId = Get.parameters['id'];

      if (companyId != null) {
        // Tạo dữ liệu mẫu cho demo
        company.value = CompanyModel(
          name: "Demo Company",
          position: "Software Developer",
          duration: "2023 - Present",
          location: "Da Nang, Vietnam",
        );
      }
    } finally {
      isLoading(false);
    }
  }
}
