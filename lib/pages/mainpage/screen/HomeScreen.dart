import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/components/global/MainInputText.dart';
import 'package:taxi_app/components/pages/homescreen/AppBarHome.dart';
import 'package:taxi_app/components/pages/homescreen/EmojisCard.dart';
import 'package:taxi_app/components/pages/homescreen/CardTes.dart';
import 'package:taxi_app/components/pages/homescreen/HomeBlogsSlide.dart';
import 'package:taxi_app/components/pages/homescreen/HomePodcastSlide.dart';
import 'package:taxi_app/components/pages/homescreen/HomeSlideDokter.dart';
import 'package:taxi_app/components/pages/homescreen/SlidePromo.dart';
import 'package:taxi_app/models/DokterModel.dart';
import 'package:taxi_app/services/ArtikelService.dart';
import 'package:taxi_app/services/DokterService.dart';
import 'package:taxi_app/services/MoodTrackerService.dart';
import 'package:taxi_app/services/PodcastService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  DokterService dokterService = DokterService();

  Future<List<DokterModel>> getDokter() async {
    return dokterService.getDokter();
  }

  List<DokterModel> dokter = [];
  List<dynamic> blog = [];
  List<dynamic> podcast = [];

  Future loadPointToday() async {
    MoodTrackerService moodTrackerService = MoodTrackerService();
    await moodTrackerService.getPointMoodTrackerToday().then((value) {
      setState(() {
        point = value;
      });
    });
  }

  int point = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPointToday();
    getDokter().then((value) {
      setState(() {
        dokter = value.sublist(0, 4);
      });
    });
    PodcastService().getPodcast().then((value) {
      setState(() {
        podcast = value;
      });
    });
    ArtikelService().getArtikel().then((value) {
      setState(() {
        blog = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (dokter.isEmpty || blog.isEmpty || podcast.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            AppBarHome(
              searchController: searchController,
            ),
            SizedBox(
              height: 10,
            ),
            EmojisCard(
              point: point,
            ),
            CardTes(),
            SizedBox(
              height: 15,
            ),
            HomeSlidePsikolog(
              dokter: dokter,
            ),
            SizedBox(
              height: 5,
            ),
            SlidePromo(),
            HomePodcastSlide(
              podcast: podcast,
            ),
            SizedBox(
              height: 5,
            ),
            HomeBlogSlide(
              blog: blog,
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
