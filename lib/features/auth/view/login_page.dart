import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:notes/components/routes/routes.dart';
import 'package:notes/components/theme/textstyles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../components/assets/assets.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///-----------SVG Image------------///
              SvgCircleImage(svgFromAsset: MyAssets.userMailingList,radius: 18.w),

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

              AuthTextFieldWidget(
                controller: passwordController,
                icon: FontAwesomeIcons.lock,
                obscure: obscure,
                eyeIcon: true,
                hint: "Enter your password",
                validator: passwordValidatity,
              ),

              Gap(5.w),

              ///-------------LOGIN BUTTON----------///
              AuthButton(label: "Login"),

              Gap(3.w),

              ///Create an account
              TextButton(
                  child: Text(
                    "Have not an account?",
                    style: MyTextStyles.authTextButton,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      MyRoutes.singUp,
                    );
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
