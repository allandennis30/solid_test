import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solid_project/modules/auth/login/login_controller.dart';
import 'package:solid_project/theme/app_colors.dart';
import 'package:solid_project/theme/solid_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return SolidScaffold(
          showAppBar: false,
          solidBackgroundColor: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 14, bottom: 32),
                  constraints: const BoxConstraints(
                    maxHeight: 82,
                    maxWidth: 166,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                  decoration: const BoxDecoration(
                    color: AppColors.greenLoginPage,
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.only(left: 32),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 24),
                              const Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.bluePrimary,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Form(
                                key: controller.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Email',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: AppColors.grey500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                      controller: controller.emailController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'E-mail',
                                        hintText: 'Enter your email',
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Email is required';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Password',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: AppColors.grey500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                      controller: controller.passwordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Password',
                                        hintText: '*********',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password is required';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 60,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (controller.formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            controller.login();
                                          }
                                        },
                                        child: const Text(
                                          'Access',
                                          style: TextStyle(
                                            fontFamily: 'LexendDeca',
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black50,
                                            fontSize: 26,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.22 * MediaQuery.of(context).size.height),
                const Text(
                  '© 2025 Solid. Software',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.normal,
                    color: AppColors.white10,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
