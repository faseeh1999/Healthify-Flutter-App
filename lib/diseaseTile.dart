import 'package:flutter/material.dart';
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
        color: Colors.white,
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
            style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.04),
          ),
          subtitle: Text("${widget.disease.description}",
              style: TextStyle(fontFamily: 'ss', fontSize: size.width * 0.038)),
          // trailing: RatingBar.builder(
          //   itemSize: size.width * 0.04,
          //   initialRating: widget.school.rating,
          //   minRating: 1,
          //   direction: Axis.horizontal,
          //   allowHalfRating: true,
          //   itemCount: 5,
          //   itemBuilder: (context, _) => Icon(
          //     Icons.star,
          //     color: Colors.blueAccent,
          //   ),
          //   onRatingUpdate: (rating) {
          //     print(rating);
          //   },
          // ),
          // trailing: IconButton(
          //   icon: isBookmarked ? bookmarkIconComp : bookmarkIconInit,
          //   onPressed:
          //       isBookmarked ? removeBookmarkToFirebase : addBookmarkToFirebase,
          // ),
        ),
      ),
    );
  }
}
