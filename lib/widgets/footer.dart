import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/gen/assets.gen.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth < 600 ? 20 : 40,
        horizontal: screenWidth < 600 ? 10 : 20,
      ),
      color: Colors.black.withOpacity(0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Let’s Connect!',
            style: AppStyle.title.copyWith(
              fontSize: screenWidth < 600 ? 20 : 24,
              color: Colors.white,
            ),
          ),
          SizedBox(height: screenWidth < 600 ? 15 : 20),
          Text(
            'Email: ntminh16201@gmail.com\nPhone: +84 798 334 803',
            textAlign: TextAlign.center,
            style: AppStyle.button.copyWith(
              fontSize: screenWidth < 600 ? 12 : 14,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: screenWidth < 600 ? 15 : 20),
          Text(
            '© 2025 Thanh Minh. All rights reserved.',
            style: AppStyle.button.copyWith(
              fontSize: screenWidth < 600 ? 10 : 12,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
