import 'package:flutter/material.dart';

class MainInputText extends StatelessWidget {
  final title;
  final prefixIcon;
  final placeholder;
  final inputController;
  final backgroundColor;

  const MainInputText(
      {super.key,
      this.title,
      this.backgroundColor,
      required this.prefixIcon,
      required this.placeholder,
      required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null ? Text(title != null ? title : "") : SizedBox(),
        SizedBox(
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor != null ? backgroundColor : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: backgroundColor != null ? Border() : Border.all(width: 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: prefixIcon,
                hintText: placeholder),
          ),
        )
      ],
    );
    ;
  }
}
