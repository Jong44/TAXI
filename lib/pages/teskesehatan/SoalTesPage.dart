import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/models/SoalTesModel.dart';
import 'package:taxi_app/pages/teskesehatan/skor.dart';

class SoalTesPage extends StatefulWidget {
  const SoalTesPage({super.key});

  @override
  State<SoalTesPage> createState() => _SoalTesPageState();
}

class _SoalTesPageState extends State<SoalTesPage> {
  List<int> poinSoal = [0, 1, 2, 3];
  List<String> jawabanSoal = [
    "Tidak Pernah",
    "Beberapa Hari",
    "Sebagian Besar Hari",
    "Setiap Hari"
  ];

  List<SoalTesModel> soal = [];

  Future<List<SoalTesModel>> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/soal_tes.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((data) => SoalTesModel.fromJson(data)).toList();
  }

  List<int> poinSelected = [];

  int hitungJumlahPoint() {
    int jumlahPoint = 0;
    for (var i = 0; i < poinSelected.length; i++) {
      jumlahPoint += poinSelected[i];
    }
    return jumlahPoint;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData().then((value) {
      setState(() {
        soal = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tes Kesehatan Mental",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(
                  "Dalam 2 Minggu Terakhir. \nSeberapa sering kamu merasa terganggu oleh hal berikut",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: List.generate(
                    soal.length,
                    (indexSoal) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          soal[indexSoal].teks,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              poinSoal.length,
                              (indexPoint) => InkWell(
                                onTap: () {
                                  setState(() {
                                    if (indexSoal >= poinSelected.length) {
                                      poinSelected.add(poinSoal[indexPoint]);
                                    } else {
                                      poinSelected[indexSoal] =
                                          poinSoal[indexPoint];
                                    }
                                  });
                                },
                                child: Container(
                                  width: 60,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              indexSoal >= poinSelected.length
                                                  ? Colors.white
                                                  : poinSelected[indexSoal] ==
                                                          poinSoal[indexPoint]
                                                      ? ColorConfig.primaryColor
                                                      : Colors.white,
                                          border: Border.all(
                                              color: ColorConfig.primaryColor,
                                              width: 1.5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        jawabanSoal[indexPoint],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: MainButton(
            title: "Selesai",
            onpressed: () {
              int jumlahPoint = hitungJumlahPoint();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => skor(jumlahPoint: jumlahPoint),
                ),
              );
            },
            borderRadius: 10.0),
      ),
    );
  }
}
