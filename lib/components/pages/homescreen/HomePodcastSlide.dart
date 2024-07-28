import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/pages/detailpodcast/DetailPodcast.dart';

class HomePodcastSlide extends StatelessWidget {
  final List podcast;
  const HomePodcastSlide({super.key, required this.podcast});

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
                "Untuk Kamu",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              TextButton(
                onPressed: () {},
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
            height: 170,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: podcast.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPodcast(
                                        podcast: podcast[index],
                                      )));
                        },
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            podcast[index]['image']),
                                        fit: BoxFit.fill)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      podcast[index]['title'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Podcast",
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                        Text(
                                          "10m",
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
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
