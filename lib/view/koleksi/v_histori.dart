import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
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
      body: Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (context, x) {
                      return Container(
                        color: Colors.red,
                        width: 110,
                        // height: 100,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
