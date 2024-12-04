/* Saving All Constant Values */

import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

const kPrimaryColor = Color.fromARGB(255, 255, 64, 129); // Warna pink utama
const kPrimaryLightColor = Color.fromARGB(255, 255, 183, 197); // Warna pink muda untuk efek terang
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 255, 123, 170), // Pink lebih terang
    Color.fromARGB(255, 255, 64, 129),  // Pink utama untuk kontras
  ]
);

const kSecondaryColor = Color(0xff979797); // Bisa dipertahankan atau diganti dengan warna lain sesuai tema
const kTextColor = Color(0xff757575); // Warna teks netral
const kInActiveIconColor = Color(0xFFB6B6B6); // Warna ikon tidak aktif



const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getPropScreenWidth(28),
  fontWeight: FontWeight.bold,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";

// Complete Profile
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter address";

// OTP style

final otpDecoration = InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: getPropScreenHeight(15),
                    ),
                    enabledBorder: otpOutlineInputBorder(),
                    focusedBorder: otpOutlineInputBorder(),
                    border: otpOutlineInputBorder(),
                  );

OutlineInputBorder otpOutlineInputBorder() {
  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: kTextColor),
                  );
}

const defaultDuration = Duration(milliseconds: 250);

// const for see more
TextStyle seeMoreStyle = TextStyle(
    fontSize: getPropScreenWidth(16),
    fontWeight: FontWeight.bold,
    color: kPrimaryColor);
