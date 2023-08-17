import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const.dart';
import '../providers/auth_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(firebaseAuthProvider).currentUser;
    return Scaffold(
      appBar: AppBar(
        // title: Text("${user!.displayName}"),
        title: Text(
          "Daan Dharam",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage("${user!.photoURL}"),
          ),
          buildWidth(20.0),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Donar').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return Text("Something went wrong \n ${snapshot.error}");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String name = snapshot.data!.docs[index]["name"];
                  String donationAmount =
                      snapshot.data!.docs[index]["donationAmount"];

                  return donarTile(name, donationAmount);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Text(snapshot.connectionState.toString());
          }
        },
      ),
    );
  }
}

Widget donarTile(name, donationAmount) {
  return Column(
    children: [
      ListTile(
        title: Text(name),
        subtitle: Text("Rs. $donationAmount"),
      ),
      Divider(
        color: Colors.white.withOpacity(0.5),
      )
    ],
  );
}
