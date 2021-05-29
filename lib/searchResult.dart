import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_app/auth.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/database.dart';
import 'package:test_app/disease.dart';
import 'package:test_app/diseaseList.dart';
import 'package:test_app/login.dart';
import 'package:test_app/searchList.dart';
import 'package:test_app/wrapper.dart';

class SearchResult extends StatefulWidget {
  final String s1, s2, s3, s4;
  SearchResult({this.s1, this.s2, this.s3, this.s4});
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamProvider<List<Disease>>.value(
      value: DatabaseService(
              s1: widget.s1, s2: widget.s2, s3: widget.s3, s4: widget.s4)
          .diseasesResult,
      child: Scaffold(
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
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Wrapper(),
                            type: PageTransitionType.rightToLeft));
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
          body: SearchList()),
    );
  }
}
