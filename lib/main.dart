import 'package:flutter/material.dart';
// import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/routes.dart';
import 'package:ui_ecommerce/screens/splash/splash_screen.dart';
import 'package:ui_ecommerce/theme.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }

  ThemeData themeData() {
    return ThemeData(
      fontFamily: 'Muli',
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme()
    );
  }
} // main app