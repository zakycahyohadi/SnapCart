import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/custom_bottom_navbar.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text("Profile",
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
          child: Body(),
      ),
      bottomNavigationBar: CustomBottomNavbar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}