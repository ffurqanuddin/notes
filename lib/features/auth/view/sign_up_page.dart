import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:notes/components/assets/assets.dart';
import 'package:notes/components/routes/routes.dart';
import 'package:notes/global/widgets/svg_circle_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../components/responsive/responsive.dart';
import '../../../components/theme/textstyles.dart';
import '../../../utils/media_query.dart';
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
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: Responsive.isDesktop(context)?MQ.width(context)*0.45:Responsive.isTablet(context)?MQ.width(context)*0.8:double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///----------SVG Image-------///
                  SvgCircleImage(
                      svgFromAsset: MyAssets.userAdd, radius: Responsive.isDesktop(context)?14.h:Responsive.isTablet(context)?16.h: 10.h),

                 if(Responsive.isMobile(context)) Gap(5.w),
                 if(Responsive.isDesktop(context)) Gap(2.h),

                  ///-------------EMAIL FIELD-----------///
                  AuthTextFieldWidget(
                    controller: emailController,
                    icon: Icons.email_outlined,
                    hint: "Enter your email",
                    validator: emailValidatity,
                  ),

                  if(Responsive.isMobile(context))Gap(5.w),
                  ///-------------PASSWORD FIELD----------///

                  ///---1st---///
                  AuthTextFieldWidget(
                      controller: passwordController,
                      icon: FontAwesomeIcons.lock,
                      obscure: obscure,
                      eyeIcon: true,
                      hint: "Enter a password",
                      validator: passwordValidatity),

                  if(Responsive.isMobile(context)) Gap(5.w),

                  ///---Confirm Password---///
                  AuthTextFieldWidget(
                    controller: confirmPasswordController,
                    icon: FontAwesomeIcons.lock,
                    obscure: obscure,
                    eyeIcon: true,
                    hint: "Confirm Password",
                    validator: confirmPasswordValidatity,
                  ),

                  if(Responsive.isMobile(context))  Gap(5.w),
                  if(Responsive.isDesktop(context))  Gap(2.h),

                  ///-------------SIGNUP BUTTON----------///
                  AuthButton(label: "Signup"),

                  if(Responsive.isMobile(context)) Gap(3.w),
                  if(Responsive.isDesktop(context)) Gap(2.h),

                  ///Already have account
                  TextButton(
                      child: Text(
                        "Already have an account?",
                        style: MyTextStyles.authTextButton(context),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.login);
                      }),

                  if(Responsive.isMobile(context)) Gap(10.w),
                  if(Responsive.isDesktop(context)) Gap(3.h),

                  ///-------------CONTINUE WITH GOOGLE----------///
                  GoogleButtonWidget(onTap: () {}),
                ],
              ),
            ),
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
