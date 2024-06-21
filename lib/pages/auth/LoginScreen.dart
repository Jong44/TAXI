import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/TextFieldMain.dart';
import 'package:taxi_app/pages/auth/regist.dart';
import 'package:taxi_app/pages/mainpage/MainPage.dart';
import 'package:taxi_app/services/AuthService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                SizedBox(
                  height: 7,
                ),
                TextFieldMain(
                  placeholder: "example@example.com",
                  controller: emailController,
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
                  placeholder: "*********",
                  controller: passwordController,
                  isPassword: true,
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
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      final user = AuthService()
                          .signInWithEmailAndPassword(email, password);

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please fill all fields"),
                        ));
                      } else {
                        user.then((value) {
                          if (value == 'success') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          } else if (value == 'User Tidak Ditemukan') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("User Tidak Ditemukan"),
                            ));
                          } else if (value == 'Password Salah') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Password Salah"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Unknown error"),
                            ));
                          }
                        });
                      }
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff503F76),
                      minimumSize: Size(200, 40),
                    ),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => regist()));
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
        ),
      ),
    );
  }
}
