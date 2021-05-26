import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/auth.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/loader.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: kPrimary,
            appBar: AppBar(
              actions: [
                FlatButton.icon(
                    icon: Icon(
                      Icons.logout,
                      color: kTextColor,
                    ),
                    label: Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                          color: kTextColor, fontSize: size.width * 0.04),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await _auth.signOut().whenComplete(() {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    })
              ],
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: Text(
                "Healthify",
                style: GoogleFonts.poppins(
                    color: kTextColor, fontSize: size.width * 0.08),
              ),
            ),
          );
  }
}
