import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/introduction.dart';
import 'package:test_app/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 750),
              child: Introduction()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText('Welcome to',
                      textStyle: GoogleFonts.poppins(
                        color: kTextColor,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w600,
                      )),
                ]),
                TextLiquidFill(
                  text: 'Healthify',
                  waveColor: kTextColor,
                  boxBackgroundColor: kPrimary,
                  textStyle: GoogleFonts.poppins(
                    fontSize: size.width * 0.18,
                    fontWeight: FontWeight.w600,
                  ),
                  boxHeight: size.height * 0.18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
