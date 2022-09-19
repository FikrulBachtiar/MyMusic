import 'package:flutter/material.dart';
import 'package:my_music/config/colors.dart';

class RowList extends StatelessWidget {
  const RowList({
    Key? key,
    required this.text,
    this.subtitle,
    this.textColor,
    required this.icon,
    required this.ontap,
    this.iconTwo,
  }) : super(key: key);
  final String text;
  final Widget icon;
  final VoidCallback ontap;
  final String? subtitle;
  final Color? textColor;
  final Widget? iconTwo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 27),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.5,
                        color: textColor ?? kFontProfile,
                      ),
                    ),
                    subtitle == null ? Container() : const SizedBox(height: 2),
                    subtitle == null
                        ? Container()
                        : Text(
                            subtitle ?? "",
                            style: const TextStyle(
                              fontSize: 13.5,
                              color: kFontSubtitleProfile,
                            ),
                          ),
                  ],
                ),
              ],
            ),
            iconTwo ?? Container(),
          ],
        ),
      ),
    );
  }
}
