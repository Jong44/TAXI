import 'package:flutter/material.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/utils/formatRupiah.dart';

class PembayaranAkhir extends StatelessWidget {
  final int hours;
  final int minutes;
  final int seconds;
  final String bankImage;
  final String bankName;
  final String bankRekening;
  final int harga;
  const PembayaranAkhir(
      {super.key,
      required this.bankImage,
      required this.bankName,
      required this.bankRekening,
      required this.harga,
      required this.hours,
      required this.minutes,
      required this.seconds});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Selesaikan Pembayaran dalam",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: BoxDecoration(
                        color: ColorConfig.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "${hours.toString()}",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                  Text(" : "),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: BoxDecoration(
                        color: ColorConfig.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "${minutes.toString()}",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                  Text(" : "),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: BoxDecoration(
                        color: ColorConfig.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "${seconds.toString()}",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                color: Color(0xffEAF2FF),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      bankImage,
                      width: 70,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(bankRekening)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Nomor Virtual Account",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1234567890',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Salin",
                    style: TextStyle(
                        color: Color(0xff007AFF), fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          Text("Nomor Virtual Account",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          SizedBox(
            height: 10,
          ),
          Text(formatRupiah(harga),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ],
      ),
    );
  }
}
