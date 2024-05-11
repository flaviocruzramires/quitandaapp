import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const CustomAppBar({super.key, required this.actions});

  @override //
  Widget build(BuildContext context) => AppBar(
        actions: actions,
        backgroundColor: CustomColors.customSwatchColor,
        centerTitle: true,
        elevation: 3,
        title: Column(
          children: [
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 40),
                children: [
                  const TextSpan(
                    text: "Horti",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
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
            ),
          ],
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
