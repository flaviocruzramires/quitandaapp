import 'package:flutter/material.dart';
import 'package:quitandaapp/src/auth/components/custom_app_bar.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  CustomAppBar appBar() => CustomAppBar(
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            color: CustomColors.customCardColor,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Center(
        child: Text('Home Tab'),
      ),
    );
  }
}
