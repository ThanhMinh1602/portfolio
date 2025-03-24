import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:new_portfolio/constants/app_color.dart';
import 'package:new_portfolio/gen/assets.gen.dart';
import 'package:new_portfolio/widgets/footer.dart';
import 'package:new_portfolio/widgets/my_info_widget.dart';
import 'package:new_portfolio/widgets/skill_widget.dart';
import 'package:new_portfolio/widgets/welcome_widget.dart';
import 'package:new_portfolio/widgets/objective_widget.dart';
import 'package:new_portfolio/widgets/education_widget.dart';
import 'package:new_portfolio/widgets/work_experience_widget.dart';
import 'package:new_portfolio/widgets/interests_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
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
              WelcomeWidget()
                  .animate()
                  .fadeIn(duration: 800.ms, curve: Curves.easeInOut)
                  .slideY(begin: 0.5, end: 0.0),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(
                Assets.icons.frame1,
                screenWidth,
              ).animate().scale(duration: 600.ms),
              ObjectiveWidget()
                  .animate()
                  .fadeIn(duration: 800.ms, delay: 200.ms)
                  .slideY(begin: 0.5, end: 0.0),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(
                Assets.icons.frame2,
                screenWidth,
              ).animate().scale(duration: 600.ms),
              EducationWidget()
                  .animate()
                  .fadeIn(duration: 800.ms, delay: 400.ms)
                  .slideY(begin: 0.5, end: 0.0),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(
                Assets.icons.frame1,
                screenWidth,
              ).animate().scale(duration: 600.ms),
              SkillWidget()
                  .animate()
                  .fadeIn(duration: 800.ms, delay: 600.ms)
                  .slideY(begin: 0.5, end: 0.0),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(
                Assets.icons.frame2,
                screenWidth,
              ).animate().scale(duration: 600.ms),
              WorkExperienceWidget()
                  .animate()
                  .fadeIn(duration: 800.ms, delay: 800.ms)
                  .slideY(begin: 0.5, end: 0.0),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(
                Assets.icons.frame1,
                screenWidth,
              ).animate().scale(duration: 600.ms),
              MyInfoWidget()
                  .animate()
                  .fadeIn(duration: 800.ms, delay: 1000.ms)
                  .slideY(begin: 0.5, end: 0.0),
              SizedBox(height: screenWidth < 600 ? 10 : 20),
              _buildSvgDivider(
                Assets.icons.frame2,
                screenWidth,
              ).animate().scale(duration: 600.ms),
              InterestsWidget()
                  .animate()
                  .fadeIn(duration: 800.ms, delay: 1200.ms)
                  .slideY(begin: 0.5, end: 0.0),
              FooterWidget()
                  .animate()
                  .fadeIn(duration: 800.ms, delay: 1400.ms)
                  .slideY(begin: 0.5, end: 0.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSvgDivider(String assetPath, double screenWidth) {
    return Center(
      child: Container(
        width: screenWidth > 1440 ? 1440.0 : screenWidth * 0.9,
        padding: EdgeInsets.symmetric(vertical: screenWidth < 600 ? 10 : 20),
        child: SvgPicture.asset(
          assetPath,
          height: screenWidth < 600 ? screenWidth * 0.6 : null,
          width: screenWidth < 600 ? screenWidth * 0.8 : null,
        ),
      ),
    );
  }
}
