import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_portfolio/res/constants/app_color.dart';
import 'package:new_portfolio/res/constants/app_style.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/pages/home/controllers/home_controller.dart';
import 'package:new_portfolio/pages/home/widgets/gradient_text_custom.dart';
import 'package:new_portfolio/utils/animation_utils.dart';

class ObjectiveWidget extends StatelessWidget {
  const ObjectiveWidget({super.key, required this.homeController});
  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth < 600 ? screenWidth : 1050,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 10 : 16,
          vertical: screenWidth < 600 ? 20 : 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimationUtils.slideUpAnimation(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.star,
                    width: screenWidth < 600 ? 20 : 30,
                  ),
                  SizedBox(width: 10),
                  GradientTextCustom(
                    text: 'Career Objectives',
                    colors: AppColor.grapeGradient,
                    style: AppStyle.title.copyWith(
                      fontSize: screenWidth < 600 ? 28 : 36,
                    ),
                  ),
                  SizedBox(width: 10),
                  SvgPicture.asset(
                    Assets.icons.star,
                    width: screenWidth < 600 ? 20 : 30,
                  ),
                ],
              ),
              delay: Duration(milliseconds: 200), // Delay for title
            ),
            SizedBox(height: screenWidth < 600 ? 20 : 30),
            AnimationUtils.slideUpAnimation(
              child: _buildObjective(
                'Short-term Goal',
                homeController.myInfo.value!.shortTermGoal,
                screenWidth,
              ),
              delay: Duration(milliseconds: 400), // Delay for short-term goal
            ),
            SizedBox(height: screenWidth < 600 ? 15 : 20),
            AnimationUtils.slideUpAnimation(
              child: _buildObjective(
                'Long-term Goal',
                homeController.myInfo.value!.longTermGoal,
                screenWidth,
              ),
              delay: Duration(milliseconds: 600), // Delay for long-term goal
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildObjective(String title, String description, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth < 600 ? 10 : 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Assets.icons.star,
            width: screenWidth < 600 ? 16 : 20,
            color: Colors.white70,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyle.subTitle.copyWith(
                    fontSize: screenWidth < 600 ? 16 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: AppStyle.subTitle.copyWith(
                    fontSize: screenWidth < 600 ? 12 : 14,
                    color: Colors.white60,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
