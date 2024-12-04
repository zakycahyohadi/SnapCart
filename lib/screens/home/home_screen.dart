import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/custom_navigation_bar.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/home/components/body.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return Container(
            color: theme.isDarkMode ? Colors.black : Colors.white, // Set background color based on dark mode
            child: const Body(),
          );
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(menu: MenuState.home),
    );
  }
}
