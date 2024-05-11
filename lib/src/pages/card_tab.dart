import 'package:flutter/material.dart';
import 'package:quitandaapp/src/auth/components/custom_app_bar.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class CardTab extends StatelessWidget {
  const CardTab({super.key});

  CustomAppBar appBar() => CustomAppBar(
        actions: [
          Icon(
            Icons.info,
            color: CustomColors.customCardColor,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: const Center(
          child: Text('Cart Tab'),
        ));
  }
}
