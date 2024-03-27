import 'package:flutter/material.dart';

class screen4 extends StatelessWidget {
  const screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Image.asset(
              "assets/logo_landscape.png",
              width: 170,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Image.asset(
              "assets/dokter.png",
              width: 600,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Kualitas Dokter",
            style: TextStyle(
                color: Color(0xff173b34),
                fontSize: 21,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Your mental health is a priority. Your happiness is an essential. Your self-care is a necessity",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
          )
        ],
      ),
    );
  }
}
