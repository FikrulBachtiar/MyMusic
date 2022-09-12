import 'package:flutter/material.dart';
import 'package:my_music/config/colors.dart';

class TabItemComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final double? sizeIcon;
  final Color? colorText;
  final bool isActive;

  const TabItemComponent({
    Key? key,
    required this.onTap,
    this.onLongPress,
    required this.text,
    required this.icon,
    this.isActive = false,
    this.sizeIcon,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? kBottomAppBarButton : kBottomAppBarButton,
              size: sizeIcon,
            ),
            const SizedBox(height: 2),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.5,
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
