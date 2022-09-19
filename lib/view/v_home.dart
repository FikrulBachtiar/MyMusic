import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_music/component/tab_item.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/routes.gr.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AutoTabsScaffold(
      routes: const [
        BerandaRoute(),
        ShortsRoute(),
        SubscriptionRoute(),
        KoleksiRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomAppBar(
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
                    icon: tabsRouter.activeIndex == 0
                        ? Icons.home
                        : Icons.home_outlined,
                    colorText: kBottomAppBarButton,
                    isActive: tabsRouter.activeIndex == 0 ? true : false,
                    onTap: () {
                      tabsRouter.setActiveIndex(0);
                    },
                  ),
                ),
                Expanded(
                  child: TabItemComponent(
                    text: "Shorts",
                    sizeIcon: 26,
                    icon: tabsRouter.activeIndex == 1
                        ? Icons.filter_5
                        : Icons.filter_5_outlined,
                    colorText: kBottomAppBarButton,
                    isActive: tabsRouter.activeIndex == 1 ? true : false,
                    onTap: () {
                      tabsRouter.setActiveIndex(1);
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
                    icon: tabsRouter.activeIndex == 2
                        ? Icons.subscriptions
                        : Icons.subscriptions_outlined,
                    colorText: kBottomAppBarButton,
                    isActive: tabsRouter.activeIndex == 2 ? true : false,
                    onTap: () {
                      tabsRouter.setActiveIndex(2);
                    },
                  ),
                ),
                Expanded(
                  child: TabItemComponent(
                    text: "Koleksi",
                    sizeIcon: 26,
                    icon: tabsRouter.activeIndex == 3
                        ? Icons.video_library
                        : Icons.video_library_outlined,
                    colorText: kBottomAppBarButton,
                    isActive: tabsRouter.activeIndex == 3 ? true : false,
                    onTap: () {
                      tabsRouter.setActiveIndex(3);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
