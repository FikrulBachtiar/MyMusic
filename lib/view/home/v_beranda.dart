import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/component/behavior.dart';
import 'package:my_music/config/beranda_obs.dart';
import 'package:my_music/config/colors.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({super.key});

  @override
  State<BerandaView> createState() => _BerandaViewState();
}

class _BerandaViewState extends State<BerandaView> {
  BerandaObs served = Get.put(BerandaObs());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: BehaviorComponent(),
        slivers: [
          SliverAppBar(
            backgroundColor: kSliverBackgroundColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(size.height * 0.07),
              child: ScrollConfiguration(
                behavior: BehaviorComponent(),
                child: Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.separated(
                    itemCount: served.navTabItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, x) {
                      if (x == 0) {
                        return Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: kEksplorasi,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              children: const [
                                Icon(Icons.explore_outlined),
                                SizedBox(width: 5),
                                Text(
                                  "Eksplorasi",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (x == 1) {
                        return const VerticalDivider(
                          color: kEksplorasi,
                          thickness: 2,
                          width: 1,
                          indent: 2,
                          endIndent: 2,
                        );
                      } else {
                        return Obx(
                          () => InkWell(
                            splashColor: kTransparent,
                            highlightColor: kTransparent,
                            onTap: () => served.changeIndexSubNav(x),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: x == (served.navTabItems.length - 1)
                                  ? const EdgeInsets.only(right: 10)
                                  : null,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kBorderItemSubNavbar,
                                ),
                                color: x == served.currentIndexSubNav.value
                                    ? kItemSubNavbarActive
                                    : kItemSubNavbar,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    served.navTabItems[x].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          x == served.currentIndexSubNav.value
                                              ? kFontSubNavbarActive
                                              : kFontSubNavbar,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                  ),
                ),
              ),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/png/ytb.png',
                  width: 45,
                ),
                const Text(
                  "Music",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            actions: [
              const Icon(
                Icons.search,
                size: 28,
              ),
              const SizedBox(width: 20),
              CircleAvatar(
                radius: 16.0,
                backgroundColor: kTransparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/profile.jpg',
                    width: 49,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),

          // ListView.builder(
          //   itemBuilder: (context, index) {
          //     return Container(
          //       width: size.width,
          //       height: 100,
          //       color: Colors.red,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
