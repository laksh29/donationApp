import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const.dart';
import '../model/button_model.dart';
import '../providers/auth_providers.dart';
import 'login_ui.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(firebaseAuthProvider).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("${user!.displayName}"),
        actions: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage("${user.photoURL}"),
          ),
          buildWidth(20.0),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have been logged in with ${user.email}"),
            buildHeight(20.0),
            ContainerButton(
                text: "Log Out !",
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginUi()),
                    (route) => false))
          ],
        ),
      ),
    );
  }
}
