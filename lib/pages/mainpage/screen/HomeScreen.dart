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
import 'package:taxi_app/services/MoodTrackerService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  Future<List<DokterModel>> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/data/dokter.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((data) => DokterModel.fromJson(data)).toList();
  }

  Future<List<dynamic>> loadJsonBlogData() async {
    String jsonString = await rootBundle.loadString('assets/data/blogs.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((data) => data).toList();
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

  Future loadPodcast() async {
    String jsonString = await rootBundle.loadString('assets/data/PupAss.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((data) => data).toList();
  }

  int point = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData().then((value) {
      setState(() {
        dokter = value.sublist(0, 4);
      });
    });
    loadJsonBlogData().then((value) {
      setState(() {
        blog = value;
      });
    });
    loadPodcast().then((value) {
      setState(() {
        podcast = value;
      });
    });

    loadPointToday();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            AppBarHome(
              searchController: searchController,
            ),
            EmojisCard(
              point: point,
            ),
            SizedBox(
              height: 5,
            ),
            CardTes(),
            SizedBox(
              height: 5,
            ),
            SlidePromo(),
            HomeSlidePsikolog(
              dokter: dokter,
            ),
            SizedBox(
              height: 5,
            ),
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
