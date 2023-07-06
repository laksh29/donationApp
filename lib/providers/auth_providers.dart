import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Auth/google_sign_in.dart';

final authenticationProvider = Provider<GoogleAuth>((ref) => GoogleAuth());

final authStateProvider =
    StreamProvider<User?>((ref) => ref.read(authenticationProvider).authState);

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
