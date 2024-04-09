import 'package:flutter/material.dart';
import 'package:taxi_app/components/pages/pembayaranscreen/Pembayaran.dart';
import 'package:taxi_app/components/pages/pembayaranscreen/RangkumanSesi.dart';
import 'package:taxi_app/components/pages/pembayaranscreen/SelesaiPembayaran.dart';

class PembayaranScreen extends StatefulWidget {
  final Map<String, dynamic> dataPesanan;
  const PembayaranScreen({super.key, required this.dataPesanan});

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  List<String> tabList = ["Rangkuman Sesimu", "Pembayaran", "Selesai"];
  int indexTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.dataPesanan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (indexTab == 0) {
              Navigator.pop(context);
            } else {
              setState(() {
                indexTab -= 1;
              });
            }
          },
        ),
        title: Text(tabList[indexTab],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    tabList.length,
                    (index) => Container(
                      width: 110,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: indexTab == index
                                    ? Color(0xff235347)
                                    : Color(0xff235347).withOpacity(0.5),
                                shape: BoxShape.circle),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            tabList[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: indexTab == index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              indexTab == 0
                  ? RangkumanSesi(
                      dataPesanan: widget.dataPesanan,
                      onPilih: () {
                        setState(() {
                          indexTab += 1;
                        });
                      },
                    )
                  : indexTab == 1
                      ? Pembayaran(
                          dataPesanan: widget.dataPesanan,
                          onpress: () {
                            setState(() {
                              indexTab += 1;
                            });
                          },
                        )
                      : SelesaiPembayaran(),
            ],
          ),
        ),
      ),
    );
  }
}
