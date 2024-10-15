import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/costum_suffix_icon.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/components/form_error.dart';
import 'package:ui_ecommerce/screens/otp/otp_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({
    super.key,
  });

  @override
  State < CompleteProfileForm > createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State < CompleteProfileForm > {
  final _formKey = GlobalKey < FormState > ();
  final List < String > errors = [];
  String ? firstName;
  String ? lastName;
  String ? phoneNumber;
  String ? address;

  void addError({
    required String error
  }) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({
    required String error
  }) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildAddressFormField(),
            ErrorForm(errors: errors),
            SizedBox(height: getProportionateScreenHeight(30)),
            MyDefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  // go to OtpScreen
                  Navigator.pushNamed(context, OtpScreen.routeName);
                }
              })

          ],
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kAdressNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kAdressNullError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your Address",
        suffixIcon: CostumSuffixicon(icon: "assets/icons/Location point.svg", ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
          return "";
        }
        return null;
      },

      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        suffixIcon: CostumSuffixicon(icon: "assets/icons/Phone.svg", ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        suffixIcon: CostumSuffixicon(icon: "assets/icons/User.svg", ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kNameNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        suffixIcon: CostumSuffixicon(icon: "assets/icons/User.svg", ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}