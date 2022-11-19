import 'package:flutter/material.dart';
import 'package:loja_virtual/src/configs/custom_dors.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle(
      {Key? key,
      required this.category,
      required this.isSelect,
      required this.onPressed})
      : super(key: key);

  final String category;
  final bool isSelect;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              color: isSelect
                  ? CustomColors.customSwatchColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            category,
            style: TextStyle(
                color:
                    isSelect ? Colors.white : CustomColors.customConstrastColor,
                fontWeight: FontWeight.bold,
                fontSize: isSelect ? 16 : 14),
          ),
        ),
      ),
    );
  }
}
