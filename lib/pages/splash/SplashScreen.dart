import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/pages/auth/LoginScreen.dart';
import 'package:taxi_app/pages/mainpage/MainPage.dart';
import 'package:taxi_app/pages/onboarding/FirstOnboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (auth.currentUser != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        // background
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(108, 93, 210, 1),
                  Color.fromRGBO(80, 63, 118, 1),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )),
            ),
            Positioned(
                top: -40,
                right: 0,
                child: SvgPicture.asset("assets/icons/icon_bg.svg",
                    width: 30, height: 60)),
            Positioned(
                top: -15,
                right: 50,
                child: SvgPicture.asset("assets/icons/icon_bg.svg",
                    width: 50, height: 100)),
            Positioned(
                top: 45,
                right: 135,
                child: SvgPicture.asset("assets/icons/icon_bg.svg",
                    width: 50, height: 50)),
            Positioned(
                top: -30,
                right: 130,
                child: SvgPicture.asset("assets/icons/icon_fill_bg.svg",
                    width: 50, height: 40)),
            Positioned(
                top: 10,
                right: 165,
                child: SvgPicture.asset("assets/icons/icon_fill_bg.svg",
                    width: 50, height: 40)),
            Positioned(
                top: 30,
                right: -20,
                child: SvgPicture.asset("assets/icons/icon_fill_bg.svg",
                    width: 50, height: 40)),
            Positioned(
                bottom: 60,
                left: -30,
                child: SvgPicture.asset("assets/icons/icon_fill_bg.svg",
                    width: 50, height: 70)),
            Positioned(
                bottom: -10,
                left: 35,
                child: SvgPicture.asset("assets/icons/icon_bg.svg",
                    width: 50, height: 90)),
            Positioned(
                bottom: 90,
                left: 55,
                child: SvgPicture.asset("assets/icons/icon_bg.svg",
                    width: 50, height: 50)),
            Positioned(
                bottom: 60,
                left: 115,
                child: SvgPicture.asset("assets/icons/icon_bg.svg",
                    width: 50, height: 50)),
            Positioned(
                bottom: -25,
                left: -10,
                child: SvgPicture.asset("assets/icons/icon_bg.svg",
                    width: 50, height: 50)),
            Positioned(
                bottom: -20,
                left: 120,
                child: SvgPicture.asset("assets/icons/icon_fill_bg.svg",
                    width: 50, height: 30)),
          ],
        ),
        Image.asset(
          "assets/taca/logo_white.png",
          width: 160,
        )
      ],
    ));
  }
}
