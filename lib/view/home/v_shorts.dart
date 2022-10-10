import 'package:flutter/material.dart';

class ShortsView extends StatefulWidget {
  const ShortsView({super.key});

  @override
  State<ShortsView> createState() => SsubscriptionStateView();
}

class SsubscriptionStateView extends State<ShortsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://i.ytimg.com/vi/5paBeSE3fRY/sddefault.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
