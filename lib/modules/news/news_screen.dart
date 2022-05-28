import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFECB7BF),
        title: Text("News",style: TextStyle(
            color: Colors.black,
            fontFamily: "Playfair Display",
            fontWeight: FontWeight.bold,
            fontSize: 16),),
      ),
    );
  }
}
