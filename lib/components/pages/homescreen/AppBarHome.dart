import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/MainInputText.dart';

class AppBarHome extends StatelessWidget {
  final searchController;
  const AppBarHome({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 45),
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff235347), Color(0xff153832)])),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi, Tanjung",
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.notifications,
                    color: Color(0xff173b34),
                    size: 18,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 13,
            ),
            MainInputText(
                prefixIcon: Icon(Icons.search),
                placeholder: "Search",
                inputController: searchController)
          ],
        ));
  }
}
