import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taxi_app/components/pages/profilescreen/CardMenu.dart';
import 'package:taxi_app/components/pages/profilescreen/CardProfile.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/models/ProfileModel.dart';
import 'package:taxi_app/pages/moodtracker/ReviewMoodTracker.dart';
import 'package:taxi_app/pages/profiles/SettingProfileScreen.dart';
import 'package:taxi_app/services/AuthService.dart';
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
          "nama": "Mood Tracker",
          "path": ReviewMoodTracker(),
        },
      ],
    },
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
          "path": "Keluar",
        }
      ]
    }
  ];

  ProfileModel profile = ProfileModel(
    fullName: "",
    birthday: "",
    email: "",
    no_hp: "",
    gender: "",
    image_url: "",
  );

  Future<void> getProfile() async {
    ProfileService profileService = ProfileService();
    ProfileModel dataProfile = await profileService.getProfile();
    setState(() {
      profile = dataProfile;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CardProfile(profile: profile),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: List.generate(
                      menuProfile.length,
                      (indexMenu) => CardMenu(
                          menuProfile: menuProfile, indexMenu: indexMenu)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
