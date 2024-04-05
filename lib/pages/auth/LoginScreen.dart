import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/components/global/MainButton.dart';
import 'package:taxi_app/components/global/MainInputPassword.dart';
import 'package:taxi_app/components/global/MainInputText.dart';
import 'package:taxi_app/pages/mainpage/MainPage.dart';
import 'package:taxi_app/pages/mainpage/screen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff235347), Color(0xff153832)])),
              child: Center(
                child: Image.asset(
                  "assets/logo_white.png",
                  width: 80,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MainInputText(
                title: "Email",
                prefixIcon: Icon(
                  Icons.mail_outlined,
                  size: 20,
                ),
                placeholder: "example@gmail.com",
                inputController: emailController,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MainInputPassword(
                obsecure: isObsecure,
                title: "Password",
                placeholder: "********",
                inputController: emailController,
                pressObsecure: () {
                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child:
                  TextButton(onPressed: () {}, child: Text("Lupa password ?")),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MainButton(
                  borderRadius: 50.0,
                  title: "Login",
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun?"),
                TextButton(onPressed: () {}, child: Text("Buat akun")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
