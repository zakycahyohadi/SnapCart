import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/home/components/categories.dart';
import 'package:ui_ecommerce/screens/home/components/discount_banner.dart';
import 'package:ui_ecommerce/screens/home/components/home_header.dart';
import 'package:ui_ecommerce/screens/home/components/special_offers.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Categories(),
            SizedBox(height: getProportionateScreenHeight(30)),
            SpecialOffer()
          ],
        ),
      )
    );
  }
}

