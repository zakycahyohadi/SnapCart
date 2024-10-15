import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/social_media_icon.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/sign_in/components/sign_in_form.dart';
import 'package:ui_ecommerce/screens/sign_up/sign_up_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    super.key
  });

  @override
  State < Body > createState() => _BodyState();
}

class _BodyState extends State < Body > {

  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Text('Welcome Back',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Sign in with your email and password \nor continue with social media.',
              style: TextStyle(
                
              ),
                  textAlign: TextAlign.center,
                  
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.06,
                ),
                SignInForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.06,
                ),
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
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      
                      child: Text(' Sign Up',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      )
    );
  }
}

