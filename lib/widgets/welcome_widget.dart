import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/widgets/gradient_text_custom.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: screenWidth > 1440 ? 1440.0 : screenWidth,
        padding: EdgeInsets.all(screenWidth < 600 ? 20.0 : 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Chỉ thay đổi phần children trong build
          children: [
            _buildProfileImage(context),
            SizedBox(height: screenWidth < 600 ? 10 : 16),
            GradientTextCustom(
              text: 'Hi. I’m Nguyễn Thanh Minh',
              colors: AppColor.grapeGradient,
              style: AppStyle.hugeHeadline.copyWith(
                fontSize: screenWidth < 600 ? 24 : 48,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.icons.star,
                  width: screenWidth < 600 ? 16 : 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Mobile Developer',
                  style: AppStyle.title.copyWith(
                    fontSize: screenWidth < 600 ? 18 : 24,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'k583/15 Tôn Đức Thắng, Hòa Khánh Nam, Liên Chiểu, TP Đà Nẵng',
              style: AppStyle.button.copyWith(
                fontSize: screenWidth < 600 ? 12 : 14,
                color: Colors.white60,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth < 600 ? 150.0 : 216.0;

    return Container(
      width: imageSize,
      height: imageSize,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: AppColor.skyGradient),
          width: screenWidth < 600 ? 8.0 : 13.0,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColor.grapeGradient),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              Assets.images.appicon.path,
            ), // Thay bằng ảnh cá nhân nếu có
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
