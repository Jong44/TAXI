import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/CardBlog.dart';
import 'package:taxi_app/pages/blogs/DetailBlog.dart';
import 'package:taxi_app/pages/blogs/ListBlogScreen.dart';

class HomeBlogSlide extends StatelessWidget {
  final blog;
  const HomeBlogSlide({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Artikel",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListBlogScreen()));
                },
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff173b34)),
                ),
              )
            ],
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
                            image: blog[index]['image']),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
