import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app/colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimary,
      child: Center(
        child: SpinKitDoubleBounce(
          color: kTextColor,
          size: 50.0,
        ),
      ),
    );
  }
}
