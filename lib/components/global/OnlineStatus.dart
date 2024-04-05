import 'package:flutter/material.dart';

class OnlineStatus extends StatelessWidget {
  final isCenter;
  const OnlineStatus({super.key, this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCenter == true ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration:
              BoxDecoration(color: Color(0xff009B4C), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Online",
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
