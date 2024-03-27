import 'package:flutter/material.dart';
import 'package:taxi_app/pages/onboarding/MainOnboarding.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  print("click");
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),
              Center(
                child: Image.asset(
                  "assets/logo_color.png",
                  width: 150,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "Welcome To TAXI",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xff173b34)),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "Your mental health is a priority. Your happiness is an essential. Your self-care is a necessity",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
              ),
              SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainOnboarding()));
                },
                child: Text(
                  "START NOW",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff173b34),
                    minimumSize: Size(double.infinity, 50)),
              )
            ],
          ),
        ));
  }
}
