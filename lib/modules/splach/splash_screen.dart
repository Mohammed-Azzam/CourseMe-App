import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/component.dart';
import '../login/login_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      navigatorTo1(context, LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splach.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            )
          ],
        ),
      ),
    );
  }
}
