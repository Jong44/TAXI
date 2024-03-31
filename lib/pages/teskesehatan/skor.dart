import 'package:flutter/material.dart';

class skor extends StatefulWidget {
  const skor({super.key});

  @override
  State<skor> createState() => _skorState();
}

class _skorState extends State<skor> {
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
              height: 60,
            ),
            Center(
              child: Image.asset("assets/score.png", width: 270),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Skor kamu menandakan gangguan kecemasan sedang",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Kamu sedang merasa gelisah dan kesulitan mengontrol kecemasanmu. Gejala fisik seperti gangguan tidur  dan kesulitan berfokus, mungkin lebih terasa, dan meningkat pda saat stres. Dapatkan bantuan dari para ahli untuk memahami pikiran, perasaan, dan gejala yang kamu alami",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Carikan Ahli",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff173b34),
                  minimumSize: Size(double.infinity, 50)),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lihat Detail",
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  width: 143,
                ),
                TextButton(onPressed: () {}, child: Text("Ulangi Tes"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
