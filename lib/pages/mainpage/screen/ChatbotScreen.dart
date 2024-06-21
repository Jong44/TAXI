import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/components/global/OnlineStatus.dart';
import 'package:taxi_app/components/pages/chatbotscreen/WelcomeChat.dart';
import 'package:taxi_app/config/ColorConfig.dart';
import 'package:taxi_app/services/ChatbotService.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isStart = false;
  bool isLoading = false;
  TextEditingController textController = TextEditingController();

  String threads = "";

  List<dynamic> listMessage = [];

  Future<void> getMessage() async {
    ChatbotService chatbotService = ChatbotService();
    Map<String, dynamic> data = await chatbotService.getMessage();
    List<dynamic> dataMessage = data['messages']['data'];
    setState(() {
      listMessage = dataMessage as List<dynamic>;
    });
    print(dataMessage);
  }

  Future<void> getThreads() async {
    ChatbotService chatbotService = ChatbotService();
    String threads = await chatbotService.getStoredThreads();
    setState(() {
      if (threads != "") {
        isStart = true;
      }
    });
  }

  Future<void> sendMessage() async {
    setState(() {
      isLoading = true;
    });
    ChatbotService chatbotService = ChatbotService();
    await chatbotService.sendMessage(textController.text);

    setState(() {
      isLoading = false;
      textController.text = "";
    });
    _scrollToBottom();
  }

  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
    setState(() {
      timer = Timer.periodic(Duration(seconds: 3), (timer) {
        if (isStart == true) {
          getMessage();
        }
      });
    });
    getThreads();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 1500,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

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
                "OLAF",
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
              'assets/taca/logo_notext.png',
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
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: listMessage.length,
                      itemBuilder: (context, index) {
                        if (listMessage[index]["role"] == "assistant") {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    margin: EdgeInsets.only(right: 100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xffF2F2F2),
                                    ),
                                    child: listMessage[index]["content"]
                                                    .length >
                                                0 &&
                                            listMessage[index]["content"][0]
                                                    ['text']['value'] !=
                                                null
                                        ? Text(
                                            listMessage[index]["content"][0]
                                                ['text']['value'],
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        : Text("Tunggu sebentar...")),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ColorConfig.primaryColor,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(left: 100),
                                    child: listMessage[index]?["content"][0]
                                                ?['text']['value'] !=
                                            null
                                        ? Text(
                                            listMessage[index]["content"][0]
                                                ['text']['value'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        : SizedBox()),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: textController.text.length > 40 ? 100 : 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textController,
                            maxLines: textController.text.length > 40 ? 3 : 1,
                            style: TextStyle(fontSize: 14),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (isLoading == false) {
                              sendMessage();
                            }
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isLoading == true
                                    ? Color.fromRGBO(0, 0, 0, 0.2)
                                    : ColorConfig.primaryColor),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
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
                ChatbotService().createThreads();
                setState(() {
                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isStart = true;
                    });
                  });
                });
              },
              startWithTextPress: () {
                ChatbotService().createThreads();
                setState(() {
                  textController.text = "Hallooo Olaff, aku butuh bantuan nih";
                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isStart = true;
                    });
                  });
                });
              },
            ),
    );
  }
}
