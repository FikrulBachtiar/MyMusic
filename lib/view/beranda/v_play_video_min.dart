import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/config/beranda_obs.dart';
import 'package:my_music/config/colors.dart';

class PlayVideoViewMin extends StatefulWidget {
  const PlayVideoViewMin({super.key});

  @override
  State<PlayVideoViewMin> createState() => _PlayVideoViewMinState();
}

class _PlayVideoViewMinState extends State<PlayVideoViewMin> {
  BerandaObs served = Get.put(BerandaObs());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: served.minHeightPanel.value,
            child: CachedNetworkImage(
              imageUrl:
                  served.dataItems.value.snippet?.thumbnails?.standard?.url ??
                      served.dataItems.value.snippet?.thumbnails?.high!.url ??
                      "",
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return SizedBox(
                  width: 100,
                  height: served.minHeightPanel.value,
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  served.dataItems.value.snippet?.title.toString() ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  served.dataItems.value.snippet?.channelTitle.toString() ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: kGrey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, size: 30),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
