import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:my_music/component/behavior.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/histori_obs.dart';

class HistoriView extends StatefulWidget {
  const HistoriView({super.key});

  @override
  State<HistoriView> createState() => _HistoriViewState();
}

class _HistoriViewState extends State<HistoriView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _telusuriController = TextEditingController();
  final FocusNode _telusuriNode = FocusNode();
  HistoriObs served = Get.put(HistoriObs());
  late AnimationController _animationController;
  late Animation _animation;
  late Animation _animationTextField;
  KeyboardVisibilityController keyb = KeyboardVisibilityController();

  @override
  void dispose() {
    _telusuriController.dispose();
    _telusuriNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _telusuriNode.addListener(() {
      if (_telusuriNode.hasFocus) {
        _animationController.forward();
        served.isTelusuri.value = true;
      } else {
        _animationController.reverse();
        served.isTelusuri.value = false;
      }
    });
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = IntTween(begin: -80, end: 0).animate(_animationController);
    _animationTextField =
        IntTween(begin: 0, end: 80).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Histori"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: BehaviorComponent(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animationTextField,
                      builder: (context, child) {
                        return Container(
                          width: size.width - _animationTextField.value,
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          color: kTextFieldHistori,
                          child: Obx(
                            () => TextField(
                              controller: _telusuriController,
                              focusNode: _telusuriNode,
                              onChanged: (text) {
                                served.isFilled.value =
                                    (text.isEmpty) ? false : true;
                              },
                              decoration: InputDecoration(
                                hintText: "Telusuri histori tontonan",
                                hintStyle: const TextStyle(fontSize: 16.5),
                                border: InputBorder.none,
                                suffixIcon: served.isFilled.isTrue
                                    ? IconButton(
                                        splashColor: kTransparent,
                                        highlightColor: kTransparent,
                                        onPressed: () {},
                                        icon: const Icon(
                                          CupertinoIcons.clear,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : null,
                                suffixIconColor: Colors.grey,
                                prefixIcon: const Icon(
                                  CupertinoIcons.search,
                                  color: Colors.grey,
                                ),
                                prefixIconColor: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Positioned(
                          right: double.parse(_animation.value.toString()),
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 80,
                            alignment: Alignment.center,
                            color: Colors.black,
                            child: const Text(
                              "BATAL",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: size.width,
                // height: size.height,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    perDays(size),
                    perDays(size),
                    perDays(size),
                    perDays(size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget perDays(Size size) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Kemarin",
            style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 25),
          Row(
            children: const [
              Icon(CupertinoIcons.square_on_square, size: 28),
              SizedBox(width: 15),
              Text(
                "Shorts",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: size.width,
            height: 175,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              separatorBuilder: (context, index) => const SizedBox(width: 13),
              itemBuilder: (context, x) {
                return SizedBox(
                  // color: Colors.red,
                  width: 110,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://i.ytimg.com/vi/7mcdIlnVLvs/hq720_2.jpg?sqp=-oaymwEdCJYDENAFSFXyq4qpAw8IARUAAIhCcAHAAQbQAQE=&rs=AOn4CLDW682lHCCXhS-00KW98sFVo25lnQ',
                        fit: BoxFit.cover,
                        width: 110,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          "4 year old adorable girl |Real Woman | #shorts",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            shadows: [
                              Shadow(color: Colors.grey, blurRadius: 3),
                            ],
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              listYoutube(size),
              listYoutube(size),
              listYoutube(size),
              listYoutube(size),
              listYoutube(size),
              listYoutube(size),
              listYoutube(size),
            ],
          ),
        ],
      ),
    );
  }

  Widget listYoutube(Size size) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: size.width,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://i.ytimg.com/vi/lg2cdA2BglE/mqdefault.jpg',
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Flutter Tutorial - SQL Database Storage Using Sqlite & Sqflite",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.5),
                ),
                SizedBox(height: 1.5),
                Text(
                  "Johannes Milke",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: kTextNameHistory,
                  ),
                ),
                SizedBox(height: 1.5),
                Text(
                  "117 rb x ditonton",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: kTextNameHistory,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 18,
            height: 23,
            child: IconButton(
              splashRadius: 1,
              iconSize: 18,
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                CupertinoIcons.ellipsis_vertical,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
