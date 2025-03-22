import 'package:flutter/material.dart';
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
        width:
            screenWidth > 1440
                ? 1440.0
                : screenWidth, // Giới hạn tối đa hoặc full width
        padding: EdgeInsets.all(
          screenWidth < 600 ? 20.0 : 80.0,
        ), // Giảm padding trên điện thoại
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileImage(context),
            SizedBox(height: screenWidth < 600 ? 10 : 16),
            GradientTextCustom(
              text: 'Hi. I’m Nguyễn Thanh Minh',
              colors: AppColor.grapeGradient,
              style: AppStyle.hugeHeadline.copyWith(
                fontSize:
                    screenWidth < 600 ? 24 : 48, // Giảm font trên điện thoại
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth < 600 ? 150.0 : 216.0; // Giảm kích thước ảnh

    return Container(
      width: imageSize,
      height: imageSize,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: AppColor.skyGradient),
          width: screenWidth < 600 ? 8.0 : 13.0, // Giảm độ dày viền
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColor.grapeGradient),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(Assets.images.appicon.path),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
