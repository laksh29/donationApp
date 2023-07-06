import 'package:donationsapp/Auth/google_sign_in.dart';
import 'package:donationsapp/screens/bottom_nav.dart';
import 'package:donationsapp/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/login_ui.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const LoginUi(),
    );
  }
}

class AuthStatus extends ConsumerWidget {
  const AuthStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) {
            return const BottomNav();
          }
          return const LoginUi();
        },
        error: (e, trace) {
          return const AlertDialog();
        },
        loading: () => const CircularProgressIndicator());
  }
}
