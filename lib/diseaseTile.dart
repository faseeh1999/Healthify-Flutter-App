import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/disease.dart';
import 'package:test_app/diseaseDetail.dart';

class DiseaseTile extends StatefulWidget {
  final Disease disease;
  DiseaseTile({this.disease});
  @override
  _DiseaseTileState createState() => _DiseaseTileState();
}

class _DiseaseTileState extends State<DiseaseTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 0.0,
        color: kPrimary,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
            leading: CircleAvatar(
              backgroundColor: kTextColor,
              radius: 25.0,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: PageView.builder(itemBuilder: (context, index) {
                        return DiseaseDetail(
                          disease: widget.disease,
                        );
                      }),
                      type: PageTransitionType.rightToLeftWithFade,
                      duration: Duration(milliseconds: 200)));
            },
            title: Text(
              widget.disease.name,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: size.width * 0.05),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        "${widget.disease.symptoms[0]}",
                        style: GoogleFonts.poppins(
                            color: kTextColor, fontSize: size.width * 0.04),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Text("${widget.disease.symptoms[1]}",
                          style: GoogleFonts.poppins(
                              color: kTextColor, fontSize: size.width * 0.04)),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Text("${widget.disease.symptoms[2]}",
                          style: GoogleFonts.poppins(
                              color: kTextColor, fontSize: size.width * 0.04)),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      Text(
                        "${widget.disease.symptoms[3]}",
                        style: GoogleFonts.poppins(
                            color: kTextColor, fontSize: size.width * 0.04),
                      ),
                    ],
                  )),
            )),
      ),
    );
  }
}
