import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/components/global/CardBlog.dart';
import 'package:taxi_app/components/global/MainInputText.dart';
import 'package:taxi_app/components/pages/blogscreen/CardBlogLarge.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/pages/blogs/DetailBlog.dart';
import 'package:taxi_app/services/ArtikelService.dart';

class ListBlogScreen extends StatefulWidget {
  const ListBlogScreen({super.key});

  @override
  State<ListBlogScreen> createState() => _ListBlogScreenState();
}

class _ListBlogScreenState extends State<ListBlogScreen> {
  ArtikelService artikelService = ArtikelService();
  final searchController = TextEditingController();
  List<String> kategori = [
    "Semua",
    "Kesehatan Mental",
    "Remaja",
    "Keluarga",
    "Pendidikan",
  ];
  int indexKategori = 0;

  List blog = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    artikelService.getArtikel().then((value) {
      setState(() {
        blog = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Artikel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: MainInputText(
                      backgroundColor: Color(0xffF5F5F5),
                      prefixIcon: Icon(Icons.search),
                      placeholder: "Search",
                      inputController: searchController),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: kategori.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                indexKategori = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: indexKategori == index
                                    ? ColorConfig.primaryColor
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  kategori[index],
                                  style: TextStyle(
                                    color: indexKategori == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Trending",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 175,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: blog.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailBlog(
                                              blog: blog[index],
                                            )));
                              },
                              child: CardBlog(
                                title: blog[index]['title'],
                                image: blog[index]['image'],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Cocok Untuk Kamu Baca",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: List.generate(
                    blog.length,
                    (index) => InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailBlog(
                                      blog: blog[index],
                                    )));
                      },
                      child: CardBlogLarge(
                        title: blog[index]['title'],
                        image: blog[index]['image'],
                        isi: blog[index]['content'],
                        date: blog[index]['createdAt'],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
