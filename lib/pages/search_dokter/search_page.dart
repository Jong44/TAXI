import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_app/pages/notifikasi/notif.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  List kategori = [
    {"kategori": "Kecemasan", "status": false},
    {"kategori": "Panik", "status": false},
    {"kategori": "Percintaan", "status": false},
    {"kategori": "Depresi", "status": false},
    {"kategori": "Keluarga", "status": false},
    {"kategori": "Kecanduan", "status": false},
    {"kategori": "Trauma", "status": false},
    {"kategori": "Pengembangan Diri", "status": false},
    {"kategori": "Stress", "status": false},
    {"kategori": "Pekerjaan", "status": false},
    {"kategori": "Seksualitas", "status": false},
    {"kategori": "Kendali Emosi", "status": false},
    {"kategori": "ADHD", "status": false},
  ];

  TextEditingController search_control = TextEditingController();

  int jumlahStatusTrue = 0;

  void handleChangeStatus(index) {
    setState(() {
      kategori[index]['status'] = !kategori[index]['status'];
    });
    handleHitung(kategori[index]['status']);
  }

  void handleHitung(status) {
    setState(() {
      if (status) {
        jumlahStatusTrue += 1;
      } else {
        jumlahStatusTrue -= 1;
      }

      print(jumlahStatusTrue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                      child: TextField(
                    controller: search_control,
                    onChanged: ((value) {
                      setState(() {
                        search_control.text = value;
                      });
                    }),
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search"),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: List.generate(
                  kategori.length,
                  (index) => InkWell(
                        onTap: () {
                          handleChangeStatus(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kategori[index]['status']
                                  ? Color(0xff235347)
                                  : Color(0xffdddddd),
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            kategori[index]['kategori'],
                            style: TextStyle(
                                color: kategori[index]['status']
                                    ? Color(0xffffffff)
                                    : Color(0xff000000),
                                fontSize: 13),
                          ),
                        ),
                      )),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => notif()));
                },
                child: Text(
                  "Next Page",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff173b34),
                    minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Lanjutkan",
              style: TextStyle(
                  color: jumlahStatusTrue > 0 || search_control.text != ""
                      ? Color(0xffffffff)
                      : Color(0xff000000))),
          style: ElevatedButton.styleFrom(
              backgroundColor: jumlahStatusTrue > 0 || search_control.text != ""
                  ? Color(0xff173b34)
                  : Color(0xfff5f5f5),
              minimumSize: Size(double.infinity, 50)),
        ),
      ),
    );
  }
}
