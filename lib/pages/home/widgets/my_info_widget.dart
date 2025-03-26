import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';
import 'package:new_portfolio/data/models/project_model.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/pages/home/controllers/home_controller.dart';
import 'package:new_portfolio/pages/projectdetails/pages/project_details_page.dart';
import 'package:new_portfolio/utils/animation_utils.dart'; // Import the utility

class MyInfoWidget extends StatelessWidget {
  const MyInfoWidget({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        AnimationUtils.slideUpAnimation(
          child: _buildTitle(screenWidth),
          delay: Duration(milliseconds: 200), // Title slides up first
        ),
        SizedBox(height: screenWidth < 600 ? 20 : 40),
        _buildProjectList(context, screenWidth),
      ],
    );
  }

  Widget _buildTitle(double screenWidth) {
    return Wrap(
      children: [
        SizedBox(width: screenWidth < 600 ? 10 : 195),
        Text(
          "Personal projects",
          textAlign: TextAlign.center,
          style: AppStyle.title.copyWith(fontSize: screenWidth < 600 ? 28 : 36),
        ),
        SvgPicture.asset(Assets.icons.star, width: screenWidth < 600 ? 20 : 30),
      ],
    );
  }

  Widget _buildProjectList(BuildContext context, double screenWidth) {
    return Wrap(
      spacing: screenWidth < 600 ? 10 : 20,
      runSpacing: screenWidth < 600 ? 10 : 20,
      alignment: WrapAlignment.center,
      children: List.generate(
        homeController.projects.length,
        (index) => AnimationUtils.slideUpAnimation(
          child: _buildProjectCard(
            homeController.projects[index].title,
            homeController.projects[index].description,
            screenWidth,
            onTap: () {
              homeController.goToProjectDetails(homeController.projects[index]);
            },
          ),
          delay: Duration(
            milliseconds: 400 + (index * 200),
          ), // Staggered delay for each card
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    double screenWidth, {
    required void Function()? onTap,
  }) {
    return Container(
      width: screenWidth < 600 ? screenWidth * 0.9 : 300,
      height: screenWidth < 600 ? 150 : 180,
      padding: EdgeInsets.all(screenWidth < 600 ? 15 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyle.subTitle.copyWith(
              fontSize: screenWidth < 600 ? 18 : 20,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Flexible(
            child: Text(
              description,
              style: AppStyle.subTitle.copyWith(
                fontSize: screenWidth < 600 ? 12 : 14,
                color: Colors.white70,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              Assets.icons.star,
              width: screenWidth < 600 ? 16 : 20,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Detail',
                  style: AppStyle.content.copyWith(
                    color: AppColor.grapeGradient[0],
                  ),
                ),

                Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
