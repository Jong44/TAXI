import 'package:flutter/material.dart';

class SlidePromo extends StatelessWidget {
  const SlidePromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Spesial untuk Kamu!",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 130,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                        height: 130,
                        width: 310,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(27, 137, 92, 1),
                                  Color(0xff0D6541)
                                ])),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dapatkan Sekarang!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  width: 130,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xff00A360),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "Konsultasi Online Gratis Buat Kamu",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
