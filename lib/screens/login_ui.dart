import 'package:donationsapp/const.dart';
import 'package:donationsapp/model/button_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/google_sign_in.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Daan Dharam",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "A Jain Donation App",
            style: GoogleFonts.poppins(),
          ),
          buildHeight(50.0),
          ContainerButton(
            text: "Google Sign in",
            onTap: () => GoogleAuth().googleSignIn(context),
          )
        ],
      )),
    ));
  }
}
