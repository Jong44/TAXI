import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/fluent_emoji_high_contrast.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/pages/auth/LoginScreen.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
  int indexScreen = 0;
  List Menu = [
    {
      "title": "Home",
      "icon": Icon(
        Icons.home,
        color: Color(0x000000).withOpacity(0.4),
      ),
      "iconActive": Icon(
        Icons.home,
        color: ColorConfig.primaryColor,
      ),
    },
    {
      "title": "Konsul",
      "icon": Iconify(
        Healthicons.call_centre,
        color: Color(0x000000).withOpacity(0.4),
      ),
      "iconActive": Iconify(
        Healthicons.call_centre,
        color: ColorConfig.primaryColor,
      ),
    },
    {
      "title": "Chatbot",
      "icon": Iconify(Mdi.robot, color: Color(0x000000).withOpacity(0.4)),
      "iconActive": Iconify(Mdi.robot, color: ColorConfig.primaryColor),
    },
    {
      "title": "Transaksi",
      "icon": Iconify(Mdi.chart_box, color: Color(0x000000).withOpacity(0.4)),
      "iconActive": Iconify(Mdi.chart_box, color: ColorConfig.primaryColor),
    },
    {
      "title": "Profile",
      "icon": Icon(Icons.person, color: Color(0x000000).withOpacity(0.4)),
      "iconActive": Icon(Icons.person, color: ColorConfig.primaryColor),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Exit App'),
              content: Text('Kamu yakin ingin keluar?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Tidak'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Ya'),
                ),
              ],
            );
          },
        );
        return false;
      },
      child: Scaffold(
        body: ListScreen[indexScreen],
        bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: 63,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  Menu.length,
                  (index) => InkWell(
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          handleChangeScreen(index);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            indexScreen == index
                                ? Menu[index]['iconActive']
                                : Menu[index]['icon'],
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              Menu[index]['title'],
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      )),
            )),
      ),
    );
  }
}
