import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainInputPassword extends StatelessWidget {
  final title;
  final placeholder;
  final inputController;
  final obsecure;
  final pressObsecure;

  const MainInputPassword(
      {super.key,
      required this.title,
      required this.obsecure,
      required this.placeholder,
      required this.inputController,
      required this.pressObsecure});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            obscureText: obsecure,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.key),
                suffixIcon: IconButton(
                  onPressed: pressObsecure,
                  icon: obsecure
                      ? Icon(CupertinoIcons.eye_fill)
                      : Icon(CupertinoIcons.eye_slash_fill),
                ),
                hintText: placeholder),
          ),
        )
      ],
    );
    ;
  }
}
