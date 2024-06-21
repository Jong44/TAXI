import 'package:flutter/material.dart';
import 'package:taxi_app/components/global/TextFieldMain.dart';
import 'package:taxi_app/pages/auth/LoginScreen.dart';
import 'package:taxi_app/pages/auth/RegisProfilePage.dart';

class regist extends StatefulWidget {
  const regist({super.key});

  @override
  State<regist> createState() => _registState();
}

class _registState extends State<regist> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldMain(
                placeholder: "John Doe",
                controller: fullNameController,
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldMain(
                placeholder: "example@example.com",
                controller: emailController,
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldMain(
                placeholder: "***********",
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (fullNameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisProfileScreen(
                                    data: {
                                      "email": emailController.text,
                                      "password": passwordController.text,
                                      "fullName": fullNameController.text
                                    },
                                  )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please fill all fields"),
                      ));
                    }
                  },
                  child: Text(
                    "Selanjutnya",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff503F76),
                    minimumSize: Size(200, 50),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 13),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontSize: 13),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
