import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFECB7BF),
        title: Text("Settings", style: TextStyle(
            color: Colors.black,
            fontFamily: "Playfair Display",
            fontWeight: FontWeight.bold,
            fontSize: 16),),
      ),
    );
  }
}
