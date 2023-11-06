import 'package:flutter/material.dart';

void showAlertDialog(
    BuildContext context, String title, String message, String? ctaText) {
  // set up the buttons
  Widget continueButton = ElevatedButton(
    style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0))),
    child: Text(ctaText ?? "Continue"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
