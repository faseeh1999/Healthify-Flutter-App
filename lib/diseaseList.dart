import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/disease.dart';
import 'package:test_app/diseaseTile.dart';
import 'package:test_app/findDisease.dart';

class DiseaseList extends StatefulWidget {
  @override
  _DiseaseListState createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  @override
  Widget build(BuildContext context) {
    final diseases = Provider.of<List<Disease>>(context) ?? [];
    Size size = MediaQuery.of(context).size;
    return Column(
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
        Expanded(
          child: Scrollbar(
            isAlwaysShown: false,
            child: ListView.builder(
                itemCount: diseases.length,
                itemBuilder: (context, index) {
                  return DiseaseTile(disease: diseases[index]);
                }),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.03),
            child: Container(
              decoration: BoxDecoration(
                  color: kButtonColor, borderRadius: BorderRadius.circular(25)),
              width: size.width * 0.7,
              height: size.height * 0.08,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: FindDisease(),
                          type: PageTransitionType.rightToLeft));
                },
                child: Text("Find About Your Disease",
                    style: GoogleFonts.poppins(
                        color: kPrimary,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
