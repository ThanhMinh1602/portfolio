import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/gen/assets.gen.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.icons.star,
                  width: screenWidth < 600 ? 20 : 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Education',
                  style: AppStyle.title.copyWith(
                    fontSize: screenWidth < 600 ? 28 : 36,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth < 600 ? 20 : 30),
            Container(
              padding: EdgeInsets.all(screenWidth < 600 ? 15 : 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff82B4FF).withOpacity(0.2),
                    Color(0xffBFF0FF).withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: GradientBoxBorder(
                  gradient: LinearGradient(colors: AppColor.skyGradient),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.star,
                        width: screenWidth < 600 ? 16 : 20,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'University of Science and Education - The University of Da Nang',
                          style: AppStyle.button.copyWith(
                            fontSize: screenWidth < 600 ? 16 : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Major: Information Technology',
                    style: AppStyle.button.copyWith(
                      fontSize: screenWidth < 600 ? 14 : 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Duration: June 2020 - November 2024',
                    style: AppStyle.button.copyWith(
                      fontSize: screenWidth < 600 ? 12 : 14,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
