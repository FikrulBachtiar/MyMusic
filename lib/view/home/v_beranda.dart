import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_music/component/behavior.dart';
import 'package:my_music/config/beranda_obs.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/model/m_video_list.dart';
import 'package:my_music/service/s_beranda.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({super.key});

  @override
  State<BerandaView> createState() => _BerandaViewState();
}

class _BerandaViewState extends State<BerandaView> {
  BerandaObs served = Get.put(BerandaObs());
  final _googleSignIn = GoogleSignIn();
  final PagingController<int, Item> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    Get.delete<BerandaObs>();
    super.dispose();
  }

  fetchPage(int page) {
    BerandaService()
        .getVideoList(
      maxResults: served.sizeList.value,
      pageToken: served.pageToken.value,
      videoCategoryId: served.videoCategoryId.value.toString(),
    )
        .then(
      (res) {
        List<Item>? data = res.items ?? [];
        if (res.nextPageToken == null) {
          _pagingController.appendLastPage(data);
        } else {
          served.pageToken.value = res.nextPageToken.toString();
          _pagingController.appendPage(data, page);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: BehaviorComponent(),
        slivers: [
          Obx(
            () => SliverAppBar(
              backgroundColor: kSliverBackgroundColor,
              floating: true,
              bottom: served.subNavItems.isEmpty
                  ? null
                  : PreferredSize(
                      preferredSize: Size.fromHeight(size.height * 0.07),
                      child: ScrollConfiguration(
                        behavior: BehaviorComponent(),
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListView.separated(
                            itemCount: served.subNavItems.length,
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
                                    onTap: () => served.changeIndexSubNav(
                                      x,
                                      served.subNavItems[x]["id"],
                                      _pagingController,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      margin:
                                          x == (served.subNavItems.length - 1)
                                              ? const EdgeInsets.only(right: 10)
                                              : null,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kBorderItemSubNavbar,
                                        ),
                                        color:
                                            x == served.currentIndexSubNav.value
                                                ? kItemSubNavbarActive
                                                : kItemSubNavbar,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            served.subNavItems[x]["title"]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: x ==
                                                      served.currentIndexSubNav
                                                          .value
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
                    width: 42,
                  ),
                  const Text(
                    "Youtube",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: -.5,
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
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/profile', preventDuplicates: false);
                    },
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
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          PagedSliverList<int, Item>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Item>(
              itemBuilder: (context, item, index) {
                var imageNetWork = item.snippet.thumbnails!.standard?.url ??
                    item.snippet.thumbnails!.high!.url;
                return Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: imageNetWork.toString(),
                            placeholder: (context, url) {
                              return SizedBox(
                                width: double.parse(
                                  item.snippet.thumbnails!.high!.width
                                      .toString(),
                                ),
                                height: 280,
                              );
                            },
                          ),
                          Positioned(
                            bottom: 5,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                (item.contentDetails.duration)
                                    .replaceAll('M', '.')
                                    .replaceAll('PT', '')
                                    .replaceAll('S', ''),
                                style: const TextStyle(
                                  color: kFontDuration,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 20,
                          right: 10,
                          left: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.snippet.title.toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: kFontTitleSnippet,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          "${item.snippet.channelTitle} \u2022 117 rb x ditonton \u2022 1 bulan yang lalu",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: kFontStatistics,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: const Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
