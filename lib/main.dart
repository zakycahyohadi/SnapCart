import 'package:flutter/material.dart';
import 'package:ui_ecommerce/routes.dart';
import 'package:ui_ecommerce/screens/splash/splash_screen.dart';
import 'package:ui_ecommerce/theme.dart'; // Assuming you have a theme file

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

  // Theme configuration with custom font and text theme
  ThemeData themeData() {
    return ThemeData(
      fontFamily: 'Oswald', // Using the Oswald font
      scaffoldBackgroundColor: Colors.white, // Set background color to white
      textTheme: TextTheme(), // Custom TextTheme
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme(), // Define this function in theme.dart if used
    );
  }
}