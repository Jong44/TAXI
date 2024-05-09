import 'package:flutter/material.dart';
import 'package:taxi_app/pages/riwayat_transaksi/riwayat.dart';
import 'package:taxi_app/pages/teskesehatan/skor.dart';

class pembayaran3 extends StatelessWidget {
  const pembayaran3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (context) => skor(
                          jumlahPoint: 1,
                        )));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Pembayaran",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                "assets/bayarr.png",
                width: 300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/centang.png",
                      width: 120,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Transaksi Berhasil !",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  Text("Pembayaran Berhasil Dilakukan"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nomor Transaksi",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("00000000000"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Metode Pembayaran",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("BCA Virtual-Acc")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Waktu Pembayaran",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("00-00-0000, 00:00")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nama",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("Albireo Finoe")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Detail Sesi",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("00-00-0000, 00:00, Albireo")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jumlah Pembayaran",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("Rp 50.000")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => riwayat()));
              },
              child: Text(
                "Lanjutkan",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff173b34),
                  minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
