import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/RatingStar.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/pages/detaildokter/DokterDetailScreen.dart';

class SliderFastPsikolog extends StatelessWidget {
  final List<DokterModel> dokterList;
  SliderFastPsikolog({super.key, required this.dokterList});

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
                itemCount: dokterList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DokterDetailScreen(
                                      dokter: dokterList[index])));
                        },
                        child: Container(
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
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              dokterList[index].image_url),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.shade200),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  dokterList[index].fullname,
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  dokterList[index].spesialis,
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
                                      dokterList[index].category.length,
                                      (index) {
                                        final text =
                                            dokterList[index].category[index];

                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    ColorConfig.primaryColor),
                                            color: ColorConfig.primaryColor
                                                .withOpacity(0.1),
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
                                                  color:
                                                      ColorConfig.primaryColor),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                        ),
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
