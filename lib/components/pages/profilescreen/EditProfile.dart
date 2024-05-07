import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/services/ProfileServices.dart';

class EditProfile extends StatefulWidget {
  final nama;
  final tanggalLahir;
  final jenisKelamin;
  final nomorTelepon;
  final alamatEmail;
  const EditProfile(
      {super.key,
      required this.nama,
      required this.tanggalLahir,
      required this.jenisKelamin,
      required this.nomorTelepon,
      required this.alamatEmail});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController namaController = TextEditingController();
  List<String> tanggalLahir = ["", "", ""];
  int indexJenisKelamin = 0;
  TextEditingController nomorTeleponController = TextEditingController();
  TextEditingController alamatEmailController = TextEditingController();

  Map<String, dynamic> data = {
    "nama": "",
    "tanggalLahir": "",
    "jenisKelamin": "",
    "nomorTelepon": "",
    "alamatEmail": "",
    "fotoProfil": "",
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      namaController.text = widget.nama;
      tanggalLahir = widget.tanggalLahir != ""
          ? widget.tanggalLahir.split(" / ")
          : ["", "", ""];
      indexJenisKelamin = widget.jenisKelamin == "Laki-laki" ? 0 : 1;
      nomorTeleponController.text = widget.nomorTelepon;
      alamatEmailController.text = widget.alamatEmail;
    });
  }

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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.1),
            ),
            height: 40,
            child: TextField(
              controller: namaController,
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: "John Doe",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Tanggal Lahir",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      tanggalLahir[0] = value;
                    });
                  },
                  style: TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: "TT",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      tanggalLahir[1] = value;
                    });
                  },
                  style: TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: "MM",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      tanggalLahir[2] = value;
                      print(tanggalLahir);
                    });
                  },
                  style: TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: "YYYY",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Jenis Kelamin",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    indexJenisKelamin = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.36,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1),
                    border: Border.all(
                      color: indexJenisKelamin == 0
                          ? Color(0xff174A41)
                          : Colors.transparent,
                    ),
                  ),
                  height: 40,
                  child: Text("Laki-laki", style: TextStyle(fontSize: 13)),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    indexJenisKelamin = 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.36,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.1),
                      border: Border.all(
                        color: indexJenisKelamin == 1
                            ? Color(0xff174A41)
                            : Colors.transparent,
                      )),
                  height: 40,
                  child: Text("Perempuan", style: TextStyle(fontSize: 13)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Nomor Telepon",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.1),
            ),
            height: 40,
            child: TextField(
              controller: nomorTeleponController,
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: "012312313",
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.1),
            ),
            height: 40,
            child: TextField(
              controller: alamatEmailController,
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: "John Doe",
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MainButton(
            title: "Simpan",
            onpressed: () {
              setState(() {
                data["nama"] = namaController.text;
                data["tanggalLahir"] =
                    "${tanggalLahir[0]} / ${tanggalLahir[1]} / ${tanggalLahir[2]}";
                data["jenisKelamin"] =
                    indexJenisKelamin == 0 ? "Laki-laki" : "Perempuan";
                data["nomorTelepon"] = nomorTeleponController.text;
                data["alamatEmail"] = alamatEmailController.text;
                data["fotoProfil"] = "";
              });

              ProfileService().saveData(data);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Data berhasil disimpan"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            borderRadius: 10.0,
          ),
        ],
      ),
    );
  }
}
