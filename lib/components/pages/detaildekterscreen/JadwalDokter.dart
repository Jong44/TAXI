import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/config/ColorConfig.dart';

class JadwalDokter extends StatefulWidget {
  final tanggalList;
  final hariList;
  final waktuList;
  final layananList;
  final dateList;
  final Function onpressed;
  final String name;
  final Function(Map<String, dynamic>) onSelectedtanggal;
  final Function(Map<String, dynamic>) onSelectedwaktu;
  final Function(Map<String, dynamic>) onSelectedlayanan;
  const JadwalDokter(
      {super.key,
      required this.name,
      required this.dateList,
      required this.onpressed,
      required this.layananList,
      required this.waktuList,
      required this.tanggalList,
      required this.hariList,
      required this.onSelectedtanggal,
      required this.onSelectedwaktu,
      required this.onSelectedlayanan});

  @override
  _JadwalDokterState createState() => _JadwalDokterState();
}

class _JadwalDokterState extends State<JadwalDokter> {
  int indexTanggal = 0;
  int indexWaktu = 0;
  int indexLayanan = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pilih berdasarkan jadwal",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Icon(
              Icons.calendar_month,
              color: ColorConfig.primaryColor,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 90,
          child: ListView.builder(
            itemCount: widget.tanggalList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Map<String, dynamic> data = {
                        "tanggal": widget.tanggalList[index],
                        "hari": widget.hariList[index],
                        "date": widget.dateList[index],
                      };
                      widget.onSelectedtanggal(data);
                      setState(() {
                        indexTanggal = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 90,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: indexTanggal == index
                              ? ColorConfig.primaryColor
                              : Color(0xffdddddd),
                        ),
                        color: indexTanggal == index
                            ? ColorConfig.primaryColor.withOpacity(0.1)
                            : Color(0xfff8f8f8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.hariList[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: indexTanggal == index
                                    ? ColorConfig.primaryColor
                                    : Color(0xffdddddd),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 2,
                              width: 20,
                              color: indexTanggal == index
                                  ? ColorConfig.primaryColor
                                  : Color(0xffdddddd),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.tanggalList[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: indexTanggal == index
                                    ? ColorConfig.primaryColor
                                    : Color(0xffdddddd),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Pilih waktu konseling",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          padding: EdgeInsets.only(right: 30),
          child: GridView.builder(
              itemCount: widget.waktuList.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 35),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Map<String, dynamic> data = {
                      "waktu": widget.waktuList[index],
                    };
                    widget.onSelectedwaktu(data);
                    setState(() {
                      indexWaktu = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: indexWaktu == index
                          ? ColorConfig.primaryColor.withOpacity(0.1)
                          : Color(0xfff8f8f8),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: indexWaktu == index
                              ? ColorConfig.primaryColor
                              : Color(0xffdddddd)),
                    ),
                    child: Text(
                      widget.waktuList[index],
                      style: TextStyle(
                          color: indexWaktu == index
                              ? ColorConfig.primaryColor
                              : Color(0xffdddddd),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Pilih waktu konseling",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: List.generate(
            widget.layananList.length,
            (index) => InkWell(
              onTap: () {
                Map<String, dynamic> data = {
                  "layanan": widget.layananList[index],
                };
                widget.onSelectedlayanan(data);
                setState(() {
                  indexLayanan = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: indexLayanan == index
                      ? ColorConfig.primaryColor.withOpacity(0.1)
                      : Color(0xfff8f8f8),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      width: 1,
                      color: indexLayanan == index
                          ? ColorConfig.primaryColor
                          : Color(0xffdddddd)),
                ),
                child: Text(
                  widget.layananList[index],
                  style: TextStyle(
                      color: indexLayanan == index
                          ? ColorConfig.primaryColor
                          : Color(0xffdddddd),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MainButton(
          borderRadius: 10.0,
          title: "Konsultasi dengan ${widget.name}",
          onpressed: widget.onpressed,
        ),
      ],
    );
  }
}
