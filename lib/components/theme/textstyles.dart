import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyTextStyles {
  static TextStyle authTextField =
      GoogleFonts.roboto(color: Colors.black, fontSize: 18.sp);
  static TextStyle authTextFieldHint = GoogleFonts.robotoSerif(
      color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 16.sp);

  static TextStyle authButton = TextStyle(
      fontSize: 19.sp, fontWeight: FontWeight.bold, letterSpacing: 5.sp);
  static TextStyle authButtonLabel = GoogleFonts.roboto(color: Colors.white);

  static TextStyle authTextButton = TextStyle(fontSize: 16.sp);
}
