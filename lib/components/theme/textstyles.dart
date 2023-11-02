import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/components/responsive/responsive.dart';
import 'package:notes/main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyTextStyles {
  ///-----Mobile------///  & ///---------Tablet/Desktop----///

  ///***1***///
  static TextStyle authTextField(context) =>

      ///mobile
      Responsive.isMobile(context)
          ? GoogleFonts.roboto(color: Colors.black, fontSize: 18.sp)

          ///Desktop
          : GoogleFonts.roboto(color: Colors.black, fontSize: 16.sp);

  ///***2***///
  static TextStyle authTextFieldHint(context) =>

      ///mobile
      Responsive.isMobile(context)
          ? GoogleFonts.robotoSerif(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp)
          :

          ///desktop
          GoogleFonts.robotoSerif(

              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp);

  ///***3***///
  static TextStyle authButton(context) =>

      ///mobile
      Responsive.isMobile(context)
          ? TextStyle(
              fontSize: 19.sp, fontWeight: FontWeight.bold, letterSpacing: 5.sp)
          :

          ///desktop
          TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 5.sp);

  ///***4***///
  static TextStyle authButtonLabel(context) =>

      ///mobile
      Responsive.isMobile(context)
          ? GoogleFonts.roboto(color: Colors.white)
          :

          ///desktop
          GoogleFonts.roboto(color: Colors.white,fontSize: 14.sp);

  ///***5***///
  static TextStyle authTextButton(context) =>

      ///mobile
      Responsive.isMobile(context)
          ? TextStyle(fontSize: 16.sp)
          :

          ///mobile
          TextStyle(fontSize: 13.sp);



  ///***6***///
static TextStyle googleButtonLabel(context)=>
    ///mobile
Responsive.isMobile(context)?GoogleFonts.roboto(
    color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17.sp):GoogleFonts.roboto(
    color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.sp);
}
