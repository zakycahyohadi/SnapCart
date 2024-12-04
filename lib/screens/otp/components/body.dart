import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/otp/components/otp_form.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "Secure OTP Verification",
                style: headingStyle,
              ),
              const Text(
                  "Code sent to +62 123 321 ***. Please check your inbox.",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),

                timer(),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                const OtpForm(),
            ],
          ),
        )
      ),
    );
  }


  Row timer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        const Text(
            "This code will expired in ",
            textAlign: TextAlign.center,
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: 60.0, end: 0.0),
            duration: const Duration(seconds: 60),
              builder: (context, value, child) {
                return Text(
                  "00:${value.toInt()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
                );
              },
              onEnd: () {},
          )
      ],
    );
  }
}