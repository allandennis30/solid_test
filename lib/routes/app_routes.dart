import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_project/modules/auth/login/login_screen.dart';
import 'package:solid_project/modules/home/home_page.dart';

class AppRoutes {
  AppRoutes._();

  static const home = '/home';
  static const login = '/login';

  static final routes = <GetPage<dynamic>>[
    _animatedPage(
      name: login,
      page: LoginScreen.new,
    ),
    _animatedPage(name: home, page: HomePage.new),
  ];

  static GetPage<T> _animatedPage<T>({
    required String name,
    required Widget Function() page,
  }) {
    return GetPage<T>(
      name: name,
      page: page,
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeft,
    );
  }
}
