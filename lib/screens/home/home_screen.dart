import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/custom_bottom_navbar.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavbar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}