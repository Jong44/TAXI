import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/components/pages/transaksi/Berlangsung.dart';
import 'package:taxi_app/components/pages/transaksi/Dibatalkan.dart';
import 'package:taxi_app/components/pages/transaksi/Selesai.dart';
import 'package:taxi_app/models/BookingModel.dart';
import 'package:taxi_app/services/BookingService.dart';
import 'package:taxi_app/utils/formatTanggal.dart';

class TransaksiScreen extends StatefulWidget {
  const TransaksiScreen({super.key});

  @override
  State<TransaksiScreen> createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  List<Map<String, dynamic>> listTransaksi = [];

  Future<void> getTransaksi() async {
    BookingService bookingService = BookingService();
    List<Map<String, dynamic>> list =
        await bookingService.getRiwayatTransaksi();
    setState(() {
      listTransaksi = list;
    });
    print(listTransaksi);
  }

  int indexMenu = 0;

  List menu = ['Berlangsung', 'Selesai', 'Dibatalkan'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTransaksi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(
              child: Text(
            'Riwayat Transaksi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                menu.length,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      indexMenu = index;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 40,
                    decoration: BoxDecoration(
                      border: indexMenu == index
                          ? Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            )
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        menu[index],
                        style: TextStyle(
                            fontSize: 14,
                            color: indexMenu == index
                                ? Colors.black
                                : Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (indexMenu == 0)
            Berlangsung(listTransaksi: listTransaksi)
          else if (indexMenu == 1)
            Selesai()
          else
            Dibatalkan()
        ],
      ),
    ));
  }
}
