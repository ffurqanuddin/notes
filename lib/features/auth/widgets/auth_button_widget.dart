

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/components/responsive/responsive.dart';
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
        textStyle: MyTextStyles.authButton(context),
        fixedSize: Responsive.isDesktop(context)?Size(80.w, 5.h) :Responsive.isTablet(context)?Size(60.w, 5.h)  :Size(80.w, 6.h),
      ),
      child: Text(
        label,
        style: MyTextStyles.authButtonLabel(context),
      ),
    );
  }
}
