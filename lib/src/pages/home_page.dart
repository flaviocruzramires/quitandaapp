import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bem vindo ao Quitada',
          style: TextStyle(
            color: CustomColors.customCardColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColors.customSwatchColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
          ],
        ),
      ),
    );
  }
}
