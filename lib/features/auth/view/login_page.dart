import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:notes/components/responsive/responsive.dart';
import 'package:notes/components/routes/routes.dart';
import 'package:notes/components/theme/textstyles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../components/assets/assets.dart';
import '../../../utils/media_query.dart';
import '../../data/auth_data.dart';
import '../widgets/auth_button_widget.dart';
import '../widgets/auth_text_field_widget.dart';
import '../widgets/google_button_widget.dart';
import '../../../global/widgets/svg_circle_image.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
                  ///-----------SVG Image------------///

                    SvgCircleImage(
                        svgFromAsset: MyAssets.userMailingList, radius: Responsive.isDesktop(context)?14.h:Responsive.isTablet(context)?16.h: 10.h),


                   Gap(5.w),


                  ///-------------EMAIL FIELD-----------///
                    AuthTextFieldWidget(
                      controller: emailController,
                      icon: Icons.email_outlined,
                      hint: " Enter your email",
                      validator: emailValidatity,
                    ),

                  if (Responsive.isMobile(context)) Gap(5.w),
                  if (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context))
                    Gap(2.h),

                  ///-------------PASSWORD FIELD----------///

                    AuthTextFieldWidget(
                      controller: passwordController,
                      icon: FontAwesomeIcons.lock,
                      obscure: obscure,
                      eyeIcon: true,
                      hint: " Enter your password",
                      validator: passwordValidatity,
                    ),

                  if (Responsive.isMobile(context)) Gap(2.w),



                  if (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context))
                    Gap(3.h),

                  ///-------------LOGIN BUTTON----------///
                  AuthButton(label: "Login"),


                  if (Responsive.isMobile(context)) Gap(3.w),
                  if (Responsive.isDesktop(context)) Gap(2.h),

                  ///Create an account
                    TextButton(
                        child: Text(
                          "Have not an account?",
                          style: MyTextStyles.authTextButton(context),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            MyRoutes.singUp,
                          );
                        }),

                  ///----Desktop/Tablet View-----///
                  if (Responsive.isMobile(context)) Gap(10.w),
                  if (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context)) Gap(3.h),
                  if (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context))
                    Gap(4.h),


                  ///-------------CONTINUE WITH GOOGLE----------///

                    GoogleButtonWidget(onTap: () {}),



                  if (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context))Gap(5.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///--------------- M E T H O D S -------------///

  String? passwordValidatity(String? value) {
    if (value!.isEmpty) {
      return "Please fill the password field";
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
