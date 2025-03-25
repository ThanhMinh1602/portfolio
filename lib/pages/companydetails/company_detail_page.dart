import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/data/models/company_model.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/utils/animation_utils.dart';

class CompanyDetailPage extends StatelessWidget {
  final CompanyModel company;

  const CompanyDetailPage({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          company.name,
          style: AppStyle.title.copyWith(
            fontSize: screenWidth < 600 ? 20 : 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1E2A47), Color(0xff0F1628)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
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
                  SizedBox(height: kToolbarHeight + 20), // Space for AppBar
                  AnimationUtils.slideUpAnimation(
                    child: Container(
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
                                width: screenWidth < 600 ? 20 : 24,
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  '${company.position} - ${company.name}',
                                  style: AppStyle.subTitle.copyWith(
                                    fontSize: screenWidth < 600 ? 18 : 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Duration: ${company.duration}',
                            style: AppStyle.subTitle.copyWith(
                              fontSize: screenWidth < 600 ? 14 : 16,
                              color: Colors.white60,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Location: ${company.location}',
                            style: AppStyle.subTitle.copyWith(
                              fontSize: screenWidth < 600 ? 14 : 16,
                              color: Colors.white60,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Responsibilities & Achievements:',
                            style: AppStyle.subTitle.copyWith(
                              fontSize: screenWidth < 600 ? 16 : 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '- Learned BLoC State Management, Flutter Clean Architecture, and Postman.\n'
                            '- Practiced teamwork skills and explored Git (GitLab) and Backlog for project management.\n'
                            '- Participated in real company projects.\n'
                            '- Explored React Native and wrote a chat bot using Express.js for internal project management.',
                            style: AppStyle.subTitle.copyWith(
                              fontSize: screenWidth < 600 ? 12 : 14,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    delay: Duration(milliseconds: 200),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Cách sử dụng:
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => CompanyDetailScreen(company: myInfo.workExperience[0]),
//   ),
// );
