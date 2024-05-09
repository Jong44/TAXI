import 'package:flutter/material.dart';
import 'package:taxi_app/pages/mainpage/MainPage.dart';
import 'package:taxi_app/pages/teskesehatan/start_tes.dart';

class welcomepage extends StatefulWidget {
  const welcomepage({super.key});

  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset("assets/welcome.png", width: 500),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Selamat Datang Di TAXI",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff173b34),
                  fontSize: 17),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Hallo, Aprilian Tanjung",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff173b34)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                "Yuk, jawab pertanyaan -pertanyaan berikut, agar TAXI bisa lebih kenal dan mampu memberikan solusi terbaik sesuai kebutuhan kamu!",
                textAlign: TextAlign.center),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: Text(
                "Mulai Sekarang",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff173b34),
                  minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
