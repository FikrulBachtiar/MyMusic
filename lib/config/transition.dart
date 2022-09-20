import 'package:flutter/material.dart';

Widget zoomInTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return ScaleTransition(scale: animation, child: child);
}
