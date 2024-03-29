import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final title;
  final onpressed;
  const MainButton({super.key, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff173b34),
          minimumSize: Size(double.infinity, 50)),
    );
  }
}
