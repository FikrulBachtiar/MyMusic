import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:my_music/component/tab_item.dart';
import 'package:my_music/config/beranda_obs.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/routes.gr.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final MiniplayerController _miniplayerController = MiniplayerController();
  BerandaObs served = Get.put(BerandaObs());

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
      builder: (context, child, animation) {
        return Obx(
          () => Stack(
            children: [
              child,
              served.ytController.value.initialVideoId == ''
                  ? const SizedBox()
                  : SafeArea(
                      child: Miniplayer(
                        controller: served.miniplayerController.value,
                        minHeight: 70,
                        maxHeight: size.height,
                        builder: (height, percentage) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: height < size.height * .355
                                        ? height
                                        : size.height * .28,
                                    width: height < size.height * .355
                                        ? (height / .45).floor() <=
                                                size.width.floor()
                                            ? height / .45
                                            : size.width
                                        : size.width,
                                    child: YoutubePlayer(
                                      controller: served.ytController.value,
                                      progressColors: const ProgressBarColors(
                                        playedColor: Colors.red,
                                        bufferedColor:
                                            Color.fromARGB(255, 224, 224, 224),
                                        backgroundColor: Colors.grey,
                                        handleColor: Colors.red,
                                      ),
                                      onEnded: (metaData) {
                                        served.ytController.value
                                            .seekTo(const Duration(seconds: 0));
                                        served.ytController.value.pause();
                                        // _controller.load("wGBochsajWc");
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Offstage(
                                      offstage: height > size.height * .15,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Text(
                                                  "Hello World",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  "Hello",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              served.ytController.value.value
                                                      .isPlaying
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              size: 30,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.close,
                                                size: 30),
                                          ),
                                          const SizedBox(width: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ],
          ),
        );
      },
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
                      served.miniplayerController.value
                          .animateToHeight(state: PanelState.MIN);
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
                      served.miniplayerController.value
                          .animateToHeight(state: PanelState.MIN);
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
                      served.miniplayerController.value
                          .animateToHeight(state: PanelState.MIN);
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
                      served.miniplayerController.value
                          .animateToHeight(state: PanelState.MIN);
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
