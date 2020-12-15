import 'dart:async';
import 'package:flutter/material.dart';
import 'main_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startSplash();
  }

  startSplash() async {
    var duration = Duration(seconds: 1);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return MainPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Image.asset(
          "assets/resto.png",
          width: 200,
          height: 100,
        ),
      ),
    );
  }
}
