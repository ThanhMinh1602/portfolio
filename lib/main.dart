import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_portfolio/routes/app_pages.dart';
import 'package:new_portfolio/routes/app_routes.dart';
import 'package:new_portfolio/services/my_info_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initServices();

  runApp(const MyApp());
}

Future<void> initServices() async {
  print('Initializing Services...');

  await Get.putAsync(() => MyInfoService().init());

  print('All Services initialized.');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nguyễn Thanh Minh',
      theme: ThemeData(textTheme: GoogleFonts.spaceMonoTextTheme()),
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
    );
  }
}
