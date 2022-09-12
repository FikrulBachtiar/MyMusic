import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/component/tab_item.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/home_obs.dart';
import 'package:my_music/view/home/v_beranda.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeObs served = Get.put(HomeObs());
  final screen = [
    const BerandaView(),
    Container(child: const Text("Shorts")),
    Container(child: const Text("Subscribtion")),
    Container(child: const Text("Koleksi")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screen[served.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          elevation: 0,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: .7, color: kBorderBottomAppBar),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TabItemComponent(
                    text: "Beranda",
                    sizeIcon: 26,
                    icon: served.selectedIndex.value == 0
                        ? Icons.home
                        : Icons.home_outlined,
                    colorText: kBottomAppBarButton,
                    isActive: served.selectedIndex.value == 0 ? true : false,
                    onTap: () {
                      if (served.selectedIndex.value != 0) {
                        served.changeCurrentIndex(0);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: TabItemComponent(
                    text: "Shorts",
                    sizeIcon: 26,
                    icon: served.selectedIndex.value == 1
                        ? Icons.filter_5
                        : Icons.filter_5_outlined,
                    colorText: kBottomAppBarButton,
                    isActive: served.selectedIndex.value == 1 ? true : false,
                    onTap: () {
                      if (served.selectedIndex.value != 1) {
                        served.changeCurrentIndex(1);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: kTransparent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabItemComponent(
                    text: "Subscription",
                    sizeIcon: 26,
                    icon: served.selectedIndex.value == 2
                        ? Icons.subscriptions
                        : Icons.subscriptions_outlined,
                    colorText: kBottomAppBarButton,
                    isActive: served.selectedIndex.value == 2 ? true : false,
                    onTap: () {
                      if (served.selectedIndex.value != 2) {
                        served.changeCurrentIndex(2);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: TabItemComponent(
                    text: "Koleksi",
                    sizeIcon: 26,
                    icon: served.selectedIndex.value == 3
                        ? Icons.video_library
                        : Icons.video_library_outlined,
                    colorText: kBottomAppBarButton,
                    isActive: served.selectedIndex.value == 3 ? true : false,
                    onTap: () {
                      if (served.selectedIndex.value != 3) {
                        served.changeCurrentIndex(3);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
