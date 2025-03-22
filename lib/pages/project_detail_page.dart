import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_portfolio/constants/app_style.dart';
import 'package:new_portfolio/gen/assets.gen.dart';

class ProjectDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String? imagePath; // Đường dẫn ảnh minh họa (nếu có)
  final String? link; // Liên kết dự án (GitHub, demo, v.v.)

  const ProjectDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    this.imagePath,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text(
          title,
          style: AppStyle.title.copyWith(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hình ảnh minh họa (nếu có)
              if (imagePath != null)
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(imagePath!),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              if (imagePath != null) SizedBox(height: 20),

              // Mô tả dự án
              Text(
                'Description',
                style: AppStyle.button.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: AppStyle.button.copyWith(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),

              // Công nghệ sử dụng
              Text(
                'Technologies Used',
                style: AppStyle.button.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    technologies.map((tech) {
                      return Chip(
                        label: Text(
                          tech,
                          style: AppStyle.button.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      );
                    }).toList(),
              ),
              SizedBox(height: 30),

              // Nút liên kết (nếu có)
              if (link != null)
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Thêm logic mở link (dùng url_launcher nếu cần)
                      print('Open link: $link');
                    },
                    icon: SvgPicture.asset(
                      Assets.icons.star,
                      width: 20,
                      color: Colors.white,
                    ),
                    label: Text(
                      'View Project',
                      style: AppStyle.button.copyWith(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.9), // Nền tối đồng bộ
    );
  }
}
