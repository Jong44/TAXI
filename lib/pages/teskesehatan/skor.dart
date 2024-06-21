import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/components/global/Segitiga.dart';
import 'package:taxi_app/models/HasilTesModel.dart';
import 'package:taxi_app/pages/search_dokter/search_page.dart';
import 'package:taxi_app/pages/teskesehatan/start_tes.dart';

class skor extends StatefulWidget {
  final int jumlahPoint;
  const skor({super.key, required this.jumlahPoint});

  @override
  State<skor> createState() => _skorState();
}

class _skorState extends State<skor> {
  Future<List<HasilModelModel>> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/hasil_tes.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((data) => HasilModelModel.fromJson(data)).toList();
  }

  late HasilModelModel hasilTest = HasilModelModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData().then((value) {
      setState(() {
        hasilTest = value.firstWhere((element) {
          return widget.jumlahPoint >= element.minPoint &&
              widget.jumlahPoint <= element.maxPoint;
        }) as HasilModelModel; // Update the type cast to HasilModelModel
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return hasilTest == null
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
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
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          width: double.infinity,
                          height: 50,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xff173b34),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff8EBD57),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFD468),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffFA8E2B),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffFA2B2B),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Positioned(
                                top: 20,
                                left: MediaQuery.of(context).size.width *
                                    (widget.jumlahPoint / (8 * 4)),
                                child: Column(
                                  children: [
                                    CustomPaint(
                                      size: Size(10, 10),
                                      painter: Segitiga(color: Colors.black),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 25,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                      ),
                                      child: Text(
                                        widget.jumlahPoint.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Terima kasih telah menyelesaikan tes gangguan kecemasan.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Hasil tes Anda menunjukkan tingkat potensi kecemasan seperti berikut:",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Potensi ${hasilTest.kategori}: ",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          hasilTest.potensi.length,
                          (index) => Text(
                            "• " + hasilTest!.potensi[index],
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 13, height: 1.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Saran : ",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          hasilTest.saran.length,
                          (index) => Text(
                            "• " + hasilTest.saran[index],
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 13, height: 1.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MainButton(
                          title: "Carikan Ahli",
                          onpressed: () {},
                          borderRadius: 50.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StartTestKesehatan()));
                              },
                              child: Text("Ulangi Tes"))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
