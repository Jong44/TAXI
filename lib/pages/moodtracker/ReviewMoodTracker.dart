import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/services/MoodTrackerService.dart';
import 'package:taxi_app/utils/formatTanggal.dart';

class ReviewMoodTracker extends StatefulWidget {
  const ReviewMoodTracker({super.key});

  @override
  State<ReviewMoodTracker> createState() => _ReviewMoodTrackerState();
}

class _ReviewMoodTrackerState extends State<ReviewMoodTracker> {
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

  List listMood = [];
  int indexActive = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MoodTrackerService().getRiwayatMoodTracker().then((value) {
      setState(() {
        listMood = value;
      });
      print(listMood);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Mood Tracker"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  height: 40,
                ),
                Text("Mood Mingguanmu",
                    style: TextStyle(
                        letterSpacing: 0.5, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Total check mood kamu : ${listMood.length} Hari",
                                style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                7,
                                (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (index < listMood.length) {
                                        indexActive = index;
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: listMood.length != 0
                                          ? index < listMood.length
                                              ? listEmojis[int.parse(
                                                      listMood[index]
                                                          ['point']) -
                                                  1]['color']
                                              : Colors.grey.shade300
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: listMood.length != 0
                                        ? index < listMood.length
                                            ? Image.asset(
                                                listEmojis[int.parse(
                                                        listMood[index]
                                                            ['point']) -
                                                    1]['emoji'],
                                                width: 20,
                                                height: 20,
                                              )
                                            : null
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: listMood.length != 0
                                        ? listEmojis[int.parse(
                                                listMood[indexActive]
                                                    ['point']) -
                                            1]['color']
                                        : Colors.grey.shade300,
                                  ),
                                  child: listMood.length != 0
                                      ? Image.asset(
                                          listEmojis[int.parse(
                                                  listMood[indexActive]
                                                      ['point']) -
                                              1]['emoji'],
                                          width: 30,
                                          height: 30,
                                        )
                                      : null,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    listMood.length != 0
                                        ? Text(
                                            formatTanggal(DateTime.parse(
                                                listMood[indexActive]['date'])),
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w500))
                                        : Text("",
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w500)),
                                    Text(
                                        listMood.length != 0
                                            ? listEmojis[int.parse(
                                                    listMood[indexActive]
                                                        ['point']) -
                                                1]['description']
                                            : "",
                                        style: TextStyle(
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
