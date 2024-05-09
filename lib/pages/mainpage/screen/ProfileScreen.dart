import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taxi_app/models/ProfileModel.dart';
import 'package:taxi_app/pages/profiles/SettingProfileScreen.dart';
import 'package:taxi_app/services/ProfileServices.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List menuProfile = [
    {
      "listMenu": [
        {
          "nama": "Pusat Bantuan",
        },
        {
          "nama": "Tentang",
        }
      ]
    },
    {
      "listMenu": [
        {
          "nama": "Notifikasi",
        },
        {
          "nama": "Bahasa",
        },
        {
          "nama": "Keamanan Akun",
        },
        {
          "nama": "Keluar",
        }
      ]
    }
  ];

  ProfileModel profile = ProfileModel(
      nama: "example",
      tanggalLahir: "",
      jenisKelamin: "",
      nomorTelepon: "1123123213",
      alamatEmail: "",
      fotoProfil: "");

  Future<void> getProfile() async {
    ProfileService profileService = ProfileService();
    String data = await profileService.getData();
    Map<String, dynamic> dataProfile = jsonDecode(data);
    ProfileModel profileModel = ProfileModel.fromJson(dataProfile);
    setState(() {
      profile = profileModel;
    });
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingProfileScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 30,
                          backgroundImage: AssetImage('assets/dokter1.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.nama,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                profile.nomorTelepon,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[500]),
                              ),
                            ])
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: List.generate(
                    menuProfile.length,
                    (indexMenu) => Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          menuProfile[indexMenu]['listMenu'].length,
                          (indexSubMenu) => Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    menuProfile[indexMenu]['listMenu']
                                        [indexSubMenu]['nama'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        height: 2,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  )
                                ],
                              ),
                              if (indexSubMenu <
                                  menuProfile[indexMenu]['listMenu'].length - 1)
                                Divider(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
