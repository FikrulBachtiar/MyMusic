import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_music/component/behavior.dart';
import 'package:my_music/component/circle_avatar.dart';
import 'package:my_music/config/beranda_obs.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/currency_format.dart';
import 'package:my_music/config/profile_obs.dart';
import 'package:my_music/model/m_video_list.dart';
import 'package:my_music/service/s_beranda.dart';

class PlayVideoViewMax extends StatefulWidget {
  const PlayVideoViewMax({super.key});

  @override
  State<PlayVideoViewMax> createState() => _PlayVideoViewMaxState();
}

class _PlayVideoViewMaxState extends State<PlayVideoViewMax>
    with SingleTickerProviderStateMixin {
  BerandaObs served = Get.put(BerandaObs());
  ProfileObs servedProfile = Get.put(ProfileObs());
  final PagingController<int, ItemVideoList> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });
    super.initState();
  }

  fetchPage(int page) async {
    BerandaService()
        .getVideoList(
      maxResults: served.sizeList.value,
      pageToken: served.pageTokenPlay.value,
      videoCategoryId: served.videoCategoryId.value.toString(),
    )
        .then(
      (res) {
        List<ItemVideoList>? data = res.items ?? [];
        var document = parse(data[0].player?.embedHtml);
        var urlVideo = document.querySelectorAll('iframe')[0].attributes["src"];
        if (res.nextPageToken == null) {
          _pagingController.appendLastPage(data);
        } else {
          served.pageTokenPlay.value = res.nextPageToken.toString();
          _pagingController.appendPage(data, page);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: bodys(size),
    );
  }

  Widget bodys(Size size) {
    return SafeArea(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              height: served.heightSize.value <= 338
                  ? served.heightSize.value - 40.0
                  : 280,
              width: served.heightSize.value <= 338
                  ? served.heightSize.value / .6
                  : size.width,
              child: CachedNetworkImage(
                imageUrl:
                    served.dataItems.value.snippet?.thumbnails?.standard?.url ??
                        served.dataItems.value.snippet?.thumbnails?.high!.url ??
                        "",
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return SizedBox(
                    width: double.parse(
                      served.dataItems.value.snippet?.thumbnails?.high?.width
                              .toString() ??
                          "",
                    ),
                    height: 280,
                  );
                },
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: BehaviorComponent(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      infoVideo(size),
                      const SizedBox(height: 20),
                      pagingContent()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pagingContent() {
    return PagedListView<int, ItemVideoList>(
      pagingController: _pagingController,
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      builderDelegate: PagedChildBuilderDelegate<ItemVideoList>(
        itemBuilder: (context, item, index) {
          var imageNetWork = item.snippet?.thumbnails?.standard?.url ??
              item.snippet?.thumbnails?.high!.url;
          return InkWell(
            onTap: () {},
            child: Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageNetWork.toString(),
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return SizedBox(
                          width: double.parse(
                            item.snippet?.thumbnails?.high?.width.toString() ??
                                "",
                          ),
                          height: 280,
                        );
                      },
                    ),
                    Positioned(
                      bottom: 30,
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
                          (item.contentDetails?.duration ?? "")
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.snippet?.title.toString() ?? "",
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
                                    "${item.snippet?.channelTitle} \u2022 117 rb x ditonton \u2022 1 bulan yang lalu",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: kFontStatistics,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 30,
                              padding: const EdgeInsets.all(0),
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(Icons.more_vert, size: 21),
                              ),
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
    );
  }

  Widget infoVideo(Size size) {
    return Column(
      children: [
        const SizedBox(height: 20),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        served.dataItems.value.snippet?.title.toString() ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      alignment: Alignment.topCenter,
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 29,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  "${CurrencyFormat.convertToAbbreviation(served.dataItems.value.statistics?.viewCount ?? "")} x ditonton \u2022 ${CurrencyFormat.convertToDifferentDate(served.dataItems.value.snippet?.publishedAt)}",
                  style: const TextStyle(
                    fontSize: 12.7,
                    color: kGreyTwo,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              iconButtons(
                text: CurrencyFormat.convertToIdr(
                    int.parse(
                        served.dataItems.value.statistics?.likeCount ?? ""),
                    0,
                    ""),
                onTap: () {},
                icon: Icons.thumb_up_alt_outlined,
              ),
              iconButtons(
                text: "Tidak Suka",
                onTap: () {},
                icon: Icons.thumb_down_alt_outlined,
              ),
              iconButtons(
                text: "Bagikan",
                onTap: () {},
                icon: Icons.redo_rounded,
              ),
              iconButtons(
                text: "Buat",
                onTap: () {},
                icon: Icons.video_call_outlined,
              ),
              iconButtons(
                text: "Download",
                onTap: () {},
                icon: CupertinoIcons.arrow_down_to_line,
              ),
              iconButtons(
                text: "Klip",
                onTap: () {},
                icon: Icons.content_cut_outlined,
              ),
              iconButtons(
                text: "Simpan",
                onTap: () {},
                icon: Icons.library_add_outlined,
              ),
            ],
          ),
        ),
        const Divider(color: kGrey),
        infoChannel(),
        const Divider(color: kGrey),
        commentInfo(),
      ],
    );
  }

  Widget commentInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("Komentar", style: TextStyle(fontSize: 14)),
                  const SizedBox(width: 10),
                  Text(
                    CurrencyFormat.convertToAbbreviation(
                        served.dataItems.value.statistics?.commentCount ?? ""),
                    style: const TextStyle(color: kGreyTwo, fontSize: 13),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_double_arrow_down_sharp, size: 22),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatarComponent(radius: 14),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  color: kBlack,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Tambahkan komentar...",
                    style: TextStyle(fontSize: 12, color: kGreyTwo),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoChannel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 25.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: served.dataItems.value.snippet?.thumbnails
                            ?.standard?.url ??
                        served.dataItems.value.snippet?.thumbnails?.high!.url ??
                        "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      served.dataItems.value.snippet?.channelTitle.toString() ??
                          "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14.5),
                    ),
                    const Text(
                      "74,9 rb subscriber",
                      style: TextStyle(fontSize: 12, color: kGreyTwo),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {},
            child: const Text(
              "SUBSCRIBE",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget iconButtons({
    required String text,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Icon(icon, size: 26.5),
            const SizedBox(height: 5),
            Text(text, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
