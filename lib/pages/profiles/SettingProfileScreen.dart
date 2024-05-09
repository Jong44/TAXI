import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/raphael.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:taxi_app/components/pages/profilescreen/EditProfile.dart';
import 'package:taxi_app/components/pages/profilescreen/ReadProfile.dart';
import 'package:taxi_app/models/ProfileModel.dart';
import 'package:taxi_app/services/ProfileServices.dart';

class SettingProfileScreen extends StatefulWidget {
  const SettingProfileScreen({super.key});

  @override
  State<SettingProfileScreen> createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends State<SettingProfileScreen> {
  bool isEdit = false;
  ProfileModel profile = ProfileModel(
      nama: "",
      tanggalLahir: "",
      jenisKelamin: "",
      nomorTelepon: "",
      alamatEmail: "",
      fotoProfil: "");

  Future<void> getProfile() async {
    ProfileService profileService = ProfileService();
    String data = await profileService.getData();
    if (data != '') {
      Map<String, dynamic> dataProfile = jsonDecode(data);
      ProfileModel profileModel = ProfileModel.fromJson(dataProfile);
      setState(() {
        profile = profileModel;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Info Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/dokter1.png"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 10,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff174A41),
                              ),
                              child: Iconify(
                                Mdi.camera_plus_outline,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Iconify(
                      Raphael.edit,
                      color: Color(0xff174A41),
                      size: 20,
                    ),
                    onPressed: () {
                      getProfile();
                      setState(() {
                        isEdit = !isEdit;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                isEdit
                    ? EditProfile(
                        nama: profile.nama,
                        tanggalLahir: profile.tanggalLahir,
                        jenisKelamin: profile.jenisKelamin,
                        nomorTelepon: profile.nomorTelepon,
                        alamatEmail: profile.alamatEmail,
                      )
                    : ReadProfile(
                        nama: profile.nama,
                        tanggalLahir: profile.tanggalLahir,
                        jenisKelamin: profile.jenisKelamin,
                        nomorTelepon: profile.nomorTelepon,
                        alamatEmail: profile.alamatEmail,
                      ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
