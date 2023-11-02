import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/components/routes/routes.dart';
import 'package:notes/components/theme/themes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'database/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ///---Instances---//
  final MyTheme myTheme = MyTheme();
  final MyRoutes myRoutes = MyRoutes();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        title: "Notes",
        debugShowCheckedModeBanner: false,
        theme: MyTheme.darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: MyRoutes.login,
        routes: myRoutes.getRoutes,
      ),
    );
  }
}
