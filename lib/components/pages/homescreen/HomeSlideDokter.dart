import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/RatingStar.dart';
import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/pages/detailscreen/DokterDetailScreen.dart';

class HomeSlidePsikolog extends StatelessWidget {
  final List<DokterModel> dokter;
  const HomeSlidePsikolog({super.key, required this.dokter});

  String kategori(List<String> kategori) {
    String fullKategori = '';
    for (var i = 0; i < kategori.length; i++) {
      fullKategori += kategori[i];
      if (i != kategori.length - 1) {
        fullKategori += ', ';
      }
    }
    return fullKategori;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 5),
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
                itemCount: dokter.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DokterDetailScreen(
                                      dokter: dokter[index])));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
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
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          dokter[index].fotoProfil),
                                      fit: BoxFit.cover),
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
                                  dokter[index].nama,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  dokter[index].ahli,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RatingStar(),
                                Text(
                                  kategori(dokter[index].kategori),
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
