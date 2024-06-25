import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent_emoji_high_contrast.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/utils/formatRupiah.dart';

class RangkumanSesi extends StatefulWidget {
  final Map<String, dynamic> dataPesanan;
  final String nama;
  final List kategori;
  final String fotoProfil;
  final int harga;
  final Function onPilih;
  const RangkumanSesi(
      {super.key,
      required this.dataPesanan,
      required this.onPilih,
      required this.nama,
      required this.kategori,
      required this.fotoProfil,
      required this.harga});

  @override
  State<RangkumanSesi> createState() => _RangkumanSesiState();
}

class _RangkumanSesiState extends State<RangkumanSesi> {
  List<String> durasi = ["1 Jam", "2 Jam"];
  List<Map<String, dynamic>> media = [
    {"image": "assets/icons/video-call.jpg", "title": "Panggilan Video"},
    {"image": "assets/icons/tatap-muka.jpg", "title": "Tatap Muka"},
    {"image": "assets/icons/video-call.jpg", "title": "Panggilan Suara"}
  ];
  int indexDurasi = 0;
  bool isOpen = false;
  int indexMedia = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xffdddddd)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Konseling dengan Psikolog",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(widget.fotoProfil),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.nama,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 185,
                    child: Wrap(
                      spacing: 7,
                      runSpacing: 10,
                      children: List.generate(
                        widget.kategori.length,
                        (index) => Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: ColorConfig.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 0.8, color: ColorConfig.primaryColor)),
                          child: Text(
                            index < 3
                                ? widget.kategori[index]
                                : "+ " +
                                    (widget.kategori.length - 3).toString() +
                                    " Lainnya",
                            style: TextStyle(color: Colors.black, fontSize: 9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("Pilih Durasi",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(
              durasi.length,
              (index) => InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => setState(() => indexDurasi = index),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1,
                        color: indexDurasi == index
                            ? ColorConfig.primaryColor
                            : Color(0xffdddddd)),
                  ),
                  child: Text(
                    durasi[index],
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Pilih Media Konseling",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          SizedBox(
            height: 10,
          ),
          if (isOpen)
            Column(
              children: List.generate(
                media.length,
                (index) => InkWell(
                    onTap: () => setState(() {
                          isOpen = false;
                          media.insert(0, media.removeAt(index));
                          print(media);
                        }),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: index == media.length - 1
                                ? null
                                : Border(
                                    bottom: BorderSide(
                                        width: 1, color: Color(0xffdddddd))),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            children: [
                              Image.asset(
                                media[index]["image"],
                                width: 45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                media[index]["title"],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: ColorConfig.primaryColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )
          else
            InkWell(
              onTap: () {
                setState(() {
                  isOpen = true;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          media[0]["image"],
                          width: 45,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              media[0]["title"],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: ColorConfig.primaryColor),
                            ),
                            Text(
                              "Via ${media[0]["title"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Iconify(Tabler.shield_check),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Akan kami jamin konselingmu aman, nyaman , dan terjaga privasi kamu",
                style: TextStyle(fontSize: 12),
              ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(formatRupiah(widget.harga),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MainButton(
                title: "Pilih",
                onpressed: () {
                  widget.dataPesanan["durasi"] = durasi[indexDurasi];
                  widget.dataPesanan["media"] = media[indexMedia]["title"];
                  widget.onPilih(widget.dataPesanan);
                },
                borderRadius: 10.0,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
