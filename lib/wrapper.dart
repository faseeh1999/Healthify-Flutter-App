import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/authenticate.dart';
import 'package:test_app/home.dart';
import 'package:test_app/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return either home or authenicate widget
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
