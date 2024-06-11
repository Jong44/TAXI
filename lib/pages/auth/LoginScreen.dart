import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/TextFieldMain.dart';
import 'package:taxi_app/pages/auth/regist.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Center(
              child: Image.asset(
                "assets/taca/logo.png",
                width: 100,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Text(
                  "Email Or Mobile Number",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                )
              ],
            ),
            SizedBox(
              height: 7,
            ),
            TextFieldMain(
              placeholder: "example@example.com",
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [Text("Password")],
            ),
            SizedBox(
              height: 7,
            ),
            TextFieldMain(
              placeholder: "example@example.com",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password",
                      style: TextStyle(fontSize: 12),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff503F76),
                minimumSize: Size(200, 40),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 13),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => regist()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 13),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
