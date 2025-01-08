import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_project/modules/home/home_page_controller.dart';
import 'package:solid_project/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Obx(() {
          var textDark = controller.textBlack;
          return Scaffold(
            backgroundColor: Color.fromRGBO(
              controller.colorMap['r']!,
              controller.colorMap['g']!,
              controller.colorMap['b']!,
              1,
            ),
            body: InkWell(
              onTap: () {
                controller.sortColors();
              },
              child: Center(
                child: Text('Hello There',
                    style: TextStyle(
                        fontSize: 24,
                        color: textDark.value
                            ? AppColors.black50
                            : AppColors.white10)),
              ),
            ),
          );
        });
      },
    );
  }
}
