import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/theme/colors.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        FontAwesomeIcons.google,
        color: MyColors.googleButtonIconColor,
      ),
      label: Text(
        "Continue with Google",
        style: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17.sp),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(65.w, 6.h),
        backgroundColor: MyColors.googleButton,
      ),
    );
  }
}
