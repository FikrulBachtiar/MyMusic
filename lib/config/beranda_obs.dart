import 'package:get/get.dart';

class BerandaObs extends GetxController {
  var navTabItems = [0, 1, "Semua", "Game", "Video Mix", "Musik", "Live"].obs;
  var currentIndexSubNav = 2.obs;

  changeIndexSubNav(int index) {
    print("Helo $index");
    currentIndexSubNav.value = index;
  }
}
