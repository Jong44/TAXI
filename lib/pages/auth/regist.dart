import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/TextFieldMain.dart';

class regist extends StatefulWidget {
  const regist({super.key});

  @override
  State<regist> createState() => _registState();
}

class _registState extends State<regist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Full Name",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldMain(
              placeholder: "example@example.com",
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldMain(
              placeholder: "***********",
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldMain(
              placeholder: "example@example.com",
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff503F76),
                  minimumSize: Size(200, 50),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 13),
                ),
                TextButton(
                    onPressed: () {},
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
