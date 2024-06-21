import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/components/global/TextFieldMain.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/pages/auth/LoginScreen.dart';
import 'package:taxi_app/services/AuthService.dart';
import 'package:taxi_app/utils/formatKapital.dart';

class RegisProfileScreen extends StatefulWidget {
  final Map data;
  const RegisProfileScreen({super.key, required this.data});

  @override
  State<RegisProfileScreen> createState() => _RegisProfileScreenState();
}

class _RegisProfileScreenState extends State<RegisProfileScreen> {
  List _listKabupaten = [];
  List _gender = ["Laki-laki", "Perempuan"];

  TextEditingController phone = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController bulan = TextEditingController();
  TextEditingController tahun = TextEditingController();
  String gender = "";
  String kabupaten = "";

  Future<List> getKabupaten() async {
    final response = await rootBundle.loadString('assets/data/kabupaten.json');
    final data = await json.decode(response);
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKabupaten().then((value) {
      setState(() {
        _listKabupaten = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Jeis Kelamin",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(_gender.length, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            gender = _gender[index];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: EdgeInsets.all(7),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: gender == _gender[index]
                                      ? ColorConfig.primaryColor
                                      : Colors.grey[200],
                                ),
                                child: Iconify(
                                  _gender[index] == "Laki-laki"
                                      ? Fa.male
                                      : Fa.female,
                                  color: gender == _gender[index]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _gender[index],
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Tanggal Lahir",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldMain(
                        placeholder: "Tanggal",
                        controller: tanggal,
                        type: TextInputType.number,
                        color: Colors.grey[200]!,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFieldMain(
                        placeholder: "Bulan",
                        controller: bulan,
                        type: TextInputType.number,
                        color: Colors.grey[200]!,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFieldMain(
                        placeholder: "Tahun",
                        controller: tahun,
                        type: TextInputType.number,
                        color: Colors.grey[200]!,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Lokasi Anda",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: Text(
                        kabupaten == ""
                            ? "Pilih Kabupaten"
                            : formatKapital(kabupaten),
                        style: const TextStyle(fontSize: 14)),
                    items: _listKabupaten.map((e) {
                      return DropdownMenuItem(
                        child: Text(formatKapital(e['name']),
                            style: const TextStyle(fontSize: 14)),
                        value: e['name'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        kabupaten = value.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Nomor Handphone",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldMain(
                  placeholder: "6212356789",
                  controller: phone,
                  type: TextInputType.number,
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: MainButton(
                    title: "Simpan",
                    onpressed: () {
                      String birthday =
                          tahun.text + "-" + bulan.text + "-" + tanggal.text;

                      final response = AuthService()
                          .registerWithEmailAndPassword(
                              widget.data['email'],
                              widget.data['password'],
                              widget.data['fullName'],
                              gender,
                              birthday,
                              phone.text);
                      if (response == "success") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(response.toString()),
                        ));
                      }
                    },
                    borderRadius: 50.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
