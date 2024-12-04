import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current theme
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : kPrimaryColor,  // Change AppBar color for dark mode
        title: const Text(
          'Login Success',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: Body(),
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // Change background color for dark mode
    );
  }
}
