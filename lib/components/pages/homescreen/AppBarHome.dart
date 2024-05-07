import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainInputText.dart';
import 'package:taxi_app/pages/notifikasi/notif.dart';

class AppBarHome extends StatelessWidget {
  final searchController;
  const AppBarHome({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/logo_lanscape.png",
            width: 160,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => notif()));
              },
              icon: Icon(
                Icons.notifications,
                color: Color(0xff235347),
              )),
        ],
      ),
    );
  }
}
