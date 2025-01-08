import 'package:get/get.dart';
import 'dart:math';

class HomePageController extends GetxController {
  RxList<String> lastColors = <String>[].obs;
  RxMap<String, int> colorMap = <String, int>{}.obs;
  RxBool textBlack = false.obs;
  @override
  void onInit() {
    super.onInit();
    sortColors();
  }

  void sortColors() {
    int r = 0;
    int g = 0;
    int b = 0;

    r = Random().nextInt(255);
    g = Random().nextInt(255);
    b = Random().nextInt(255);
    if (lastColors.contains('$r, $g, $b')) {
      sortColors();
      return;
    } else {
      lastColors.add('$r, $g, $b');
      colorMap.clear();
      colorMap.addAll({'r': r, 'g': g, 'b': b});

      if (r * 0.299 + g * 0.587 + b * 0.114 > 150) {
        textBlack.value = true;
      } else {
        textBlack.value = false;
      }
    }
  }
}
