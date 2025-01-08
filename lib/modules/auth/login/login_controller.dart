import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_project/routes/app_navigator.dart';
import 'package:solid_project/services/auth_service.dart';

class LoginController extends GetxController {
  final _authService = Get.find<AuthService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    final email = emailController.text;
    final password = passwordController.text;

    try {
      final user = await _authService.login(email: email, password: password);

      if (user != null) {
        log('Login successful: ${user.name}');
        AppNavigator.openHomePage();
      } else {
        log('Login failed: Invalid credentials');
        Get.snackbar('Error', 'Invalid username or password.');
      }
    } catch (e) {
      log('Error during login: $e');
      Get.snackbar('Error', 'An error occurred while trying to log in.');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
