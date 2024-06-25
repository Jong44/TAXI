import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/components/pages/dokterscreen/ListViewDokter.dart';
import 'package:taxi_app/models/DokterModel.dart';

class ListSearchPage extends StatefulWidget {
  final String params;
  final List<dynamic> listKategoriParams;
  const ListSearchPage(
      {super.key, required this.params, required this.listKategoriParams});

  @override
  State<ListSearchPage> createState() => _ListSearchPageState();
}

class _ListSearchPageState extends State<ListSearchPage> {
  Future<List<DokterModel>> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/data/dokter.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((data) => DokterModel.fromJson(data)).toList();
  }

  List<DokterModel> dokteList = [];

  void handleFilterDokter() {
    List<DokterModel> dokterFilter = dokteList.where((element) {
      bool namaMatch = true;
      bool kategoriMatch = true;

      // Check if nama (name) should be filtered
      if (widget.params.isNotEmpty) {
        namaMatch = element.fullname
            .toLowerCase()
            .contains(widget.params.toLowerCase());
      }

      // Check if kategori (category) should be filtered
      if (widget.listKategoriParams.isNotEmpty) {
        // Check if any kategori in widget.listKategoriParams matches any kategori in element.kategori
        kategoriMatch = element.category.any((kategori) =>
            widget.listKategoriParams.any((filterKategori) =>
                kategori.toLowerCase().contains(filterKategori.toLowerCase())));
      }

      // Include only elements that match both nama and kategori conditions
      return namaMatch && kategoriMatch;
    }).toList();

    setState(() {
      dokteList = dokterFilter;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.listKategoriParams);
    loadJsonData().then((value) {
      setState(() {
        dokteList = value;
        handleFilterDokter();
      });
      print(dokteList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Search Dokter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: ListViewDokter(
                    dokterList: dokteList,
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
