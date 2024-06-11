import 'package:flutter/material.dart';

class TextFieldMain extends StatelessWidget {
  final String placeholder;
  TextFieldMain({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Color(0xffD8C7FF), borderRadius: BorderRadius.circular(15)),
      child: TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: placeholder),
      ),
    );
  }
}
