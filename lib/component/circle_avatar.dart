import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/profile_obs.dart';

class CircleAvatarComponent extends StatelessWidget {
  CircleAvatarComponent({super.key, this.onTap, this.radius});
  VoidCallback? onTap;
  double? radius;
  ProfileObs servedProfile = Get.put(ProfileObs());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        print(servedProfile.photoUrl.value);
        return CircleAvatar(
          radius: radius ?? 17.0,
          backgroundColor: servedProfile.photoUrl.value != ""
              ? kTransparent
              : servedProfile.username.value != 'Pengguna'
                  ? Colors.red
                  : kTransparent,
          child: InkWell(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: servedProfile.photoUrl.value != ""
                  ? CachedNetworkImage(
                      imageUrl: servedProfile.photoUrl.value,
                      width: 49,
                      height: 32,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.grey,
                          ),
                        );
                      },
                    )
                  : servedProfile.username.value != 'Pengguna'
                      ? Text(
                          servedProfile.username.value
                              .substring(0, 1)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Image.asset(
                          'assets/png/question.png',
                          width: 49,
                          height: 34,
                          fit: BoxFit.cover,
                        ),
            ),
          ),
        );
      },
    );
  }
}
