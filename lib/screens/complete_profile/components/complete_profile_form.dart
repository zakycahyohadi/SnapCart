import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/error_form.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/otp/otp_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({
    super.key
  });

  @override
  State < CompleteProfileForm > createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State < CompleteProfileForm > {
  String ? firstName;
  String ? lastName;
  String ? phoneNumber;
  String ? address;

  final _formKey = GlobalKey < FormState > ();
  List < String > errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          firstNameFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          lastNameFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          phoneNumberFormField(),
          SizedBox(height: getPropScreenHeight(20)),
          addressFormField(),
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
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            }
          ),
        ]
      ),
    );
  }

  TextFormField addressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value!.isNotEmpty && errors.contains(kAddressNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kAddressNullError)) {
          setState(() {
            errors.add(kAddressNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Your address here",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.location_on, // Ikon lokasi bawaan Flutter
          size: 28, // Ukuran ikon
          color: kPrimaryColor, // Warna ikon menggunakan kPrimaryColor
        ),
      ),

    );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value!.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Your phone number here",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.phone, // Ikon telepon bawaan Flutter
          size: 28, // Ukuran ikon
          color: kPrimaryColor, // Warna ikon menggunakan kPrimaryColor
        ),
      ),

    );
  }

  TextFormField lastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value!.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Your last name here",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.person, // Ikon user bawaan Flutter
          size: 34, // Ukuran ikon
          color: kPrimaryColor, // Warna ikon menggunakan kPrimaryColor
        ),
      ),

    );
  }

  TextFormField firstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value!.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Your first name here",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.person, // Ikon user bawaan Flutter
          size: 34, // Ukuran ikon
          color: kPrimaryColor, // Warna ikon menggunakan kPrimaryColor
        ),
      ),

    );
  }
}