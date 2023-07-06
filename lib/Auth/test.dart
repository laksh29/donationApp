import 'package:donationsapp/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/login_ui.dart';

class GoogleSignInNotifier extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final BuildContext context;

  GoogleSignInNotifier({required this.context});

  GoogleSignInAccount? _user;

  Future gSignIn() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final userCred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(userCred);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
                // user: _user,
                ),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      final snackbar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    notifyListeners();
  }

  Future googleLogout() async {
    try {
      FirebaseAuth.instance.signOut();
      const snackbar = SnackBar(content: Text("Logged Out Successfully !"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginUi()),
          (route) => false);
      await googleSignIn.disconnect();
    } on FirebaseAuthException catch (e) {
      final snackbar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    notifyListeners();
  }
}
