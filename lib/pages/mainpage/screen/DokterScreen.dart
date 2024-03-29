import 'package:flutter/material.dart';

class DokterScreen extends StatefulWidget {
  const DokterScreen({super.key});

  @override
  State<DokterScreen> createState() => _DokterScreenState();
}

class _DokterScreenState extends State<DokterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Dokter")),
    );
  }
}
