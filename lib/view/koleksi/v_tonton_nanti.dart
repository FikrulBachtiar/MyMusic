import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_music/component/behavior.dart';
import 'package:my_music/config/colors.dart';

class TontonNantiView extends StatefulWidget {
  const TontonNantiView({super.key});

  @override
  State<TontonNantiView> createState() => _TontonNantiViewState();
}

class _TontonNantiViewState extends State<TontonNantiView> {
  final List<int> _items = List<int>.generate(38, (int index) => index);

  @override
  void initState() {
    // ReorderableDelayedDragStartListener(
    //   index: 1,
    //   child: Container(child: const Icon(Icons.list)),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReorderableDelayedDragStartListener(
      index: 1,
      child: Container(child: const Icon(Icons.list)),
    );
    Size size = MediaQuery.of(context).size;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Scaffold(
      appBar: AppBar(
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
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Tonton nanti",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(CupertinoIcons.lock_circle),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Lynne Gaming",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: size.width,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: IconButton(
                      splashColor: kTransparent,
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_down_to_line_alt,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(
                                CupertinoIcons.play_arrow_solid,
                                color: kBlack,
                                size: 19,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "PUTAR",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: kTransparent,
                            border: Border.all(color: kWhite, width: 1.5),
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.shuffle,
                                color: kWhite,
                                size: 19,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "ACAK",
                                style: TextStyle(
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Text(
                        "38 video  \u2022",
                        style: TextStyle(
                          color: kTextTontonNanti,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.sort,
                                color: kTextTontonNanti,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Urutkan",
                                style: TextStyle(
                                  color: kTextTontonNanti,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ReorderableListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  buildDefaultDragHandles: false,
                  onReorder: (oldX, newX) {
                    return;
                  },
                  children: [
                    for (int index = 0; index < _items.length; index += 1)
                      listYoutube(size, index.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listYoutube(Size size, String keys) {
    return Container(
      key: Key(keys),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: size.width,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: [
          ReorderableDragStartListener(
            key: Key(keys),
            index: int.parse(keys),
            child: Container(
              child: const Icon(Icons.reorder, size: 19),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
