import 'dart:async';
import 'package:get/get.dart';
import 'auth_service.dart';

class ServicesManager {
  static final wereServicesFirstInitialized = Completer<void>();

  static Future<void> init({bool createNonDeletables = true}) async {
    if (createNonDeletables) {
      Get.put(AuthService());
    }

    if (!wereServicesFirstInitialized.isCompleted) {
      wereServicesFirstInitialized.complete();
    }
  }
}
