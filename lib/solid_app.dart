import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:solid_project/routes/app_routes.dart';
import 'package:solid_project/services/services_manager.dart';

class SolidAppRunner {
  static Future<void> run() async {
    await ServicesManager.init();
  }
}

class SolidApp extends StatefulWidget {
  const SolidApp({super.key});

  @override
  State<SolidApp> createState() => _SolidAppState();
}

class _SolidAppState extends State<SolidApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}
