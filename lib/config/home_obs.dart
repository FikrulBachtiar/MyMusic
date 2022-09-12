import 'package:get/get.dart';

class HomeObs extends GetxController {
  void changeCurrentIndex(int index) {
    selectedIndex.value = index;
  }

  var selectedIndex = 0.obs;
}
