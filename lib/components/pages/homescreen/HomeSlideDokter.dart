import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:taxi_app/components/global/RatingStar.dart';
import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/pages/detaildokter/DokterDetailScreen.dart';
import 'package:taxi_app/utils/formatRupiah.dart';

class HomeSlidePsikolog extends StatelessWidget {
  final List<DokterModel> dokter;
  HomeSlidePsikolog({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rekomendasi Ahli",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 220,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: dokter.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DokterDetailScreen(
                                        dokter: dokter[index],
                                      )));
                        },
                        child: Container(
                            width: 170,
                            height: 220,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Container(
                                          width: double.infinity,
                                          height: 125,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    dokter[index].image_url),
                                                fit: BoxFit.cover),
                                          ),
                                        )),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffE4E4E7)),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Psikolog",
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            dokter[index].fullname,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(
                                            color: Color(0xffE4E4E7),
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            formatRupiah(dokter[index].price),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      margin: EdgeInsets.all(7),
                                      padding: EdgeInsets.all(5),
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xffE4E4E7)),
                                      ),
                                      child: Iconify(
                                        Bi.heart,
                                      )),
                                ),
                              ],
                            )),
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
