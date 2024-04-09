import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent_emoji_high_contrast.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:taxi_app/components/global/MainButton.dart';

class RangkumanSesi extends StatefulWidget {
  final Map<String, dynamic> dataPesanan;
  final Function onPilih;
  const RangkumanSesi(
      {super.key, required this.dataPesanan, required this.onPilih});

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
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.dataPesanan["image"]),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.dataPesanan["nama"],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    child: Wrap(
                      spacing: 7,
                      runSpacing: 10,
                      children: List.generate(
                        4,
                        (index) => Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Color(0xffF0F4FF),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 0.8, color: Color(0xff235347))),
                          child: Text(
                            index < 3
                                ? widget.dataPesanan["kategori"][index]
                                : "+ " +
                                    (widget.dataPesanan['kategori'].length - 3)
                                        .toString() +
                                    " Lainnya",
                            style: TextStyle(color: Colors.black, fontSize: 10),
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
                            ? Color(0xff235347)
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
                                    color: Color(0xff235347)),
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
                                  color: Color(0xff235347)),
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
              Text("Rp 200.000",
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
                onpressed: () => widget.onPilih(),
                borderRadius: 10.0,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
