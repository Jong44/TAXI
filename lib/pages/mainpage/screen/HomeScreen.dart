import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainInputText.dart';
import 'package:taxi_app/components/pages/homescreen/AppBarHome.dart';
import 'package:taxi_app/components/pages/homescreen/EmojisCard.dart';
import 'package:taxi_app/components/pages/homescreen/CardTes.dart';
import 'package:taxi_app/components/pages/homescreen/HomePodcastSlide.dart';
import 'package:taxi_app/components/pages/homescreen/HomeSlideDokter.dart';
import 'package:taxi_app/components/pages/homescreen/SlidePromo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  int point = 1;

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
            SizedBox(
              height: 10,
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
            HomeSlidePsikolog(),
            SizedBox(
              height: 5,
            ),
            HomePodcastSlide(),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
