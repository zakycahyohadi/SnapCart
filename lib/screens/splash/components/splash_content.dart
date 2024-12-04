import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'SnapCart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getPropScreenWidth(36),
            color: kPrimaryColor,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: getPropScreenWidth(14), color: kSecondaryColor),
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getPropScreenHeight(265),
          width: getPropScreenWidth(235),
        ),
      ],
    );
  }
}