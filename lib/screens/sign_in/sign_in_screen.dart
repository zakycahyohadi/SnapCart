// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const SignInScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text('Sign in')
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
          child: Body(),
      ),
    );
  }
}