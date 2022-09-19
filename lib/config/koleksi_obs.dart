import 'package:get/get.dart';
import 'package:hive/hive.dart';

class KoleksiObs extends GetxController {
  @override
  void onInit() {
    valueDropDownPlaylist.value = itemsDropDownPlaylist.first;
    listHistory();
    super.onInit();
  }

  listHistory() async {
    var history = await Hive.openBox('History');
    if (history.values.isNotEmpty) {
      for (var i = 0; i < history.values.length; i++) {
        if (i <= dataSet.value) {
          dataHistory.add(history.get(i));
        }
      }
    }
  }

  var itemsDropDownPlaylist = <String>["A-Z", "Baru ditambahkan"].obs;
  var valueDropDownPlaylist = ''.obs;
  var dataHistory = [].obs;
  var dataSet = 14.obs;
}
