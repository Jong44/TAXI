import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:taxi_app/config/ColorConfig.dart';

class RiwayatDokter extends StatelessWidget {
  final String nama;
  final String ahli;
  final List pendidikan;
  final int sipp;
  final List kategori;
  const RiwayatDokter(
      {super.key,
      required this.kategori,
      required this.nama,
      required this.ahli,
      required this.pendidikan,
      required this.sipp});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nama,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Icon(
              CupertinoIcons.chevron_down,
              color: Colors.black,
              size: 15,
            )
          ],
        ),
        Text(
          ahli,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          children: List.generate(
            kategori.length,
            (index) => Container(
              margin: EdgeInsets.only(right: 5, top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                kategori[index],
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Iconify(
              Mdi.graduation_cap,
              color: ColorConfig.primaryColor,
              size: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pendidikan",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    pendidikan.length,
                    (index) => Text(
                      pendidikan[index],
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Iconify(
              Mdi.shield_check,
              color: ColorConfig.primaryColor,
              size: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No Izin Praktik",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "SIPP : $sipp",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
