import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_music/component/behavior.dart';
import 'package:my_music/component/row_list_profile.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/profile_obs.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileObs served = Get.put(ProfileObs());

  signIn() async {
    GoogleSignIn signIn = GoogleSignIn(
      scopes: [
        'https://www.googleapis.com/auth/youtube.readonly',
        'https://www.googleapis.com/auth/youtube',
        'https://www.googleapis.com/auth/youtube.force-ssl',
        'https://www.googleapis.com/auth/youtubepartner',
      ],
    );

    bool googleUsers = await signIn.isSignedIn();
    if (!googleUsers) {
      GoogleSignInAccount? googleUser = await signIn.signIn();
      GoogleSignInAuthentication? auth = await googleUser!.authentication;
      served.username.value = googleUser.displayName ?? "";
      served.emails.value = googleUser.email;
      served.photoUrl.value = googleUser.photoUrl ?? "";
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(served.photoUrl.value);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.xmark,
            size: 30,
          ),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              print("hehehe");
            },
            child: const Text(
              "Kebijakan Privasi \u2022 Persyaratan Layanan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: BehaviorComponent(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () => signIn(),
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: served.photoUrl.value == ''
                                      ? Image.asset(
                                          'assets/question.png',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: served.photoUrl.value,
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Container(
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                served.username.value,
                                style: const TextStyle(
                                  fontSize: 16.5,
                                  color: kFontProfile,
                                ),
                              ),
                            ],
                          ),
                          const Icon(CupertinoIcons.right_chevron, size: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: size.width * .19),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Kelola Akun Google Anda",
                          style: TextStyle(
                            fontSize: 14.5,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RowList(
                text: "Channel Anda",
                icon: const Icon(
                  CupertinoIcons.person_crop_square,
                  size: 26,
                ),
                ontap: () {},
              ),
              RowList(
                text: "Aktifkan Mode Samaran",
                icon: const Icon(CupertinoIcons.person_alt_circle, size: 26),
                ontap: () {},
              ),
              RowList(
                text: "Tambahkan akun",
                icon: const Icon(CupertinoIcons.person_badge_plus, size: 26),
                ontap: () {},
              ),
              const Divider(color: Colors.grey, thickness: .2),
              RowList(
                text: "Dapatkan YouTube Premium",
                icon: const Icon(CupertinoIcons.t_bubble_fill, size: 26),
                ontap: () {},
              ),
              RowList(
                text: "Pembelian dan langganan",
                icon: const Icon(CupertinoIcons.money_dollar_circle, size: 26),
                ontap: () {},
              ),
              RowList(
                text: "Waktu tonton",
                icon: const Icon(CupertinoIcons.chart_bar_square, size: 26),
                ontap: () {},
              ),
              RowList(
                text: "Data Anda di YouTube",
                icon: const Icon(CupertinoIcons.lock_shield, size: 26),
                ontap: () {},
              ),
              const Divider(color: Colors.grey, thickness: .2),
              RowList(
                text: "Setelan",
                icon: const Icon(CupertinoIcons.gear_alt, size: 26),
                ontap: () {},
              ),
              RowList(
                text: "Bantuan & saran",
                icon: const Icon(CupertinoIcons.question_circle, size: 26),
                ontap: () {},
              ),
              const Divider(color: Colors.grey, thickness: .2),
              RowList(
                text: "YouTube Studio",
                icon: const Icon(CupertinoIcons.money_yen_circle, size: 26),
                ontap: () {},
              ),
              RowList(
                text: "YouTube Music",
                icon: const Icon(CupertinoIcons.money_yen_circle, size: 26),
                ontap: () {},
              ),
              RowList(
                text: "YouTube Kids",
                icon: const Icon(CupertinoIcons.money_yen_circle, size: 26),
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
