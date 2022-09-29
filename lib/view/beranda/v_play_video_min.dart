import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/config/beranda_obs.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/model/m_video_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoViewMin extends StatefulWidget {
  PlayVideoViewMin({super.key, required this.youtubePlayerController});
  YoutubePlayerController youtubePlayerController;

  @override
  State<PlayVideoViewMin> createState() => _PlayVideoViewMinState();
}

class _PlayVideoViewMinState extends State<PlayVideoViewMin> {
  BerandaObs served = Get.put(BerandaObs());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color.fromRGBO(33, 33, 33, 1),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: served.minHeightPanel.value,
            child: YoutubePlayer(
              controller: widget.youtubePlayerController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              onReady: () {},
              thumbnail: CachedNetworkImage(
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
          ),
          // SizedBox(
          //   width: 120,
          //   height: served.minHeightPanel.value,
          //   child: CachedNetworkImage(
          //     imageUrl:
          //         served.dataItems.value.snippet?.thumbnails?.standard?.url ??
          //             served.dataItems.value.snippet?.thumbnails?.high!.url ??
          //             "",
          //     fit: BoxFit.cover,
          //     placeholder: (context, url) {
          //       return SizedBox(
          //         width: 100,
          //         height: served.minHeightPanel.value,
          //       );
          //     },
          //   ),
          // ),
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
            onPressed: () {
              widget.youtubePlayerController.play();
            },
            icon: const Icon(Icons.play_arrow, size: 30),
          ),
          IconButton(
            onPressed: () {
              served.dataItems.value = ItemVideoList();
            },
            icon: const Icon(Icons.close, size: 30),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
