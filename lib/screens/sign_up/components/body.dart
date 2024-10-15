import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/social_media_icon.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Menambahkan padding agar form tidak terlalu rapat ke pinggir
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  'Register account',
                  style: headingStyle,
                ),
                const SizedBox(height: 16), // Tambahkan jarak antar elemen
                  const Text(
                      'Complete your details or continue \nwith social media',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.07), // Tambahkan jarak sebelum form
                    SignUpForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Spacer(),
                        SocialMediaIcon(
                          icon: 'assets/icons/google-icon.svg',
                          press: () {},
                        ),
              
                        SocialMediaIcon(
                          icon: 'assets/icons/facebook-2.svg',
                          press: () {},
                        ),
              
                        SocialMediaIcon(
                          icon: 'assets/icons/twitter.svg',
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                    )
              ],
            ),
          ),
      ),
    );
  }
}