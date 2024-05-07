import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/models/BookingModel.dart';
import 'package:taxi_app/utils/formatTanggal.dart';

class Berlangsung extends StatelessWidget {
  final List<BookingModel> listTransaksi;
  const Berlangsung({super.key, required this.listTransaksi});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: listTransaksi.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${formatTanggal(DateTime.parse(listTransaksi[index].date))}, ${listTransaksi[index].waktu}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: .5,
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  listTransaksi[index].dokter.fotoProfil),
                              fit: BoxFit.cover),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listTransaksi[index].dokter.nama,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(listTransaksi[index].dokter.ahli),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.39,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Batalkan",
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 230, 239, 236),
                            minimumSize: Size(double.infinity, 35)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Jadwalkan Ulang",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff173b34),
                            minimumSize: Size(double.infinity, 35)),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
