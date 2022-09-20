import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/config/beranda_obs.dart';

class PlayVideoView extends StatefulWidget {
  const PlayVideoView({super.key});

  @override
  State<PlayVideoView> createState() => _PlayVideoViewState();
}

class _PlayVideoViewState extends State<PlayVideoView> {
  BerandaObs served = Get.put(BerandaObs());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(
          () => Hero(
            tag: served.playVideoItems.value.id.toString(),
            child: CachedNetworkImage(
              imageUrl: served.playVideoItems.value.snippet?.thumbnails
                      ?.standard?.url ??
                  served.playVideoItems.value.snippet?.thumbnails?.high?.url ??
                  "",
              placeholder: (context, url) {
                return SizedBox(
                  width: double.parse(
                    served.playVideoItems.value.snippet?.thumbnails?.high!.width
                            .toString() ??
                        "",
                  ),
                  height: 280,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
