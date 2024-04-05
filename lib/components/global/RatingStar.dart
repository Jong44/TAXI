import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          Icon(
            Icons.star,
            size: 11,
            color: Color(0xffF7CE45),
          )
      ],
    );
  }
}
