import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/components/footer/footer.dart';
import 'package:new_portfolio/pages/home/widgets/my_info_widget.dart';
import 'package:new_portfolio/pages/home/widgets/skill_widget.dart';
import 'package:new_portfolio/pages/home/widgets/welcome_widget.dart';
import 'package:new_portfolio/pages/home/widgets/objective_widget.dart';
import 'package:new_portfolio/pages/home/widgets/education_widget.dart';
import 'package:new_portfolio/pages/home/widgets/work_experience_widget.dart';
import 'package:new_portfolio/pages/home/widgets/interests_widget.dart';
import 'package:new_portfolio/utils/animation_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background sao cố định, không biến mất khi cuộn
          Positioned.fill(
            child: Lottie.asset(
              Assets.jsons.background1,
              fit: BoxFit.cover,
              repeat: true,
              // Đảm bảo Lottie đủ lớn để phủ toàn bộ chiều dài cuộn
              height:
                  screenHeight +
                  (_scrollController.hasClients
                      ? _scrollController.position.maxScrollExtent
                      : 0),
            ),
          ),
          // Lớp phủ tối
          Container(color: Colors.black.withOpacity(0.5)),
          // Nội dung chính với animation
          ListView(
            controller: _scrollController,
            children: [
              WelcomeWidget(),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(Assets.icons.frame1, screenWidth),
              ObjectiveWidget(),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(Assets.icons.frame2, screenWidth),
              EducationWidget(),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(Assets.icons.frame1, screenWidth),
              SkillWidget(),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(Assets.icons.frame2, screenWidth),
              WorkExperienceWidget(),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(Assets.icons.frame1, screenWidth),
              MyInfoWidget(),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(Assets.icons.frame2, screenWidth),
              InterestsWidget(),
              FooterWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSvgDivider(String assetPath, double screenWidth) {
    return AnimationUtils.slideUpAnimation(
      child: Center(
        child: Container(
          width: screenWidth > 1440 ? 1440.0 : screenWidth * 0.9,
          padding: EdgeInsets.symmetric(vertical: screenWidth < 600 ? 10 : 20),
          child: SvgPicture.asset(
            assetPath,
            height: screenWidth < 600 ? screenWidth * 0.6 : null,
            width: screenWidth < 600 ? screenWidth * 0.8 : null,
          ),
        ),
      ),
    );
  }
}
