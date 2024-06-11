import 'package:flutter/material.dart';
import 'package:taxi_app/pages/riwayat_transaksi/completed.dart';

class riwayat extends StatefulWidget {
  const riwayat({super.key});

  @override
  State<riwayat> createState() => _riwayatState();
}

class _riwayatState extends State<riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Bookings",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => riwayat()));
                    },
                    child: Text(
                      "Upcoming",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: 12,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Completed()));
                    },
                    child: Text(
                      "Completed",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                    )),
                SizedBox(
                  width: 12,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Canceled",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "May 22, 2023, 10.00 AM",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/dokter1.png",
                        width: 100,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Dr. james Robinson",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text("Orthopedic Surgery")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 230, 239, 236),
                              minimumSize: Size(double.infinity, 35)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Reschedule",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff173b34),
                              minimumSize: Size(double.infinity, 35)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "May 22, 2023, 10.00 AM",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/dokter2.png",
                        width: 100,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Dr. james Robinson",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text("Orthopedic Surgery")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 230, 239, 236),
                              minimumSize: Size(double.infinity, 35)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Reschedule",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff173b34),
                              minimumSize: Size(double.infinity, 35)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
