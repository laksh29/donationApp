import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle daanDharam(bool italics) {
  return GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontStyle: italics ? FontStyle.italic : FontStyle.normal,
  );
}

TextStyle title() {
  return GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
}

TextStyle subHeading() {
  return GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}

TextStyle label() {
  return GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
}




//? body, display, headline, label, title