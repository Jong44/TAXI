import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainButton.dart';

class WelcomeChat extends StatelessWidget {
  final startWithTextPress;
  final startPress;
  const WelcomeChat(
      {super.key, required this.startPress, required this.startWithTextPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Hallo, Aku \n OLAF",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Ask anything get your answer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              MainButton(
                bgColor: Color.fromRGBO(0, 0, 0, 0.2),
                textColor: Colors.black,
                borderRadius: 10.0,
                title: "Hallo Olaf, aku butuh Bantuan",
                onpressed: startWithTextPress,
              ),
              SizedBox(
                height: 20,
              ),
              MainButton(
                borderRadius: 10.0,
                title: "Mulai",
                onpressed: startPress,
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
