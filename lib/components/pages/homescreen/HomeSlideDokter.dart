import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/RatingStar.dart';

class HomeSlidePsikolog extends StatelessWidget {
  const HomeSlidePsikolog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rekomendasi Psikolog Terbaik",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        width: 310,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1, color: Colors.grey.shade300)),
                        child: Row(children: [
                          Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: SizedBox(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Marisca Kusuma",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Psikolog",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RatingStar(),
                              Text(
                                "Keluarga, Percintaan, Keadaan Emosi, 3 Lainnya",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Color(0xff173b34),
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    CupertinoIcons.arrow_right,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ))
                        ]),
                      ),
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
