import 'package:flutter/material.dart';

class CardBlogLarge extends StatelessWidget {
  final title;
  final image;
  final isi;
  const CardBlogLarge(
      {super.key, required this.title, required this.image, required this.isi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(right: 20, bottom: 10),
      height: 270,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "15 Januari 2021",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            isi,
            maxLines: 3,
            style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(26, 27, 31, 0.72),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300),
            ),
          )
        ],
      ),
    );
  }
}
