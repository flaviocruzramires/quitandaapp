import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  final String category;
  final bool isSelected;

  final VoidCallback onPressed;

  Color get _selectedColorPrimary =>
      isSelected ? CustomColors.customSwatchColor : Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _selectedColorPrimary,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 2,
              left: 2,
            ),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : CustomColors.customContrastColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
