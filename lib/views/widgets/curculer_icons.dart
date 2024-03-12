import 'package:flutter/material.dart';

class CircularIcons extends StatelessWidget {
  const CircularIcons(
      {super.key,
      required this.height,
      required this.width,
      required this.size,
      required this.color,
      required this.backgrounColor,
      this.onPreessed,
      required this.icon});

  final double height, width, size;
  final Color color;
  final Color backgrounColor;
  final VoidCallback? onPreessed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgrounColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          onPressed: onPreessed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
