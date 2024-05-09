import 'package:flutter/material.dart';

class CardBlog extends StatelessWidget {
  final title;
  final image;

  const CardBlog({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: 260,
        height: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  color: Colors.grey.shade300),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ));
  }
}
