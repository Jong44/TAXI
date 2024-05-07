import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePodcastSlide extends StatelessWidget {
  const HomePodcastSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Podcast",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff173b34)),
                ),
              )
            ],
          ),
          Container(
            height: 160,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                          width: 270,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                    color: Colors.grey.shade300),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xff173b34),
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20)),
                                  ),
                                  child: Row(children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mood Cepat Berubah Apakah Bipolar?",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "30 Menit",
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff009B4C)),
                                        child: Icon(
                                          Icons.play_arrow,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
