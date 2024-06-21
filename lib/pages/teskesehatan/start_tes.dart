import 'package:flutter/material.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/pages/teskesehatan/SoalTesPage.dart';
import 'package:taxi_app/pages/teskesehatan/skor.dart';

class StartTestKesehatan extends StatelessWidget {
  const StartTestKesehatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Tes Kesehatan Mental",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset("assets/depresi.png", width: 270),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ketahui Kesehatan Mental Kamu",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Hasil dari tes ini adalah gambaran kondisi kesehatan mentalmu, tidak ada jawaban yang benar ataupun salah jadi jawab dengan jujur ya!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Perlu diingat untuk tidak mendiagnosis diri sendiri dari hasil tes ini.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SoalTesPage()));
              },
              child: Text(
                "Mulai",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConfig.primaryColor,
                  minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
