import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/custom_navigation_bar.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/profile/components/body.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return Scaffold(
          backgroundColor: theme.isDarkMode ? Colors.black : Colors.white, // Sesuaikan warna latar belakang dengan tema
          appBar: appBar(context, theme), // Kirim theme ke appBar untuk disesuaikan
          body: const Body(), // Body tetap sama
          bottomNavigationBar: const CustomNavigationBar(menu: MenuState.profile),
        );
      },
    );
  }

  AppBar appBar(BuildContext context, ThemeProvider theme) {
    return AppBar(
      backgroundColor: theme.isDarkMode ? Colors.black : Colors.white, // Sesuaikan appBar dengan tema
      leading: Container(),
      centerTitle: true,
      title: const Text(
        "Your Profile",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            theme.isDarkMode ? Icons.wb_sunny_rounded : Icons.nightlight_round,
            color: theme.isDarkMode ? kPrimaryColor : kPrimaryColor, // Sesuaikan warna ikon berdasarkan tema
          ),
          onPressed: () {
            theme.toggleTheme(!theme.isDarkMode); // Toggle tema ketika ikon ditekan
          },
        ),
      ],
    );
  }
}
