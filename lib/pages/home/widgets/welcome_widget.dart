import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/pages/home/widgets/gradient_text_custom.dart';
import 'package:new_portfolio/utils/animation_utils.dart'; // Import the utility

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
          children: [
            _buildProfileImage(context).animate().fadeIn(
              duration: 800.ms,
              delay: 200.ms,
            ), // Keep as is (no slide-up)
            // Keep scale effect
            SizedBox(height: screenWidth < 600 ? 10 : 16),
            AnimationUtils.slideUpAnimation(
              child: GradientTextCustom(
                text: 'Hi. I’m ${myInfo.name}',
                colors: AppColor.grapeGradient,
                style: AppStyle.hugeHeadline.copyWith(
                  fontSize: screenWidth < 600 ? 24 : 48,
                ),
              ),
              delay: Duration(milliseconds: 400), // Matches original delay
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                      Assets.icons.star,
                      width: screenWidth < 600 ? 16 : 20,
                    )
                    .animate()
                    .rotate(duration: 1000.ms, delay: 600.ms) // Keep rotate
                    .fadeIn(duration: 600.ms, delay: 600.ms), // Keep fade-in
                SizedBox(width: 8),
                Text(
                      myInfo.role,
                      style: AppStyle.title.copyWith(
                        fontSize: screenWidth < 600 ? 18 : 24,
                        color: Colors.white70,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 800.ms) // Keep fade-in
                    .moveX(
                      begin: -20,
                      end: 0,
                      duration: 600.ms,
                      delay: 800.ms,
                    ), // Keep slide from left
              ],
            ),
            SizedBox(height: 8),
            AnimationUtils.slideUpAnimation(
              child: Text(
                myInfo.location,
                style: AppStyle.subTitle.copyWith(
                  fontSize: screenWidth < 600 ? 12 : 14,
                  color: Colors.white60,
                ),
                textAlign: TextAlign.center,
              ),
              delay: Duration(milliseconds: 1000), // Matches original delay
              beginOffset: 0.3, // Matches original offset
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
            ), // Replace with your personal image if available
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
