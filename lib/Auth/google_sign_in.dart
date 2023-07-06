import 'package:donationsapp/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/bottom_nav.dart';
import '../screens/login_ui.dart';

class GoogleAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get authState => auth.authStateChanges();

  Future googleSignIn(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final cred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await auth.signInWithCredential(cred);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future signOut(BuildContext context) async {
    try {
      await auth.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginUi()),
          (route) => false);
      await GoogleSignIn().disconnect();
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

final authenticationProvider = Provider<GoogleAuth>((ref) => GoogleAuth());

final authStateProvider =
    StreamProvider<User?>((ref) => ref.read(authenticationProvider).authState);

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
