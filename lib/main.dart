import 'package:flutter/material.dart';
import 'package:test_app/splash.dart';
import 'package:test_app/auth.dart';
import 'package:provider/provider.dart';
import 'package:test_app/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Healthify',
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
