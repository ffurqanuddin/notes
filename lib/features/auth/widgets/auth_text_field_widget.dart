import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/components/responsive/responsive.dart';
import 'package:notes/components/theme/colors.dart';
import 'package:notes/components/theme/textstyles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../data/auth_data.dart';

class AuthTextFieldWidget extends ConsumerWidget {
  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    required this.icon,
    required this.hint,
    this.obscure = false,
    this.textInputType = TextInputType.emailAddress,
    this.eyeIcon = false,
  });

  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final bool obscure;

  final bool eyeIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: MyColors.textFieldfilledColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscure,
          keyboardAppearance: Brightness.dark,
          onTapOutside: (event) async {
            FocusManager().primaryFocus?.unfocus();
            // FocusScopeNode().unfocus();
          },
          keyboardType: textInputType,
          style: MyTextStyles.authTextField(context),
          decoration: InputDecoration(
              // filled: true,
              // fillColor: MyColors.textFieldfilledColor,
              hintText: hint,
              hintStyle: MyTextStyles.authTextFieldHint(context),
              prefixIcon: Icon(icon, size:

              Responsive.isMobile(context)? 17.sp:15.sp,),
              border: InputBorder.none,
              suffixIcon: Visibility(
                  visible: eyeIcon,
                  child: IconButton(
                      onPressed: () {
                        ref.read(obscurePasswordStateProvider.notifier).state =
                            !ref.read(obscurePasswordStateProvider.notifier).state;
                      },
                      icon: obscure
                          ? const Icon(FontAwesomeIcons.eye)
                          : const Icon(FontAwesomeIcons.eyeLowVision)))),
        ),
      ),
    );
  }
}
