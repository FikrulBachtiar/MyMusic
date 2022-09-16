import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/component/behavior.dart';
import 'package:my_music/component/row_list_profile.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/koleksi_obs.dart';

class KoleksiView extends StatefulWidget {
  const KoleksiView({super.key});

  @override
  State<KoleksiView> createState() => _KoleksiViewState();
}

class _KoleksiViewState extends State<KoleksiView> {
  KoleksiObs served = Get.put(KoleksiObs());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: BehaviorComponent(),
        slivers: [
          SliverAppBar(
            backgroundColor: kSliverBackgroundColor,
            floating: true,
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
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Baru-baru ini",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: size.width,
                      height: size.height * .18,
                      child: ScrollConfiguration(
                        behavior: BehaviorComponent(),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin: index == 0
                                    ? const EdgeInsets.only(left: 20)
                                    : index == 19
                                        ? const EdgeInsets.only(right: 20)
                                        : null,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://i.ytimg.com/vi/lg2cdA2BglE/mqdefault.jpg",
                                      height: 90,
                                      width: 160,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(height: 10),
                                    const SizedBox(
                                      width: 160,
                                      child: Text(
                                        "1 hit = 5 Slandar bash charges [OMEGA BASH!]",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 15);
                          },
                          itemCount: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    RowList(
                      ontap: () {
                        Get.toNamed('/history');
                      },
                      text: "Histori",
                      icon: const Icon(CupertinoIcons.time),
                    ),
                    RowList(
                      ontap: () {},
                      text: "Video Anda",
                      icon: const Icon(CupertinoIcons.play_rectangle),
                    ),
                    RowList(
                      ontap: () {},
                      text: "Hasil download",
                      subtitle: "1 video",
                      icon: const Icon(CupertinoIcons.arrow_down_to_line_alt),
                    ),
                    RowList(
                      ontap: () {},
                      text: "Film Anda",
                      icon: const Icon(CupertinoIcons.film),
                    ),
                    RowList(
                      ontap: () {},
                      text: "Tonton nanti",
                      subtitle: "38 video belum ditonton",
                      icon: const Icon(CupertinoIcons.clock),
                    ),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Playlist",
                        style: TextStyle(fontSize: 17),
                      ),
                      Obx(
                        () => DropdownButton<String>(
                          // isExpanded: true,
                          onChanged: (values) {
                            served.valueDropDownPlaylist.value = values ?? "";
                          },
                          icon: const Icon(CupertinoIcons.chevron_down),
                          iconSize: 21,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                          ),
                          underline: Container(),
                          hint: const Text("Select City"),
                          elevation: 0,
                          value: served.valueDropDownPlaylist.value,
                          items: served.itemsDropDownPlaylist
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    RowList(
                      ontap: () {},
                      text: "Playlist baru",
                      textColor: Colors.blue,
                      icon: const Icon(CupertinoIcons.add, color: Colors.blue),
                    ),
                    RowList(
                      ontap: () {},
                      text: "Video yang disukai",
                      subtitle: "154 Video",
                      icon: const Icon(CupertinoIcons.hand_thumbsup),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
