import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/widgets/footer.dart';
import 'package:new_portfolio/widgets/my_info_widget.dart';
import 'package:new_portfolio/widgets/skill_widget.dart';
import 'package:new_portfolio/widgets/welcome_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: ListView(
        children: [
          WelcomeWidget(),
          SizedBox(
            height: screenWidth < 600 ? 10 : 20,
          ), // Giảm khoảng cách trên điện thoại
          _buildSvgDivider(Assets.icons.frame1, screenWidth),
          SkillWidget(),
          SizedBox(height: screenWidth < 600 ? 10 : 20),
          _buildSvgDivider(Assets.icons.frame2, screenWidth),
          MyInfoWidget(),
          FooterWidget(),
        ],
      ),
    );
  }

  // Widget để hiển thị SVG responsives
  Widget _buildSvgDivider(String assetPath, double screenWidth) {
    return Center(
      child: Container(
        width:
            screenWidth > 1440
                ? 1440.0
                : screenWidth * 0.9, // Giới hạn hoặc 90% màn hình
        padding: EdgeInsets.symmetric(vertical: screenWidth < 600 ? 10 : 20),
        child: SvgPicture.asset(
          assetPath,
          height:
              screenWidth < 600
                  ? screenWidth * 0.6
                  : null, // 60% chiều cao trên điện thoại
          width:
              screenWidth < 600
                  ? screenWidth * 0.8
                  : null, // 80% chiều rộng trên điện thoại
          // Giữ tỷ lệ SVG
        ),
      ),
    );
  }
}
