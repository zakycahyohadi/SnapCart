import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

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
        Spacer(
          flex: 2,
        ),
        Text('SnapCart',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
        Spacer(),
        Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: getProportionateScreenWidth(14),
            color: kSecondaryColor
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(image, height: getProportionateScreenHeight(265), width: getProportionateScreenWidth(235), ),
      ],
    );
  }
}