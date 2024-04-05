import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainInputText.dart';
import 'package:taxi_app/components/pages/dokterscreen/ListViewDokter.dart';
import 'package:taxi_app/components/pages/dokterscreen/SliderFastPsikolog.dart';

class DokterScreen extends StatefulWidget {
  const DokterScreen({super.key});

  @override
  State<DokterScreen> createState() => _DokterScreenState();
}

class _DokterScreenState extends State<DokterScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 70,
          ),
          MainInputText(
              backgroundColor: Color(0xffF5F5F5),
              prefixIcon: Icon(Icons.search),
              placeholder: "Search",
              inputController: searchController),
          SizedBox(
            height: 50,
          ),
          SliderFastPsikolog(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Dokter Buat Kamu",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Konsultasikan dengan dokter spesialis",
            style: TextStyle(fontSize: 11),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 600,
            child: ListViewDokter(),
          )
        ],
      ),
    );
  }
}
