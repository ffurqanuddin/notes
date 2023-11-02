import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/components/responsive/responsive.dart';
import 'package:notes/components/theme/textstyles.dart';
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
        style: MyTextStyles.googleButtonLabel(context),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Responsive.isDesktop(context)?Size(50.w, 5.h):Responsive.isTablet(context)?Size(65.w, 6.h) :Size(65.w, 6.h),
        backgroundColor: MyColors.googleButton,
      ),
    );
  }
}
