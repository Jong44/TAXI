import 'package:flutter/material.dart';

class TextFieldMain extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType type;
  final Color color;
  const TextFieldMain(
      {super.key,
      required this.placeholder,
      required this.controller,
      this.isPassword = false,
      this.type = TextInputType.text,
      this.color = const Color(0xffD8C7FF)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        keyboardType: type,
        style: TextStyle(fontSize: 14),
        controller: controller,
        obscureText: isPassword,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: placeholder),
      ),
    );
  }
}
