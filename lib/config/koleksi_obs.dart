import 'package:get/get.dart';

class KoleksiObs extends GetxController {
  @override
  void onInit() {
    valueDropDownPlaylist.value = itemsDropDownPlaylist.first;
    super.onInit();
  }

  var itemsDropDownPlaylist = <String>["A-Z", "Baru ditambahkan"].obs;
  var valueDropDownPlaylist = ''.obs;
}
