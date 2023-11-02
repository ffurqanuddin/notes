import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:notes/components/assets/assets.dart';
import 'package:notes/components/routes/routes.dart';
import 'package:notes/global/widgets/svg_circle_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../components/theme/textstyles.dart';
import '../../data/auth_data.dart';
import '../widgets/auth_button_widget.dart';
import '../widgets/auth_text_field_widget.dart';
import '../widgets/google_button_widget.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///-------OBSCURE PROVIDER------///
    bool obscure = ref.watch<bool>(obscurePasswordStateProvider);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 12.h),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///----------SVG Image-------///
              SvgCircleImage(svgFromAsset: MyAssets.userAdd, radius: 18.w),

              Gap(5.w),

              ///-------------EMAIL FIELD-----------///
              AuthTextFieldWidget(
                controller: emailController,
                icon: Icons.email_outlined,
                hint: "Enter your email",
                validator: emailValidatity,
              ),

              Gap(5.w),

              ///-------------PASSWORD FIELD----------///

              ///---1st---///
              AuthTextFieldWidget(
                  controller: passwordController,
                  icon: FontAwesomeIcons.lock,
                  obscure: obscure,
                  eyeIcon: true,
                  hint: "Enter a password",
                  validator: passwordValidatity),

              Gap(5.w),

              ///---Confirm Password---///
              AuthTextFieldWidget(
                controller: confirmPasswordController,
                icon: FontAwesomeIcons.lock,
                obscure: obscure,
                eyeIcon: true,
                hint: "Confirm Password",
                validator: confirmPasswordValidatity,
              ),

              Gap(5.w),

              ///-------------SIGNUP BUTTON----------///
              AuthButton(label: "Signup"),

              Gap(3.w),

              ///Create an account
              TextButton(
                  child: Text(
                    "Already have an account?",
                    style: MyTextStyles.authTextButton,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.login);
                  }),

              Gap(10.w),

              ///-------------CONTINUE WITH GOOGLE----------///
              GoogleButtonWidget(onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  ///--------------- M E T H O D S -------------///
  String? confirmPasswordValidatity(String? value) {
    if (value!.isEmpty) {
      return "Please fill the confirm password field";
    }
    if (value.isNotEmpty && value.length < 6) {
      return "password must be minimum six characters long";
    }

    if (confirmPasswordController.text != passwordController.text) {
      return "Password not matched";
    }
    return null;
  }

  String? passwordValidatity(String? value) {
    if (value!.isEmpty) {
      return "Please fill the password field";
    }
    if (value.isNotEmpty && value.length < 6) {
      return "password must be minimum six characters long";
    }

    if (passwordController.text != confirmPasswordController.text) {
      return "Password not matched";
    }
    return null;
  }

  String? emailValidatity(String? value) {
    if (value!.isEmpty) {
      return "Please fill the email field";
    }

    if (value.isNotEmpty && !value.contains("@")) {
      return "Invalid email address";
    }
    return null;
  }
}
