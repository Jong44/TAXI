import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/DashedDivider.dart';
import 'package:taxi_app/utils/formatTanggal.dart';

class DetailBlog extends StatelessWidget {
  final Map blog;
  const DetailBlog({super.key, required this.blog});

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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  blog['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(blog['image']),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  formatTanggal(blog['createdAt']),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  blog['content'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DashedDivider(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
