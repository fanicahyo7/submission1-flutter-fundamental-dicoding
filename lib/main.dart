import 'package:flutter/material.dart';
import 'package:submission1_flutter_fundamental_dicoding/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      initialRoute: MainPage.routeName,
      routes: {
        MainPage.routeName: (context) => MainPage(),
      },
    );
  }
}
