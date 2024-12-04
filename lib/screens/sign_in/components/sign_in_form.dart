import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/error_form.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ui_ecommerce/screens/login_success/login_success_screen.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/auth_provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key
  });

  @override
  State < SignInForm > createState() => _SignInFormState();
}

class _SignInFormState extends State < SignInForm > {
  final _frontKey = GlobalKey < FormState > ();
  String ? email;
  String ? password;
  final List < String > errors = [];

  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _frontKey,
      child: Column(
        children: [
          // email field
          emailFormField(),
          SizedBox(height: getPropScreenHeight(30)),
          // password field
          passwordFormField(),
          SizedBox(height: getPropScreenHeight(30)),
          rememberAndForgot(),
          SizedBox(height: getPropScreenHeight(20)),
          ErrorForm(errors: errors),
          SizedBox(height: getPropScreenHeight(20)),
          MyDefaultButton(
            text: "Sign In",
            press: () {
              if (_frontKey.currentState!.validate()) {
                _frontKey.currentState!.save();
              }

              if (errors.isEmpty) {
                Provider.of < AuthProvider > (context, listen: false).setAuth(true, email : email);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          )
        ],
      ));
  }

  Row rememberAndForgot() {
    return Row(
      children: [
        Checkbox(
          value: remember,
          onChanged: (value) {
            setState(() {
              remember = value!;
            });
          },
          activeColor: kPrimaryColor,
        ),
        const Text("Remember Me"),
          const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
              },
              child: const Text(
                "Forgot Password", style: TextStyle(
                  color: kPrimaryColor,
                  decoration: TextDecoration.underline
                ),
              ),
            ),
      ],
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && (!errors.contains(kShortPassError) && !errors.contains(kPassNullError))) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Your password here",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock, // Ganti dengan ikon yang sesuai
          size: 28.0,
          color: kPrimaryColor, // Ganti warna menjadi hitam
        ),
      )

    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value!.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) && (!errors.contains(kPassNullError) && !errors.contains(kInvalidEmailError))) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Your email here",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.email, // Ganti dengan ikon yang sesuai
          size: 28.0,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}