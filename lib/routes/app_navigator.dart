import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_project/routes/app_routes.dart';

class AppRoute {
  AppRoute({
    required this.route,
    this.query,
  });

  String route;
  String? query;
}

class RouteChangeNotifier extends ChangeNotifier {
  void _notifyListeners() {
    notifyListeners();
  }
}

abstract class AppNavigator {
  static final _routeStack = <AppRoute>[];
  static bool isPoppingNativePages = false;

  static final routeChangeNotifier = RouteChangeNotifier();

  static String? currentRouteName() =>
      _routeStack.isNotEmpty ? _routeStack.last.route : null;

  static AppRoute? currentRoute() =>
      _routeStack.isNotEmpty ? _routeStack.last : null;

  static List<AppRoute> get appRoutes => _routeStack;

  static Future<void> nativePopRoute(Route<dynamic> route) async {
    if (route.settings.name == null || isPoppingNativePages) {
      return;
    }

    if (_routeStack.isNotEmpty) {
      _routeStack.removeLast();
    }

    routeChangeNotifier._notifyListeners();
  }

  static void nativePushRoute(Route<dynamic> route) {
    if (route.settings.name == null) {
      return;
    }

    _routeStack.add(AppRoute(route: route.settings.name!));

    routeChangeNotifier._notifyListeners();
  }

  static Future<void> openHomePage() async {
    return Get.toNamed<void>(AppRoutes.home);
  }

  static Future<void> openLogin({bool closeAllRoutes = false}) async {
    if (closeAllRoutes) {
      Get.close(_routeStack.length - 1);
      Get.toNamed(AppRoutes.login);
    }

    return Get.toNamed<void>(AppRoutes.login);
  }
}
