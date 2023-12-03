import 'package:flutter/material.dart';
import 'package:payment_app/const/app_colors.dart';

class AppButtons extends StatelessWidget {
  final double? fontSize;
  final IconData icon;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? text;
  final double? iconSize;
  const AppButtons(
      {super.key,
      this.fontSize = 20,
      required this.icon,
      this.text,
      this.onTap,
      this.backgroundColor = AppColors.mainColor,
      this.iconColor = AppColors.mainColor,
      this.textColor = Colors.white,
      this.iconSize = 36});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: backgroundColor,
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
          text != null
              ? Text(
                  text!,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
