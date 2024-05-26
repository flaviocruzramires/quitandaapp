import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/pages/components/app_name_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const CustomAppBar({super.key, required this.actions});

  @override //
  Widget build(BuildContext context) => AppBar(
        actions: actions,
        backgroundColor: CustomColors.customSwatchColor,
        centerTitle: true,
        elevation: 3,
        title: const Column(
          children: [
            AppNameWidget(
              greenTitleColor: Colors.white,
              textSize: 40,
            )
          ],
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
