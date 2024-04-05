import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:taxi_app/components/global/OnlineStatus.dart';

class ListViewDokter extends StatelessWidget {
  const ListViewDokter({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Marisca Kusuma",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    OnlineStatus(),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Keluarga, Percintaan, Keadaan Emosi, 3 Lainnya",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 73,
                      height: 23,
                      decoration: BoxDecoration(
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Iconify(
                            MaterialSymbols.work_history,
                            size: 13,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "3 Tahun",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Rp. 80.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xff173b34),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Profile",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ))
              ]),
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}
