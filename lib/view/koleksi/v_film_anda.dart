import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music/component/behavior.dart';
import 'package:my_music/config/colors.dart';

class FilmAndaView extends StatefulWidget {
  const FilmAndaView({super.key});

  @override
  State<FilmAndaView> createState() => _FilmAndaViewState();
}

class _FilmAndaViewState extends State<FilmAndaView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Film & Acara"),
        shadowColor: Colors.grey,
        elevation: 1,
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: kWhite,
          indicatorWeight: 2,
          tabs: const [
            Tab(
              child: Text(
                "JELAJAHI",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Tab(
              child: Text(
                "DIBELI",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: BehaviorComponent(),
        child: TabBarView(
          controller: _tabController,
          children: [
            pageOne(size: size),
            pageTwo(size: size),
          ],
        ),
      ),
    );
  }

  Widget pageOne({required Size size}) {
    return Container(child: const Text("1"));
  }

  Widget pageTwo({required Size size}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.local_offer, size: 200),
        SizedBox(height: 15),
        Text(
          "Anda tidak memiliki pembelian",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Film dan acara yan Anda sewa atau",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 5),
        Text(
          "beli akan muncul di sini",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
