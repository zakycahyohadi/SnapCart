import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/costum_suffix_icon.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/components/form_error.dart';
import 'package:ui_ecommerce/size_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key
  });
  @override
  State < ForgotPasswordForm > createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State < ForgotPasswordForm > {
  final _formKey = GlobalKey < FormState > ();
  String ? email;
  final List < String > errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          ErrorForm(errors: errors),
          SizedBox(height: getProportionateScreenHeight(15)),
          MyDefaultButton(
            text: "Reset Password",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }
  TextFormField emailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
          errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
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
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CostumSuffixicon(
          icon: "assets/icons/Mail.svg",
        )),
    );
  }
}