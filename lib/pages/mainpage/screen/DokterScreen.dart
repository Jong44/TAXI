import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/components/global/MainInputText.dart';
import 'package:taxi_app/components/pages/dokterscreen/ListViewDokter.dart';
import 'package:taxi_app/components/pages/dokterscreen/SliderFastPsikolog.dart';
import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/pages/search_dokter/search_page.dart';
import 'package:taxi_app/services/DokterService.dart';

class DokterScreen extends StatefulWidget {
  const DokterScreen({super.key});

  @override
  State<DokterScreen> createState() => _DokterScreenState();
}

class _DokterScreenState extends State<DokterScreen> {
  TextEditingController searchController = TextEditingController();
  DokterService dokterService = DokterService();

  Future<List<DokterModel>> getDokter() async {
    return dokterService.getDokter();
  }

  List<DokterModel> dokterTercepat = [];
  List<DokterModel> dokterDisarankan = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDokter().then((value) {
      setState(() {
        dokterTercepat = value.sublist(0, 4);
        dokterDisarankan = value.sublist(4, 9);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (dokterTercepat.isEmpty || dokterDisarankan.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => search_page())),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Cari Dokter", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 50,
                ),
                SliderFastPsikolog(
                  dokterList: dokterTercepat,
                ),
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
                ListViewDokter(
                  dokterList: dokterDisarankan,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
