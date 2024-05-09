import 'package:flutter/material.dart';

class TextBetween extends StatelessWidget {
  final leftText;
  final rightText;
  const TextBetween(
      {super.key, required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        ),
        Text(
          rightText,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
