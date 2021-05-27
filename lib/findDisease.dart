import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/auth.dart';
import 'package:test_app/colors.dart';

class FindDisease extends StatefulWidget {
  @override
  _FindDiseaseState createState() => _FindDiseaseState();
}

class _FindDiseaseState extends State<FindDisease> {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kTextColor),
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
                await _auth.signOut();
              })
        ],
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Healthify",
          style: GoogleFonts.poppins(
              color: kTextColor,
              fontSize: size.width * 0.08,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
