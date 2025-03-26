import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/data/models/company_model.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/pages/home/controllers/home_controller.dart';
import 'package:new_portfolio/utils/animation_utils.dart';

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({
    super.key,
    required this.homeController,
    required this.companies,
  });
  final HomeController homeController;
  final List<CompanyModel> companies;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth < 600 ? screenWidth * 0.9 : 1050,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 12 : 20,
          vertical: screenWidth < 600 ? 24 : 40,
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
                    width: screenWidth < 600 ? 24 : 32,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Work Experience',
                    style: AppStyle.title.copyWith(
                      fontSize: screenWidth < 600 ? 30 : 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              delay: Duration(milliseconds: 200),
            ),
            SizedBox(height: screenWidth < 600 ? 24 : 40),
            Column(
              children:
                  homeController.myInfo.value!.workExperience.map((experience) {
                    return AnimationUtils.slideUpAnimation(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: screenWidth < 600 ? 12 : 16,
                        ),
                        padding: EdgeInsets.all(screenWidth < 600 ? 16 : 24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff82B4FF).withOpacity(0.15),
                              Color(0xffBFF0FF).withOpacity(0.05),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: AppColor.skyGradient,
                            ),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 12,
                              offset: Offset(0, 6),
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
                                  width: screenWidth < 600 ? 18 : 22,
                                  color: Colors.white70,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '${experience.position} - ${experience.name}',
                                    style: AppStyle.subTitle.copyWith(
                                      fontSize: screenWidth < 600 ? 18 : 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              experience.duration,
                              style: AppStyle.subTitle.copyWith(
                                fontSize: screenWidth < 600 ? 14 : 16,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 12),
                            if (experience.description != null)
                              Text(
                                experience.description!,
                                style: AppStyle.subTitle.copyWith(
                                  fontSize: screenWidth < 600 ? 14 : 16,
                                  color: Colors.white60,
                                ),
                              ),
                            SizedBox(height: 16),
                            if (experience.projects != null) ...[
                              Text(
                                'Projects',
                                style: AppStyle.subTitle.copyWith(
                                  fontSize: screenWidth < 600 ? 16 : 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 12),
                              ...experience.projects!.asMap().entries.map((
                                entry,
                              ) {
                                final index = entry.key;
                                final project = entry.value;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.star,
                                          width: screenWidth < 600 ? 16 : 20,
                                          color: Colors.white70,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            project.title,
                                            style: AppStyle.subTitle.copyWith(
                                              fontSize:
                                                  screenWidth < 600 ? 16 : 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (project.description != null)
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 6,
                                          left: 24,
                                        ),
                                        child: Text(
                                          project.description!,
                                          style: AppStyle.subTitle.copyWith(
                                            fontSize:
                                                screenWidth < 600 ? 13 : 15,
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ),
                                    SizedBox(height: 8),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Text(
                                        'Technologies',
                                        style: AppStyle.subTitle.copyWith(
                                          fontSize: screenWidth < 600 ? 13 : 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    ...project.technologies.map(
                                      (tech) => Padding(
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          left: 24,
                                        ),
                                        child: Text(
                                          '• $tech',
                                          style: AppStyle.subTitle.copyWith(
                                            fontSize:
                                                screenWidth < 600 ? 13 : 15,
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Text(
                                        'Features',
                                        style: AppStyle.subTitle.copyWith(
                                          fontSize: screenWidth < 600 ? 13 : 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    ...project.features.map(
                                      (feature) => Padding(
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          left: 24,
                                        ),
                                        child: Text(
                                          '• $feature',
                                          style: AppStyle.subTitle.copyWith(
                                            fontSize:
                                                screenWidth < 600 ? 13 : 15,
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Thêm Divider giữa các project, trừ project cuối cùng
                                    if (index < experience.projects!.length - 1)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: Divider(
                                          color: Colors.white.withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                      ),
                                  ],
                                );
                              }),
                            ],
                          ],
                        ),
                      ),
                      delay: Duration(milliseconds: 400),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
