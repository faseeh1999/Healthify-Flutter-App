import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/disease.dart';
import 'package:test_app/diseaseTile.dart';

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
        SizedBox(
          height: size.height * 0.04,
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
      ],
    );
  }
}
