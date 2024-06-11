import 'package:flutter/material.dart';
import 'package:taxi_app/config/ColorConfig.dart';

class MainButton extends StatelessWidget {
  final title;
  final onpressed;
  final borderRadius;
  final bgColor;
  final textColor;
  const MainButton(
      {super.key,
      required this.title,
      required this.onpressed,
      this.textColor,
      this.bgColor,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(
        title,
        style: TextStyle(color: textColor != null ? textColor : Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xff173b34),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: bgColor != null ? bgColor : ColorConfig.primaryColor,
          minimumSize: Size(double.infinity, 50)),
    );
  }
}
