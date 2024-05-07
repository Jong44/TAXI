import 'package:flutter/material.dart';
import 'package:taxi_app/pages/auth/LoginScreen.dart';
import 'package:taxi_app/pages/splash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "PlusJakartaSans",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
          ),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
