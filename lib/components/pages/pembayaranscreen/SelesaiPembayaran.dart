import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/DashedDivider.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/components/global/TextBetween.dart';
import 'package:taxi_app/pages/mainpage/MainPage.dart';

class SelesaiPembayaran extends StatelessWidget {
  const SelesaiPembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffdddddd)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffB4DBFF).withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xff253347), shape: BoxShape.circle),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Transaksi Berhasil !",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 5,
              ),
              Text("Pembayaran berhasil dilakukan",
                  style: TextStyle(fontSize: 13)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: DashedDivider()),
              TextBetween(
                leftText: "Nomor Transaksi",
                rightText: "TAXI-0000001",
              ),
              TextBetween(
                leftText: "Metode Pembayaran",
                rightText: "BCA - Virtual Account",
              ),
              TextBetween(
                leftText: "Waktu Pembayaran",
                rightText: "15-01-2004 12:00:00",
              ),
              TextBetween(
                leftText: "Nama",
                rightText: "Tanjung",
              ),
              TextBetween(
                leftText: "Detail Sesi",
                rightText: "17-01-2004, 12:00, Marisca",
              ),
              TextBetween(
                leftText: "Jumlah Pemmbayaran",
                rightText: "Rp. 50.000",
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: MainButton(
              title: "Selesai",
              onpressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              borderRadius: 10.0),
        )
      ],
    );
  }
}
