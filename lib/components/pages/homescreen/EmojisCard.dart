import 'package:flutter/material.dart';
import 'package:taxi_app/pages/moodtracker/MainMoodTracker.dart';

class EmojisCard extends StatelessWidget {
  final point;
  EmojisCard({super.key, required this.point});

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainMoodTracker()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // Bentuk border container
          boxShadow: [
            BoxShadow(
              color:
                  Colors.grey.withOpacity(0.2), // Warna dan opasitas bayangan
              spreadRadius: 3, // Penyebaran bayangan
              blurRadius: 10, // Blur bayangan
              offset: Offset(0, 3), // Perpindahan bayangan (x, y)
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              "Hai Bagaimana Perasaanmu Hai Ini ? ",
              style: TextStyle(letterSpacing: 0.5, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
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
                                offset:
                                    Offset(0, 1), // Perpindahan bayangan (x, y)
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
            )
          ],
        ),
      ),
    );
  }
}
