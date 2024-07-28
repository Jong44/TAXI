import 'package:flutter/material.dart';

class SlidePromo extends StatelessWidget {
  const SlidePromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Spesial untuk Kamu!",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 130,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 280,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("assets/promo.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
