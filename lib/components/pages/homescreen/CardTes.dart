import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainButton.dart';

class CardTes extends StatelessWidget {
  const CardTes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(142, 255, 198, 0.31),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Warna dan opasitas bayangan
            spreadRadius: 3, // Penyebaran bayangan
            blurRadius: 10, // Blur bayangan
            offset: Offset(0, 3), // Perpindahan bayangan (x, y)
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Cek Kondisi Kesehatan Mentalmu Yuk!",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Ikuti tes ini untuk mengetahuinya",
            style: TextStyle(fontSize: 11, color: Color.fromRGBO(0, 0, 0, 0.7)),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                "assets/person_dokter.png",
                width: 120,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                width: 100,
                height: 35,
                child: MainButton(
                  borderRadius: 50.0,
                  title: "Mulai",
                  onpressed: () {},
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
