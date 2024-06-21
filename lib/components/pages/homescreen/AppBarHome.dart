import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:taxi_app/components/global/MainInputText.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/pages/notifikasi/notif.dart';

class AppBarHome extends StatelessWidget {
  final searchController;
  const AppBarHome({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/taca/logo_lanscape.png",
            width: 130,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => notif()));
              },
              icon: Iconify(
                Ci.notification,
                color: ColorConfig.primaryColor,
              )),
        ],
      ),
    );
  }
}
