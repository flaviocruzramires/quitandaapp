import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class QuantidadeWidget extends StatelessWidget {
  QuantidadeWidget({
    super.key,
    required this.value,
    required this.sufixo,
    required this.result,
    this.isRemovable = false,
  });

  final int value;
  final String sufixo;
  final Function(int quantity) result;
  bool isRemovable;

  @override
  Widget build(BuildContext context) {
    isRemovable = value == 1 ? true : isRemovable;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantidadeButton(
            color: !isRemovable || value > 1
                ? Colors.grey
                : CustomColors.customContrastColor,
            icon: !isRemovable || value > 1 ? Icons.remove : Icons.delete,
            onPressed: () {
              if (value == 1 && !isRemovable) return;
              int resultCount = value - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              '$value$sufixo',
              style: TextStyle(
                color: CustomColors.customDarkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _QuantidadeButton(
            color: CustomColors.customSwatchColor,
            icon: Icons.add,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantidadeButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantidadeButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
