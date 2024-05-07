import 'package:flutter/material.dart';

class ReadProfile extends StatelessWidget {
  final nama;
  final tanggalLahir;
  final jenisKelamin;
  final nomorTelepon;
  final alamatEmail;
  const ReadProfile(
      {super.key,
      required this.nama,
      required this.tanggalLahir,
      required this.jenisKelamin,
      required this.nomorTelepon,
      required this.alamatEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama Lengkap",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Text(nama, style: TextStyle(fontSize: 13)),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Text(
            "Tanggal Lahir",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Text(tanggalLahir, style: TextStyle(fontSize: 13)),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Text(
            "Jenis Kelamin",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Text(jenisKelamin, style: TextStyle(fontSize: 13)),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Text(
            "Nomor Telepon",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Text(nomorTelepon, style: TextStyle(fontSize: 13)),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Text(
            "Alamat Email",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Text(alamatEmail, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
