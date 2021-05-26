import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/auth.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/database.dart';
import 'package:test_app/disease.dart';
import 'package:test_app/diseaseList.dart';
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
        : StreamProvider<List<Disease>>.value(
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
                      color: kTextColor,
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.w600),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Find your",
                      style: GoogleFonts.poppins(
                        color: kTextColor,
                        fontSize: size.width * 0.08,
                        //fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Possible Diseases",
                      style: GoogleFonts.poppins(
                        color: kTextColor,
                        fontSize: size.width * 0.08,
                        //fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(
                    endIndent: size.width * 0.08,
                    indent: size.width * 0.08,
                    color: kTextColor,
                    height: size.height * 0.1,
                    thickness: size.width * 0.005,
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  DiseaseList()
                ],
              ),
            ),
          );
  }
}
