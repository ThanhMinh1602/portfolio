import 'package:get/get.dart';
import 'package:new_portfolio/pages/home/home_binding.dart';
import 'package:new_portfolio/pages/home/home_page.dart';
import 'package:new_portfolio/pages/projectdetails/bindings/project_details_binding.dart';
import 'package:new_portfolio/pages/projectdetails/pages/project_details_page.dart';
import 'package:new_portfolio/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.PROJECT_DETAILS,
      page: () => ProjectDetailsPage(),
      binding: ProjectDetailsBinding(),
    ),
  ];
}
