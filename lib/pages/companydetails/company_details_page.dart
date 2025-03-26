import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_portfolio/pages/companydetails/controllers/company_details_controller.dart';

class CompanyDetailsPage extends GetView<CompanyDetailsController> {
  const CompanyDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết công ty'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.company.value == null) {
          return const Center(child: Text('Không tìm thấy thông tin công ty'));
        }

        final company = controller.company.value!;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Vị trí: ${company.position}',
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Thời gian: ${company.duration}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Địa điểm: ${company.location}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Mô tả công việc:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              // Thêm mô tả công việc ở đây nếu có
              // Thêm các thông tin khác của công ty tại đây
            ],
          ),
        );
      }),
    );
  }
}
