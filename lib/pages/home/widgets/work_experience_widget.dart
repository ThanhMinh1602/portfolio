import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/res/constants/app_color.dart';
import 'package:new_portfolio/res/constants/app_style.dart';
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
                            if (experience.projects != null) ...[
                              SizedBox(height: 16),
                              Text(
                                'Projects',
                                style: AppStyle.subTitle.copyWith(
                                  fontSize: screenWidth < 600 ? 16 : 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 12),
                              ...experience.projects!.map((project) {
                                return ExpansionTile(
                                  expandedAlignment: Alignment.centerLeft,
                                  leading: SvgPicture.asset(
                                    Assets.icons.star,
                                    width: screenWidth < 600 ? 16 : 20,
                                    color: Colors.white70,
                                  ),
                                  title: Text(
                                    project.title,
                                    style: AppStyle.subTitle.copyWith(
                                      fontSize: screenWidth < 600 ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  tilePadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  childrenPadding: EdgeInsets.only(
                                    left: 24,
                                    bottom: 12,
                                  ),
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment
                                          .start, // Căn trái toàn bộ nội dung bên trong
                                  children: [
                                    if (project.description != null)
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: screenWidth < 600 ? 6 : 8,
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
                                    Text(
                                      'Technologies',
                                      style: AppStyle.subTitle.copyWith(
                                        fontSize: screenWidth < 600 ? 13 : 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    ...project.technologies.map(
                                      (tech) => Padding(
                                        padding: EdgeInsets.only(top: 4),
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
                                    Text(
                                      'Features',
                                      style: AppStyle.subTitle.copyWith(
                                        fontSize: screenWidth < 600 ? 13 : 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    ...project.features.map(
                                      (feature) => Padding(
                                        padding: EdgeInsets.only(top: 4),
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
