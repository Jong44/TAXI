import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/gala.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/pages/moodtracker/ReviewMoodTracker.dart';
import 'package:taxi_app/services/MoodTrackerService.dart';
import 'package:taxi_app/utils/formatTanggal.dart';

class MainMoodTracker extends StatefulWidget {
  const MainMoodTracker({super.key});

  @override
  State<MainMoodTracker> createState() => _MainMoodTrackerState();
}

class _MainMoodTrackerState extends State<MainMoodTracker> {
  int point = 0;
  List listEmojis = [
    {
      "description": "Sangat Buruk",
      "emoji": "assets/emojis/sangat-buruk.png",
      "color": const Color(0xffFF2F2F),
      "point": 1,
    },
    {
      "description": "Buruk",
      "emoji": "assets/emojis/buruk.png",
      "color": const Color(0xffE09B2D),
      "point": 2,
    },
    {
      "description": "Netral",
      "emoji": "assets/emojis/normal.png",
      "color": const Color(0xff67D441),
      "point": 3,
    },
    {
      "description": "Baik",
      "emoji": "assets/emojis/baik.png",
      "color": const Color(0xffF68686),
      "point": 4,
    },
    {
      "description": "Sangat Baik",
      "emoji": "assets/emojis/sangat-baik.png",
      "color": const Color(0xff6C54FF),
      "point": 5,
    },
  ];

  List listEmosiPositif = [
    {"name": "Bersemangat", "status": false},
    {"name": "Bahagia", "status": false},
    {"name": "Tenang", "status": false},
    {"name": "Senang", "status": false},
    {"name": "Gembira", "status": false},
    {"name": "Bangga", "status": false},
    {"name": "Penuh Cinta", "status": false},
    {"name": "Lega", "status": false},
    {"name": "Terhibur", "status": false},
    {"name": "Terinspirasi", "status": false},
    {"name": "Bersyukur", "status": false},
    {"name": "Optimis", "status": false},
  ];

  List listEmosiNegatif = [
    {"name": "Sedih", "status": false},
    {"name": "Kesal", "status": false},
    {"name": "Cemas", "status": false},
    {"name": "Takut", "status": false},
    {"name": "Marah", "status": false},
    {"name": "Kecewa", "status": false},
    {"name": "Gelisah", "status": false},
    {"name": "Stres", "status": false},
    {"name": "Gundah", "status": false},
    {"name": "Bingung", "status": false},
    {"name": "Takut", "status": false},
    {"name": "Kesal", "status": false},
  ];

  List listPengaruh = [
    {"name": "Keluarga", "status": false},
    {"name": "Pekerjaan", "status": false},
    {"name": "Pendidikan", "status": false},
    {"name": "Hubungan", "status": false},
    {"name": "Kesehatan", "status": false},
    {"name": "Keuangan", "status": false},
    {"name": "Lingkungan", "status": false},
    {"name": "Olahraga", "status": false},
    {"name": "Hobi", "status": false},
    {"name": "Pengembangan Diri", "status": false},
    {"name": "Keseimbangan Hidup", "status": false},
    {"name": "Kendali Emosi", "status": false},
  ];

  void handleChangeStatusPositif(index) {
    setState(() {
      listEmosiPositif[index]['status'] = !listEmosiPositif[index]['status'];
    });
    handleHitungPositif(listEmosiPositif[index]['status']);
  }

  void handleHitungPositif(status) {
    setState(() {
      if (status) {
        jumlahEmosiPositif += 1;
      } else {
        jumlahEmosiPositif -= 1;
      }
    });
    changePoint();
  }

  void handleChangeStatusNegatif(index) {
    setState(() {
      listEmosiNegatif[index]['status'] = !listEmosiNegatif[index]['status'];
    });
    handleHitungNegatif(listEmosiNegatif[index]['status']);
  }

  void handleHitungNegatif(status) {
    setState(() {
      if (status) {
        jumlahEmosiNegatif += 1;
      } else {
        jumlahEmosiNegatif -= 1;
      }
    });
    changePoint();
  }

  void handleChangeStatusPengaruh(index) {
    setState(() {
      listPengaruh[index]['status'] = !listPengaruh[index]['status'];
    });
    handleChangeStatusPengaruh(listEmosiNegatif[index]['status']);
  }

  void handleHitungPengaruh(status) {
    setState(() {
      if (status) {
        jumlahPengaruh += 1;
      } else {
        jumlahPengaruh -= 1;
      }
    });
    changePoint();
  }

  void changePoint() {
    if (jumlahEmosiPositif > jumlahEmosiNegatif + 2) {
      setState(() {
        point = 5;
      });
    } else if (jumlahEmosiPositif + 2 < jumlahEmosiNegatif) {
      setState(() {
        point = 1;
      });
    } else if (jumlahEmosiPositif > jumlahEmosiNegatif) {
      setState(() {
        point = 4;
      });
    } else if (jumlahEmosiPositif < jumlahEmosiNegatif) {
      setState(() {
        point = 2;
      });
    } else {
      setState(() {
        point = 3;
      });
    }
  }

  int jumlahEmosiPositif = 0;
  int jumlahEmosiNegatif = 0;
  int jumlahPengaruh = 0;
  String date = "";
  TextEditingController noteController = TextEditingController();
  Map hasil = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = formatTanggalHari(DateTime.now());
    MoodTrackerService().getMoodTrackerToday().then((value) {
      setState(() {
        hasil = value;
      });
      if (hasil.isNotEmpty) {
        listEmosiPositif.forEach((e) {
          hasil['emosi_positif'].forEach((element) {
            if (e['name'] == element['name']) {
              setState(() {
                e['status'] = true;
              });
            }
          });
        });

        listEmosiNegatif.forEach((element) {
          hasil['emosi_negatif'].forEach((element2) {
            if (element['name'] == element2['name']) {
              setState(() {
                element['status'] = true;
              });
            }
          });
        });

        listPengaruh.forEach((element) {
          hasil['pengaruh'].forEach((element2) {
            if (element['name'] == element2['name']) {
              setState(() {
                element['status'] = true;
              });
            }
          });
        });

        setState(() {
          noteController.text = hasil['note'];
          point = hasil['point'];

          jumlahEmosiPositif = hasil['emosi_positif'].length;
          jumlahEmosiNegatif = hasil['emosi_negatif'].length;
          jumlahPengaruh = hasil['pengaruh'].length;
        });

        changePoint();
      }
    });
    print(hasil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(date,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < listEmojis.length; i++)
                      Container(
                        width: 50,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: point == listEmojis[i]['point']
                                    ? listEmojis[i]['color']
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(
                                        0.2), // Warna dan opasitas bayangan
                                    spreadRadius: 1, // Penyebaran bayangan
                                    blurRadius: 2, // Blur bayangan
                                    offset: Offset(
                                        0, 1), // Perpindahan bayangan (x, y)
                                  ),
                                ],
                              ),
                              child: Image.asset(listEmojis[i]['emoji']),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 25,
                              child: Text(
                                listEmojis[i]['description'],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Emosi positif apa yang kamu rasakan hari ini ?",
                  style: TextStyle(
                      letterSpacing: 0.5, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    listEmosiPositif.length,
                    (index) => InkWell(
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          handleChangeStatusPositif(index);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: listEmosiPositif[index]['status']
                              ? ColorConfig.primaryColor
                              : const Color(0xffdddddd).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          listEmosiPositif[index]['name'],
                          style: TextStyle(
                              fontSize: 13,
                              color: listEmosiPositif[index]['status']
                                  ? const Color(0xffffffff)
                                  : const Color(0xff000000)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Emosi negatif apa yang kamu rasakan hari ini ?",
                  style: TextStyle(
                      letterSpacing: 0.5, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    listEmosiNegatif.length,
                    (index) => InkWell(
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          handleChangeStatusNegatif(index);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: listEmosiNegatif[index]['status']
                              ? ColorConfig.primaryColor
                              : const Color(0xffdddddd).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          listEmosiNegatif[index]['name'],
                          style: TextStyle(
                            fontSize: 13,
                            color: listEmosiNegatif[index]['status']
                                ? const Color(0xffffffff)
                                : const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Dari mana emosi tersebut berasal ?",
                  style: TextStyle(
                      letterSpacing: 0.5, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    listPengaruh.length,
                    (index) => InkWell(
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          handleChangeStatusPengaruh(index);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: listPengaruh[index]['status']
                              ? ColorConfig.primaryColor
                              : const Color(0xffdddddd).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          listPengaruh[index]['name'],
                          style: TextStyle(
                            fontSize: 13,
                            color: listPengaruh[index]['status']
                                ? const Color(0xffffffff)
                                : const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Ceritakan Perasaanmu Hari Ini",
                  style: TextStyle(
                      letterSpacing: 0.5, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffdddddd), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: noteController,
                    style: TextStyle(fontSize: 13),
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MainButton(
            title: "Simpan",
            onpressed: () {
              final moodPositif = listEmosiPositif
                  .where((element) => element['status'] == true)
                  .toList();
              final moodNegatif = listEmosiNegatif.where((element) {
                return element['status'] == true;
              }).toList();
              final pengaruh = listPengaruh
                  .where((element) => element['status'] == true)
                  .toList();

              if (hasil.isNotEmpty) {
                MoodTrackerService().updateMoodTracker(
                  noteController.text,
                  moodNegatif,
                  moodPositif,
                  pengaruh,
                  point,
                  hasil['id'],
                );
              } else {
                MoodTrackerService().addMoodTracker(
                  noteController.text,
                  moodNegatif,
                  moodPositif,
                  pengaruh,
                  point,
                );
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewMoodTracker(),
                ),
              );
            },
            borderRadius: 10.0,
          ),
        ));
  }
}
