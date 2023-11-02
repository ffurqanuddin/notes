

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/components/theme/textstyles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/theme/colors.dart';

class AuthButton extends StatelessWidget {
  AuthButton({
    super.key,
    required this.label,
  });

  String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.buttonColor,
        textStyle: MyTextStyles.authButton,
        fixedSize: Size(80.w, 6.h),
      ),
      child: Text(
        label,
        style: MyTextStyles.authButtonLabel,
      ),
    );
  }
}
