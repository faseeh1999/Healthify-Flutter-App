import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/auth.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/database.dart';
import 'package:test_app/disease.dart';
import 'package:test_app/diseaseList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamProvider<List<Disease>>.value(
      value: DatabaseService().diseases,
      child: Scaffold(
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
          body: DiseaseList()),
    );
  }
}
