import 'package:flutter/material.dart';
import 'package:notes/components/theme/colors.dart';

class MyTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.buttonColor),
      useMaterial3: true,
      scaffoldBackgroundColor: MyColors.scaffoldBgColor,
    inputDecorationTheme: InputDecorationTheme(


    )
  );
}
