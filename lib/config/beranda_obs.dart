import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_music/model/m_video_list.dart';
import 'package:my_music/service/s_beranda.dart';

class BerandaObs extends GetxController {
  var currentIndexSubNav = 2.obs;
  var videoCategoryId = 0.obs;
  var sizeList = 20.obs;
  var pageToken = ''.obs;
  var pageTokenPlay = ''.obs;
  var subNavItems = [].obs;
  var fullSizeMaxHeightPanel = true.obs;
  var isOpen = false.obs;
  var minHeightPanel = 70.0.obs;
  var dataItems = ItemVideoList().obs;

  categoryVideo() {
    BerandaService().getCategoryVideo().then((res) {
      var list = [
        {"one": "one"},
        {"two": "two"},
        {"three": "three"},
      ];
      if (res.items != null) {
        for (var i = 0; i < res.items!.length; i++) {
          var data = {
            "id": res.items![i].id!,
            "title": res.items![i].snippet!.title,
            "channelId": res.items![i].snippet!.channelId,
          };
          list.add(data);
        }
        subNavItems.addAll(list);
      } else {
        subNavItems.value = [];
      }
    });
  }

  changeIndexSubNav(int index, String id, PagingController paging) {
    currentIndexSubNav.value = index;
    videoCategoryId.value = int.parse(id);
    pageToken.value = '';
    paging.refresh();
  }

  dialog() {
    Get.defaultDialog(
      title: '',
      content: Container(
        padding: const EdgeInsets.all(8),
        child: const Text("Berhasil!"),
      ),
    );
  }
}
