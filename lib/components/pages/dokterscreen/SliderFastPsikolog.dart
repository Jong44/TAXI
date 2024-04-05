import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/RatingStar.dart';

class SliderFastPsikolog extends StatelessWidget {
  SliderFastPsikolog({super.key});

  List Categori = ["Pekerjaan", "Keluarga", "Percintaan", "Kendali Emosi"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Psikolog Dengan Jadwal Tercepat",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 265,
            child: ListView.builder(
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 180,
                        height: 265,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade200),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Erika Issabela, M. Psi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 11),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Psikolog",
                                style: TextStyle(fontSize: 9),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              RatingStar(),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: List.generate(
                                    Categori.length,
                                    (index) {
                                      final text = Categori[index];

                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xff235347)),
                                          color: Color(0xffF0F4FF),
                                        ),
                                        constraints: BoxConstraints(
                                          minWidth: 55,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 8,
                                                color: Color(0xff235347)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  );
                }))
      ],
    );
  }
}
