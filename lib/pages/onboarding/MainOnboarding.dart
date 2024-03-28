import 'package:flutter/material.dart';
import 'package:taxi_app/pages/auth/welcomepage.dart';
import 'package:taxi_app/pages/onboarding/screen/screen1.dart';
import 'package:taxi_app/pages/onboarding/screen/screen2.dart';
import 'package:taxi_app/pages/onboarding/screen/screen3.dart';
import 'package:taxi_app/pages/onboarding/screen/screen4.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({super.key});

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> {
  int indexScreen = 0;
  List Screen = [screen1(), screen2(), screen3(), screen4()];
  void handleNext() {
    setState(() {
      if (indexScreen < Screen.length && indexScreen >= 0) {
        indexScreen += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[indexScreen],
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 65,
            ),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: indexScreen == 0 ? Colors.black : Colors.white,
                      border: Border.all(width: 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: indexScreen == 1 ? Colors.black : Colors.white,
                      border: Border.all(width: 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: indexScreen == 2 ? Colors.black : Colors.white,
                      border: Border.all(width: 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: indexScreen == 3 ? Colors.black : Colors.white,
                      border: Border.all(width: 1),
                      shape: BoxShape.circle),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  if (indexScreen == Screen.length - 1) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => welcomepage()));
                  } else {
                    handleNext();
                  }
                },
                child:
                    Text(indexScreen == Screen.length - 1 ? "Mulai" : "Lanjut"))
          ],
        ),
      ),
    );
  }
}
