import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/donor_infor_model/donar_info_model.dart';

final database = FirebaseFirestore.instance;

final ref = database.collection("Donar");

var donarDetails = ({
  name,
  phoneNumber,
  address,
  donationAmount,
  donationPlace,
  photoURL,
}) async {
  DonorInfo info = DonorInfo(
    name: name,
    phoneNumber: phoneNumber,
    address: address,
    donationAmount: donationAmount,
    donationPlace: donationPlace,
    photoURL: photoURL,
  );

  await ref.add(info.toJson()).then(
        (value) => log("Donar registered successfully!"),
        onError: (e) => log("Error: $e"),
      );
};

List<DonorInfo> donars = [];
int totalDonars = 0;

Future readDonars(String id) async {
  final ref = FirebaseFirestore.instance.collection("Donar").doc(id);
  final snapshot = await ref.get();

  if (snapshot.exists) {
    return snapshot.data();
  }
}
