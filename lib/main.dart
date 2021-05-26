import 'package:flutter/material.dart';
import 'package:test_app/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthify',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
