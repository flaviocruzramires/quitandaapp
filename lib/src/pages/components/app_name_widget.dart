import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? greenTitleColor;
  final double textSize;

  const AppNameWidget({
    Key? key,
    this.greenTitleColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          const TextSpan(
            text: "Horti",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          TextSpan(
            text: "fruti",
            style: TextStyle(
                color: CustomColors.customContrastColor,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const TextSpan(
            text: "Jockei",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ],
      ),
    );
  }
}
