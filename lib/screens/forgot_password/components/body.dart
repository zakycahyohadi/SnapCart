import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/forgot_password/components/forgot_password_form.dart';
import 'package:ui_ecommerce/screens/sign_up/sign_up_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Membuat lebar sebesar mungkin (mengisi seluruh layar)
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.1), // Jarak dari atas
            Text(
              'Forgot Password',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Please enter your email and we will send \nyou a link to return to your account',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            const ForgotPasswordForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            dontHaveAccountText(context),
          ],
        ),
      ),
    );
  }

  Widget dontHaveAccountText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black54,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: Text(
            ' Sign Up',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
