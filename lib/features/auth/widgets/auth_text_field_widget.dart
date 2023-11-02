import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/components/theme/colors.dart';
import 'package:notes/components/theme/textstyles.dart';
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
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure,
      keyboardAppearance: Brightness.dark,
      onTapOutside: (event) async {
        FocusManager().primaryFocus?.unfocus();
        // FocusScopeNode().unfocus();
      },
      keyboardType: textInputType,
      style: MyTextStyles.authTextField,
      decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.textFieldfilledColor,
          hintText: hint,
          hintStyle: MyTextStyles.authTextFieldHint,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
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
    );
  }
}
