import 'package:flutter/material.dart';
import 'package:taxi_app/components/pages/detaildekterscreen/JadwalDokter.dart';
import 'package:taxi_app/components/pages/detaildekterscreen/RiwayatDokter.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/pages/pembayaran/PembayaranScreen.dart';

class DokterDetailScreen extends StatefulWidget {
  final DokterModel dokter;
  const DokterDetailScreen({super.key, required this.dokter});

  @override
  State<DokterDetailScreen> createState() => _DokterDetailScreenState();
}

class _DokterDetailScreenState extends State<DokterDetailScreen> {
  int indexTab = 0;
  List listTab = ["Jadwal Konsultasi", "Riwayat"];
  List<String> tanggalList = [];
  List<String> hariList = [];
  List<String> dateList = [];
  Map<String, dynamic> onSelected = {};

  List<String> getTanggal() {
    DateTime now = DateTime.now();
    for (int i = 0; i < 10; i++) {
      DateTime tanggal = now.add(Duration(days: i));
      tanggalList.add(tanggal.day.toString());
      hariList.add(_getHari(tanggal.weekday));
      dateList.add(DateTime(tanggal.year, tanggal.month, tanggal.day)
          .toString()
          .substring(0, 10));
    }
    return tanggalList;
  }

  String _getHari(int weekday) {
    switch (weekday) {
      case 1:
        return "Senin";
      case 2:
        return "Selasa";
      case 3:
        return "Rabu";
      case 4:
        return "Kamis";
      case 5:
        return "Jumat";
      case 6:
        return "Sabtu";
      case 7:
        return "Minggu";
      default:
        return "";
    }
  }

  List waktuList = [
    "11:00",
    "12:00",
    "13:00",
    "18:00",
    "19:00",
    "20:00",
  ];

  List layananaList = [
    "Reguler",
    "Member",
  ];

  List kategoriDokter = [
    "Keluarga",
    "Kendali Emosi",
    "Kesehatan Mental",
    "Percintaan",
    "Pekerjaan"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tanggalList = getTanggal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Detail Dokter",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(widget.dokter.image_url),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: List.generate(
                    listTab.length,
                    (index) => Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                indexTab = index;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(listTab[index],
                                    style: TextStyle(
                                        color: indexTab == index
                                            ? ColorConfig.primaryColor
                                            : Colors.black,
                                        fontWeight: indexTab == index
                                            ? FontWeight.w500
                                            : FontWeight.w400,
                                        fontSize: 15)),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 2,
                                  width: listTab[index].length.toDouble() * 8.0,
                                  color: indexTab == index
                                      ? ColorConfig.primaryColor
                                      : Colors.transparent,
                                )
                              ],
                            )),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                indexTab == 0
                    ? JadwalDokter(
                        name: widget.dokter.fullname.toString(),
                        onSelectedtanggal: (Map<String, dynamic> data) {
                          onSelected['tanggal'] = data['tanggal'];
                          onSelected['hari'] = data['hari'];
                          onSelected['date'] = data['date'];
                        },
                        onSelectedwaktu: (Map<String, dynamic> data) {
                          setState(() {
                            onSelected['waktu'] = data['waktu'];
                          });
                        },
                        onSelectedlayanan: (Map<String, dynamic> data) {
                          setState(() {
                            onSelected['layanan'] = data['layanan'];
                          });
                        },
                        waktuList: waktuList,
                        layananList: layananaList,
                        tanggalList: tanggalList,
                        hariList: hariList,
                        dateList: dateList,
                        onpressed: () {
                          setState(() {
                            if (onSelected['waktu'] == null ||
                                onSelected['layanan'] == null ||
                                onSelected['tanggal'] == null) {
                              onSelected['waktu'] = waktuList[0];
                              onSelected['layanan'] = layananaList[0];
                              onSelected['tanggal'] = tanggalList[0];
                              onSelected['hari'] = hariList[0];
                              onSelected['date'] = dateList[0];
                            }
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PembayaranScreen(
                                        dataPesanan: onSelected,
                                        dokter: widget.dokter,
                                      )));
                        },
                      )
                    : RiwayatDokter(
                        nama: widget.dokter.fullname,
                        ahli: widget.dokter.spesialis,
                        pendidikan: widget.dokter.education,
                        sipp: widget.dokter.sipp,
                        kategori: widget.dokter.category,
                      ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
        ));
  }
}
