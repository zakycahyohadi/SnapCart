import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/error_form.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key
  });

  @override
  State < SignUpForm > createState() => _SignUpFormState();
}

class _SignUpFormState extends State < SignUpForm > {
  String ? email;
  String ? password;
  String ? confirmPassword;

  final _formKey = GlobalKey < FormState > ();
  List < String > errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          SizedBox(height: getPropScreenHeight(30)),
          passwordFormField(),
          SizedBox(height: getPropScreenHeight(30)),
          passwordConfirmationFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          ErrorForm(errors: errors),
          SizedBox(height: getPropScreenHeight(20)),
          MyDefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }

              if (errors.isEmpty) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            }
          ),
        ]
      ),
    );
  }

  TextFormField passwordConfirmationFormField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (password == value) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty || errors.contains(kMatchPassError)) {
          return "";
        } else if (value != password) {
          setState(() {
            errors.add(kMatchPassError);
          });
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password Confirmation",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock,
          size: 28.0,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        setState(() {
          password = value;
        });
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
        suffixIcon: Icon(Icons.lock,
          size: 28.0,
          color: kPrimaryColor
        ),
      ),
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
        } else if (emailValidatorRegExp.hasMatch(value) &&
          errors.contains(kInvalidEmailError)) {
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
        } else if (!emailValidatorRegExp.hasMatch(value) &&
          (!errors.contains(kPassNullError) &&
            !errors.contains(kInvalidEmailError))) {
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
        suffixIcon: Icon(Icons.email_rounded,
          size: 28.0,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}