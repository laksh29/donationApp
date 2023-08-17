import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future uploadImagetoStorage(imageCaptured, name) async {
  final pickedFile = imageCaptured;
  DateTime now = DateTime.now();
  final path = "donars/$name - $now";
  final file = File(pickedFile!.path);

  final storageRef = FirebaseStorage.instance.ref().child(path);
  final uploadImage = storageRef.putFile(file);

  final imageSnapshot = await uploadImage.whenComplete(() => null);

  final photoURL = await imageSnapshot.ref.getDownloadURL();

  return photoURL;
}
