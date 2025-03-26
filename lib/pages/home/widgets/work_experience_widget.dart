import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/data/models/my_info_model.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/pages/companydetails/company_detail_page.dart';
import 'package:new_portfolio/pages/home/controllers/home_controller.dart';
import 'package:new_portfolio/utils/animation_utils.dart';

class WorkExperienceWidget extends StatelessWidget {
  WorkExperienceWidget({super.key, required this.homeController});
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CompanyDetailPage(
                    company: homeController.myInfo.value!.workExperience[0],
                  ),
            ),
          );
        },
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
                      'Work Experience',
                      style: AppStyle.title.copyWith(
                        fontSize: screenWidth < 600 ? 28 : 36,
                      ),
                    ),
                  ],
                ),
                delay: Duration(milliseconds: 200),
              ),
              SizedBox(height: screenWidth < 600 ? 20 : 30),
              // Hiển thị danh sách công ty
              Column(
                children:
                    homeController.myInfo.value!.workExperience.map((
                      experience,
                    ) {
                      return AnimationUtils.slideUpAnimation(
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: screenWidth < 600 ? 8 : 12,
                          ),
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
                              gradient: LinearGradient(
                                colors: AppColor.skyGradient,
                              ),
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
                                      '${experience.position} - ${experience.name}',
                                      style: AppStyle.subTitle.copyWith(
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
                                experience.duration,
                                style: AppStyle.subTitle.copyWith(
                                  fontSize: screenWidth < 600 ? 12 : 14,
                                  color: Colors.white60,
                                ),
                              ),
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
      ),
    );
  }
}
