import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taxi_app/components/pages/pembayaranscreen/Pembayaran.dart';
import 'package:taxi_app/components/pages/pembayaranscreen/RangkumanSesi.dart';
import 'package:taxi_app/components/pages/pembayaranscreen/SelesaiPembayaran.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/models/BookingModel.dart';
import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/models/ProfileModel.dart';
import 'package:taxi_app/services/BookingService.dart';
import 'package:taxi_app/services/ProfileServices.dart';

class PembayaranScreen extends StatefulWidget {
  final Map<String, dynamic> dataPesanan;
  final DokterModel dokter;
  const PembayaranScreen(
      {super.key, required this.dataPesanan, required this.dokter});

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  List<String> tabList = ["Rangkuman Sesimu", "Pembayaran", "Selesai"];
  int indexTab = 0;
  Map<String, dynamic> dataBook = {};
  String userUid = "";
  ProfileService profileService = ProfileService();

  Future<void> tambahRiwayatTransaksi(BookingModel book) async {
    BookingService bookingService = BookingService();
    await bookingService.tambahRiwayatTransaksi(book);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileService.getUid().then((value) {
      setState(() {
        userUid = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (indexTab == 0) {
              Navigator.pop(context);
            } else {
              setState(() {
                indexTab -= 1;
              });
            }
          },
        ),
        title: Text(tabList[indexTab],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    tabList.length,
                    (index) => Container(
                      width: 110,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: indexTab == index
                                    ? ColorConfig.primaryColor
                                    : ColorConfig.primaryColor.withOpacity(0.4),
                                shape: BoxShape.circle),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            tabList[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: indexTab == index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              indexTab == 0
                  ? RangkumanSesi(
                      nama: widget.dokter.fullname,
                      fotoProfil: widget.dokter.image_url,
                      kategori: widget.dokter.category,
                      harga: widget.dokter.price,
                      dataPesanan: widget.dataPesanan,
                      onPilih: (Map<String, dynamic> data) {
                        setState(() {
                          dataBook = data;
                          indexTab += 1;
                        });
                      },
                    )
                  : indexTab == 1
                      ? Pembayaran(
                          harga: widget.dokter.price,
                          dataPesanan: widget.dataPesanan,
                          onpress: (String metodePembayaran) {
                            setState(() {
                              BookingModel book = BookingModel(
                                  date: widget.dataPesanan['date'],
                                  waktu: widget.dataPesanan['waktu'],
                                  layanan: widget.dataPesanan['layanan'],
                                  dokterUid: widget.dokter.uid,
                                  userUid: userUid,
                                  durasi: widget.dataPesanan['durasi'] ?? 0,
                                  mediaKonseling:
                                      widget.dataPesanan['mediaKonseling'] ??
                                          "",
                                  metodePembayaran: metodePembayaran ?? "");
                              tambahRiwayatTransaksi(book);
                              indexTab += 1;
                            });
                          },
                        )
                      : SelesaiPembayaran(),
            ],
          ),
        ),
      ),
    );
  }
}
