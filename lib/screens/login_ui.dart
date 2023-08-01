import 'package:donationsapp/model/button_model.dart';
import 'package:flutter/material.dart';

import '../Services/google_sign_in.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SafeArea(
          child: ContainerButton(
        text: "Google Sign in",
        onTap: () => GoogleAuth().googleSignIn(context),
      )),
    ));
  }
}
