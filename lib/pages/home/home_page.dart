import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/components/footer/footer.dart';
import 'package:new_portfolio/pages/home/widgets/my_info_widget.dart';
import 'package:new_portfolio/pages/home/widgets/skill_widget.dart';
import 'package:new_portfolio/pages/home/widgets/welcome_widget.dart';
import 'package:new_portfolio/pages/home/widgets/objective_widget.dart';
import 'package:new_portfolio/pages/home/widgets/education_widget.dart';
import 'package:new_portfolio/pages/home/widgets/work_experience_widget.dart';
import 'package:new_portfolio/pages/home/widgets/interests_widget.dart';
import 'package:new_portfolio/utils/animation_utils.dart';
import 'package:new_portfolio/pages/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Sử dụng ScrollController
    final scrollController = ScrollController();
    final homeController = Get.find<HomeController>();
    // Đảm bảo scrollController được dispose khi widget bị hủy
    // Sử dụng WidgetsBinding để đảm bảo ScrollController được dispose
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.put(scrollController, tag: 'home_scroll_controller');
    });

    return Scaffold(
      body: Obx(
        () => Stack(
          fit: StackFit.expand,
          children: [
            // Background sao cố định, không biến mất khi cuộn
            Positioned.fill(
              child: Lottie.asset(
                Assets.jsons.background1,
                fit: BoxFit.cover,
                repeat: true,
                // Đảm bảo Lottie đủ lớn để phủ toàn bộ chiều dài cuộn
                height:
                    screenHeight +
                    (scrollController.hasClients
                        ? scrollController.position.maxScrollExtent
                        : 0),
              ),
            ),
            // Lớp phủ tối
            Container(color: Colors.black.withOpacity(0.5)),
            // Hiển thị loading indicator khi đang tải dữ liệu
            if (controller.isLoading.value)
              const Center(child: CircularProgressIndicator())
            else
              // Nội dung chính với animation
              ListView(
                controller: scrollController,
                children: [
                  WelcomeWidget(homeController: homeController),
                  SizedBox(height: screenWidth < 600 ? 10 : 20),
                  _buildSvgDivider(Assets.icons.frame1, screenWidth),
                  ObjectiveWidget(homeController: homeController),
                  SizedBox(height: screenWidth < 600 ? 10 : 20),
                  _buildSvgDivider(Assets.icons.frame2, screenWidth),
                  EducationWidget(homeController: homeController),
                  SizedBox(height: screenWidth < 600 ? 10 : 20),
                  _buildSvgDivider(Assets.icons.frame1, screenWidth),
                  SkillWidget(homeController: homeController),
                  SizedBox(height: screenWidth < 600 ? 10 : 20),
                  _buildSvgDivider(Assets.icons.frame2, screenWidth),
                  WorkExperienceWidget(homeController: homeController),
                  SizedBox(height: screenWidth < 600 ? 10 : 20),
                  _buildSvgDivider(Assets.icons.frame1, screenWidth),
                  MyInfoWidget(homeController: homeController),
                  SizedBox(height: screenWidth < 600 ? 10 : 20),
                  _buildSvgDivider(Assets.icons.frame2, screenWidth),
                  InterestsWidget(homeController: homeController),
                  FooterWidget(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSvgDivider(String assetPath, double screenWidth) {
    return AnimationUtils.slideUpAnimation(
      child: Center(
        child: Container(
          width: screenWidth > 1440 ? 1440.0 : screenWidth * 0.9,
          padding: EdgeInsets.symmetric(vertical: screenWidth < 600 ? 10 : 20),
          child: SvgPicture.asset(
            assetPath,
            height: screenWidth < 600 ? screenWidth * 0.6 : null,
            width: screenWidth < 600 ? screenWidth * 0.8 : null,
          ),
        ),
      ),
    );
  }
}
