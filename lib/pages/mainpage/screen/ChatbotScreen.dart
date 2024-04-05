import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/components/global/OnlineStatus.dart';
import 'package:taxi_app/components/pages/chatbotscreen/WelcomeChat.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  bool isStart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: SizedBox(width: 60),
        title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "TAXBOT",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              OnlineStatus(
                isCenter: true,
              ),
            ]),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/logo_appbar.png',
              width: 30,
            ),
          )
        ],
      ),
      body: isStart == true
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff235347),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 100),
                            child: Text(
                              "Hai Bot, Saya Ingin Bantuan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 100,
                            height: 50,
                            color: Color(0xff235347),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            style: TextStyle(fontSize: 14),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff235347),
                          ),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          : WelcomeChat(
              startPress: () {
                setState(() {
                  isStart = true;
                });
              },
              startWithTextPress: () {},
            ),
    );
  }
}
