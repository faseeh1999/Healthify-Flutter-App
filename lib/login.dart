import 'package:flutter/material.dart';

import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/auth.dart';
import 'package:test_app/colors.dart';
import 'package:test_app/loader.dart';

class Login extends StatefulWidget {
  final Function toggleForm;
  Login({this.toggleForm});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = AuthService();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  //Validators
  final emailValidator =
      ValidationBuilder().email().maxLength(50).required().build();
  final passValidator =
      ValidationBuilder().minLength(5).maxLength(20).required().build();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: kPrimary,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.09,
                                    color: kTextColor)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Text(
                          "Access Account",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.05,
                                  color: kSubtitleText)),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       width: size.width * 0.4,
                        //       height: size.height * 0.1,
                        //       decoration: BoxDecoration(
                        //         color: kCardbg,
                        //         borderRadius: BorderRadius.circular(15.0),
                        //       ),
                        //       child: IconButton(
                        //           icon: Icon(
                        //             FontAwesomeIcons.facebookF,
                        //             color: kIconColor,
                        //           ),
                        //           onPressed: null),
                        //     ),
                        //     Container(
                        //       width: size.width * 0.4,
                        //       height: size.height * 0.1,
                        //       decoration: BoxDecoration(
                        //         color: kCardbg,
                        //         borderRadius: BorderRadius.circular(15.0),
                        //       ),
                        //       child: IconButton(
                        //           icon: Icon(
                        //             FontAwesomeIcons.google,
                        //             color: kIconColor,
                        //           ),
                        //           onPressed: null),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.05,
                        // ),
                        // Text(
                        //   "or Login With Email",
                        //   style: GoogleFonts.poppins(
                        //       textStyle: TextStyle(
                        //           letterSpacing: .6,
                        //           color: kSubtitleText,
                        //           fontWeight: FontWeight.w500)),
                        // ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              validator: emailValidator,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              controller: _email,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: kCardbg,
                                  focusColor: kCardbg,
                                  labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: kTextColor,
                                        fontSize: size.width * 0.045,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  hintText: "example@gmail.com",
                                  hintStyle: GoogleFonts.poppins(),
                                  contentPadding: EdgeInsets.all(15)),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Password",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              validator: passValidator,
                              obscureText: true,
                              controller: _pass,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: kCardbg,
                                  focusColor: kCardbg,
                                  labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: kTextColor,
                                        fontSize: size.width * 0.045,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  hintText: "**********",
                                  contentPadding: EdgeInsets.all(15)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: kButtonColor,
                                borderRadius: BorderRadius.circular(20)),
                            width: size.width * 0.7,
                            height: size.height * 0.08,
                            child: FlatButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await _auth
                                      .signInWithEmailAndPassword(
                                          _email.text, _pass.text)
                                      .whenComplete(() {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                }
                              },
                              child: Text("Sign In",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: kPrimary,
                                          fontSize: size.width * 0.05))),
                            ),
                          ),
                          SizedBox(height: size.height * 0.05),
                          GestureDetector(
                            child: RichText(
                                text: TextSpan(
                                    text: "Don't have an account?",
                                    style: GoogleFonts.poppins(
                                        color: kSubtitleText,
                                        fontSize: size.width * 0.04),
                                    children: [
                                  TextSpan(
                                      text: "   Register",
                                      style: GoogleFonts.poppins(
                                        color: kTextColor,
                                        fontWeight: FontWeight.w600,
                                      ))
                                ])),
                            onTap: () {
                              widget.toggleForm();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
