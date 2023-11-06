import 'package:donationsapp/Services/google_sign_in.dart';
import 'package:donationsapp/const.dart';
import 'package:donationsapp/templates/container_button.dart';
import 'package:donationsapp/templates/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_providers.dart';
import '../templates/text_box.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(firebaseAuthProvider).currentUser;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: title(),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextBox(
                text: "${user!.displayName}",
                subText: "${user.email}",
                leadingIcon: "${user.photoURL}",
              ),
              buildHeight(20.0),
              const TextBox(text: "Donations Made"),
              buildHeight(20.0),
              const TextBox(text: "Privacy Policy"),
              buildHeight(20.0),
              const TextBox(text: "Delete Account"),
              buildHeight(25.0),
              ContainerButton(
                  text: "Log Out", onTap: () => GoogleAuth().signOut(context)),
              const Spacer(),
              Text(
                "v 1.2.2",
                style: label(),
              ),
              buildHeight(10.0)
            ],
          ),
        ));
  }
}
