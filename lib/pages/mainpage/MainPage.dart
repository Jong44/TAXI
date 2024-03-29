import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/fluent_emoji_high_contrast.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:taxi_app/pages/mainpage/screen/HomeScreen.dart';
import 'package:taxi_app/pages/mainpage/screen/ChatbotScreen.dart';
import 'package:taxi_app/pages/mainpage/screen/DokterScreen.dart';
import 'package:taxi_app/pages/mainpage/screen/ProfileScreen.dart';
import 'package:taxi_app/pages/mainpage/screen/TransaksiScreen.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexScreen = 0;
  List Menu = [
    {
      "title": "Home",
      "icon": Icon(Icons.home),
    },
    {
      "title": "Dokter",
      "icon": Iconify(Healthicons.call_centre),
    },
    {
      "title": "Chatbot",
      "icon": Iconify(FluentEmojiHighContrast.a_button_blood_type),
    },
    {
      "title": "Transaksi",
      "icon": Iconify(Mdi.chart_box),
    },
    {
      "title": "Profile",
      "icon": Icon(Icons.person),
    },
  ];

  List ListScreen = [
    HomeScreen(),
    DokterScreen(),
    ChatbotScreen(),
    TransaksiScreen(),
    ProfileScreen(),
  ];

  void handleChangeScreen(index) {
    setState(() {
      indexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListScreen[indexScreen],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: ListScreen.length,
            itemExtent: 73,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  handleChangeScreen(index);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Menu[index]['icon'],
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Menu[index]['title'],
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
