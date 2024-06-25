import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/raphael.dart';
import 'package:taxi_app/components/pages/profilescreen/EditProfile.dart';
import 'package:taxi_app/components/pages/profilescreen/ReadProfile.dart';
import 'package:taxi_app/components/pages/profilescreen/SetMediaProfile.dart';
import 'package:taxi_app/config/ColorConfig.dart';
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
    fullName: "",
    birthday: "",
    email: "",
    no_hp: "=",
    gender: "",
    image_url: "",
  );
  File image = File("");

  Future<void> getProfile() async {
    ProfileService profileService = ProfileService();
    final data = await profileService.getProfile();
    setState(() {
      profile = data;
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
    if (profile.fullName == "") {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
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
                          image: image.path != ""
                              ? DecorationImage(
                                  image: FileImage(image), fit: BoxFit.cover)
                              : DecorationImage(
                                  image: NetworkImage(profile.image_url),
                                  fit: BoxFit.cover),
                        ),
                      ),
                      isEdit
                          ? Positioned(
                              bottom: 5,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return setMediaProfile().build(
                                            context, image, (File image) {
                                          setState(() {
                                            this.image = image;
                                          });
                                        });
                                      });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConfig.primaryColor,
                                  ),
                                  child: Iconify(
                                    Mdi.camera_plus_outline,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ))
                          : SizedBox()
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
                      color: ColorConfig.primaryColor,
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
                        nama: profile.fullName,
                        tanggalLahir: profile.birthday,
                        jenisKelamin: profile.gender,
                        nomorTelepon: profile.no_hp,
                        alamatEmail: profile.email,
                        image: image,
                      )
                    : ReadProfile(
                        nama: profile.fullName,
                        tanggalLahir: profile.birthday,
                        jenisKelamin: profile.gender,
                        nomorTelepon: profile.no_hp,
                        alamatEmail: profile.email,
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
