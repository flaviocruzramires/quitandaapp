import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

abstract class CustomButtons {
  static TextButton primaryButton({
    required String text,
    required VoidCallback onPressed,
    double textSize = 20,
    String imagem = '',
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: CustomColors.customSwatchColor,
      ),
      child: Row(
        children: [
          Image.asset(imagem),
          Text(
            text,
          )
        ],
      ),
    );
  }
}
