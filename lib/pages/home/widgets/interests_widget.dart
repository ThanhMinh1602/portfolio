import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/utils/animation_utils.dart'; // Import the utility

class InterestsWidget extends StatelessWidget {
  InterestsWidget({super.key});

  final List<String> interests = myInfo.interests;

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
                  Text(
                    'Interests',
                    style: AppStyle.title.copyWith(
                      fontSize: screenWidth < 600 ? 28 : 36,
                    ),
                  ),
                ],
              ),
              delay: Duration(milliseconds: 200), // Title slides up first
            ),
            SizedBox(height: screenWidth < 600 ? 20 : 30),
            AnimationUtils.slideUpAnimation(
              child: Container(
                padding: EdgeInsets.all(screenWidth < 600 ? 15 : 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff82B4FF).withOpacity(0.1),
                      Colors.black.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Wrap(
                  spacing: screenWidth < 600 ? 8 : 12,
                  runSpacing: screenWidth < 600 ? 8 : 12,
                  children:
                      interests.map((interest) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth < 600 ? 15 : 20,
                            vertical: screenWidth < 600 ? 8 : 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: AppColor.grapeGradient,
                              ),
                              width: 2,
                            ),
                            color: Colors.black.withOpacity(0.1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Assets.icons.star,
                                width: screenWidth < 600 ? 12 : 16,
                              ),
                              SizedBox(width: 8),
                              Text(
                                interest,
                                style: AppStyle.subTitle.copyWith(
                                  fontSize: screenWidth < 600 ? 12 : 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
              delay: Duration(milliseconds: 400), // Container slides up next
            ),
          ],
        ),
      ),
    );
  }
}
