import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';  // Make sure this file exists with necessary constants
import 'package:ui_ecommerce/size_config.dart';  // This file should handle screen size configurations

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),  // Use 'const' to improve performance when possible
        Text(
          'SnapCart',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: getProportionateScreenWidth(53),
            color: kPrimaryColor,  // Ensure kPrimaryColor is defined in 'constant.dart'
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(30),  // Spacing between the title and the text
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: getProportionateScreenWidth(19),
            color: kSecondaryColor,  // Ensure kSecondaryColor is defined in 'constant.dart'
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(9),
        ),
      // Use Spacer to balance space distribution
        Image.asset(
          image,  // Display the provided image asset
          height: getProportionateScreenHeight(255),  // Atur tinggi gambar
          // fit: BoxFit.cover,  // Atur cara gambar menyesuaikan ukuran
        ),
      ],
    );
  }
}
