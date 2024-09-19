// import 'package:flutter/material.dart';


// const kPrimaryColor = Color(0xffff7643);
// const kPrimaryLightColor = Color(0xffffecdf);
// // this is list for Gradient
// const kPrimaryGradientColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [
//     Color(0xffffa53e),
//     Color(0xffff7643),
//   ],
// );
// const kSecondaryColor = Color(0xff979797);
// const kTextColor = Color(0xff757575);
// const kBackgroundColor = Color(0xffF2F2F2);






// import 'package:flutter/material.dart';

// const kPrimaryColor = Color(0xff1E88E5); // Bright Blue - elegan dan modern
// const kPrimaryLightColor = Color(0xffE3F2FD); // Soft Blue - lembut dan menenangkan
// // this is list for Gradient
// const kPrimaryGradientColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [
//     Color(0xff0288D1), // Strong Blue - memberikan kesan profesional
//     Color(0xff1E88E5), // Bright Blue - konsisten dan modern
//   ],
// );
// const kSecondaryColor = Color(0xffFF5722); // Bold Orange - aksen cerah yang menarik perhatian
// const kTextColor = Color(0xff424242); // Deep Gray - kontras yang nyaman untuk teks
// const kBackgroundColor = Color(0xffFAFAFA); // Soft Gray - latar belakang bersih dan elegan





import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

const kPrimaryColor = Color.fromARGB(255, 255, 64, 129); // Bright Pink - cerah dan mencolok
const kPrimaryLightColor = Color(0xffF8BBD0); // Light Pink - lembut dan menyegarkan
// this is list for Gradient
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffFF80AB), // Light Pink - cerah dan energik
    Color(0xffFF4081), // Bright Pink - utama dan menarik
  ],
);
const kSecondaryColor = Color(0xff4CAF50); // Fresh Green - aksen cerah yang segar
const kTextColor = Color(0xff212121); // Charcoal Gray - kontras yang nyaman untuk teks
const kBackgroundColor = Color(0xffF5F5F5); // Light Gray - latar belakang bersih dan modern






// animation duration
const kAnimationDuration = Duration(milliseconds: 200);


final headingStyle = TextStyle(
            fontSize: getProportionateScreenWidth(28),
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.5
          );


// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAdressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                border: outlineInputBorder()
              );

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: kPrimaryColor),
              );
}