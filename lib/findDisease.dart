import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_app/auth.dart';
import 'package:test_app/colors.dart';

class FindDisease extends StatefulWidget {
  @override
  _FindDiseaseState createState() => _FindDiseaseState();
}

class _FindDiseaseState extends State<FindDisease> {
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final _auth = AuthService();
  final List bodySymptoms = [
    "Fever",
    "Cough",
    "Legs Pain",
    "Stomache",
    "Ear Pain",
    "Rashes",
    "Loose Motion",
    "Vomiting",
    "Flu",
    "Running Nose",
    "Reddish Eyes",
    "Dusky Skin Color"
  ];
  String s1, s2, s3, s4;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kTextColor,
        child: Icon(
          Icons.search,
          color: kPrimary,
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
              "Select your",
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
              "Possible Symptoms",
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
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Select any of the four Symtoms",
              style: GoogleFonts.poppins(
                color: kTextColor,
                fontSize: size.width * 0.05,
                //fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: Text("Body Symptoms",
                        style: GoogleFonts.poppins(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected[0] = !isSelected[0];

                            s1 = bodySymptoms[0];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isSelected[0] ? Colors.grey[400] : null,
                              border: Border.all(color: kTextColor),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: Text(
                              "${bodySymptoms[0]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected[1] = !isSelected[1];

                            s1 = bodySymptoms[1];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isSelected[1] ? Colors.grey[400] : null,
                              border: Border.all(color: kTextColor),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: Text("${bodySymptoms[1]}",
                                style: GoogleFonts.poppins(
                                    color: kTextColor,
                                    fontSize: size.width * 0.04)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[2]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.007),
                          child: Text(
                            "${bodySymptoms[3]}",
                            style: GoogleFonts.poppins(
                                color: kTextColor, fontSize: size.width * 0.04),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            s1 = bodySymptoms[0];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kTextColor),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: Text(
                              "${bodySymptoms[0]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[1]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[2]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.007),
                          child: Text(
                            "${bodySymptoms[3]}",
                            style: GoogleFonts.poppins(
                                color: kTextColor, fontSize: size.width * 0.04),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            s1 = bodySymptoms[0];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kTextColor),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: Text(
                              "${bodySymptoms[0]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[1]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[2]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.007),
                          child: Text(
                            "${bodySymptoms[3]}",
                            style: GoogleFonts.poppins(
                                color: kTextColor, fontSize: size.width * 0.04),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            s1 = bodySymptoms[0];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kTextColor),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: Text(
                              "${bodySymptoms[0]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[1]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[2]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.007),
                          child: Text(
                            "${bodySymptoms[3]}",
                            style: GoogleFonts.poppins(
                                color: kTextColor, fontSize: size.width * 0.04),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            s1 = bodySymptoms[0];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kTextColor),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: Text(
                              "${bodySymptoms[0]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[1]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Text("${bodySymptoms[2]}",
                              style: GoogleFonts.poppins(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.007),
                          child: Text(
                            "${bodySymptoms[3]}",
                            style: GoogleFonts.poppins(
                                color: kTextColor, fontSize: size.width * 0.04),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
