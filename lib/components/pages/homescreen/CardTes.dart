import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/pages/teskesehatan/start_tes.dart';

class CardTes extends StatelessWidget {
  const CardTes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 185,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(108, 84, 175, 0.8),
                  Color.fromRGBO(80, 63, 118, 1)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(top: 25),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Positioned(
                    top: 15,
                    left: 65,
                    child: SvgPicture.asset("assets/icons/icon_bg.svg",
                        width: 30, height: 60)),
                Positioned(
                    bottom: -5,
                    left: -5,
                    child: SvgPicture.asset("assets/icons/icon_bg.svg",
                        width: 30, height: 60)),
                Positioned(
                    bottom: 0,
                    left: 85,
                    child: SvgPicture.asset("assets/icons/icon_bg.svg",
                        width: 40, height: 40)),
                Positioned(
                    top: 7,
                    right: 13,
                    child: SvgPicture.asset("assets/icons/icon_bg.svg",
                        width: 30, height: 30)),
                Positioned(
                    top: 29,
                    right: 0,
                    child: SvgPicture.asset("assets/icons/icon_bg.svg",
                        width: 30, height: 30)),
                Positioned(
                    bottom: 8,
                    right: 0,
                    child: SvgPicture.asset("assets/icons/icon_bg.svg",
                        width: 30, height: 30)),
                Positioned(
                    bottom: -5,
                    right: 25,
                    child: SvgPicture.asset("assets/icons/icon_bg.svg",
                        width: 30, height: 30)),
                Container(
                  width: 240,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Cek Kondisi Kesehatan Mentalmu Yuk!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Karena TACA Peduli dengan Kesehatan Mentalmu",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                          width: 100,
                          height: 35,
                          child: MainButton(
                            title: "Mulai",
                            onpressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StartTestKesehatan()));
                            },
                            borderRadius: 50.0,
                            bgColor: Color(0xffFF9F24),
                            textColor: Colors.black,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: SizedBox(
              child: Image.asset("assets/dokter_home.png", fit: BoxFit.contain),
            ),
          )
        ],
      ),
    );
  }
}
