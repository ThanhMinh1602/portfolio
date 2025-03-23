import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/widgets/gradient_text_custom.dart';

class ObjectiveWidget extends StatelessWidget {
  const ObjectiveWidget({super.key});

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
            SizedBox(height: screenWidth < 600 ? 20 : 30),
            _buildObjective(
              'Short-term Goal',
              'Become a professional Flutter developer with strong expertise in building cross-platform applications. Deliver high-performance Flutter apps with user-friendly UI/UX, compatible with Android and iOS.',
              screenWidth,
            ),
            SizedBox(height: screenWidth < 600 ? 15 : 20),
            _buildObjective(
              'Long-term Goal',
              'Master mobile app development (Native Android/iOS, React Native, and emerging tech). Build innovative apps to solve real-world problems, lead teams, and contribute to the developer community through open-source and mentoring.',
              screenWidth,
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
                  style: AppStyle.button.copyWith(
                    fontSize: screenWidth < 600 ? 16 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: AppStyle.button.copyWith(
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
