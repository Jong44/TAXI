import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/components/pages/pembayaranscreen/widgets/PembayaranAkhir.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/utils/formatRupiah.dart';

class Pembayaran extends StatefulWidget {
  final Map<String, dynamic> dataPesanan;
  final onpress;
  final int harga;
  const Pembayaran(
      {super.key,
      required this.dataPesanan,
      required this.onpress,
      required this.harga});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  List<Map<String, dynamic>> bankList = [
    {
      "image": "assets/banks/bca.png",
      "name": "BCA",
      "rekening": "Virtual Account"
    },
    {
      "image": "assets/banks/bni.png",
      "name": "BNI",
      "rekening": "Virtual Account"
    },
  ];

  int indexBank = 0;
  bool isPayment = false;

  int hours = 2;
  int minutes = 0;
  int seconds = 0;

  void startTimer() {
    const duration = Duration(seconds: 1);
    Timer.periodic(duration, (Timer timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          if (minutes > 0) {
            minutes--;
            seconds = 59;
          } else {
            if (hours > 0) {
              hours--;
              minutes = 59;
              seconds = 59;
            } else {
              timer.cancel();
            }
          }
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isPayment)
          PembayaranAkhir(
            bankImage: bankList[indexBank]['image'],
            bankName: bankList[indexBank]['name'],
            bankRekening: bankList[indexBank]['rekening'],
            harga: widget.harga,
            hours: hours,
            minutes: minutes,
            seconds: seconds,
          )
        else
          Container(
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
                Text("Layanan",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xffdddddd)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(7),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff253347),
                        ),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Reguler",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: List.generate(
                    bankList.length,
                    (index) => InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          indexBank = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: indexBank == index
                                ? Color(0xffEAF2FF)
                                : Colors.white,
                            border: indexBank == index
                                ? null
                                : Border.all(
                                    width: 1, color: Color(0xffdddddd)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  bankList[index]['image'],
                                  width: 70,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(bankList[index]['rekening'])
                              ],
                            ),
                            Icon(
                              Icons.check,
                              size: 20,
                              color: indexBank == index
                                  ? Color(0xff253347)
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: MainButton(
              title: "Lanjutkan",
              onpressed: () {
                if (isPayment) {
                  String bank = bankList[indexBank]['name'];
                  widget.onpress(bank);
                } else {
                  setState(() {
                    isPayment = true;
                  });
                  if (isPayment) {
                    startTimer();
                  }
                }
              },
              borderRadius: 10.0),
        ),
      ],
    );
  }
}
