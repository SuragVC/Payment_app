import 'package:flutter/material.dart';
import 'package:payment_app/const/app_colors.dart';

class AppLargeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onTap;
  final bool? isBorder;
  final String text;
  final double? fontSize;
  const AppLargeButton({
    super.key,
    this.backgroundColor = AppColors.mainColor,
    this.textColor,
    this.onTap,
    this.isBorder = false,
    this.fontSize = 30,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: AppColors.mainColor),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
