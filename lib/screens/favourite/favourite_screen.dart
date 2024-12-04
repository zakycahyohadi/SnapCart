import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/custom_navigation_bar.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/favourite/components/body.dart';
import 'package:ui_ecommerce/state_managements/favourite_provider.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return Scaffold(
          backgroundColor: theme.isDarkMode ? Colors.black : Colors.white,
          appBar: appBar(context, theme),
          body: const Body(),
          bottomNavigationBar: const CustomNavigationBar(menu: MenuState.favorite),
        );
      },
    );
  }

  AppBar appBar(BuildContext context, ThemeProvider theme) {
    return AppBar(
      backgroundColor: theme.isDarkMode ? Colors.black : Colors.white, // Sesuaikan warna AppBar
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Favourite Items",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.isDarkMode ? Colors.white : Colors.black, // Sesuaikan warna teks judul
            ),
          ),
          Consumer<FavouriteProvider>(
            builder: (context, favourite, child) => Text(
              "${favourite.favouriteProducts.length} items",
              style: TextStyle(
                color: theme.isDarkMode ? Colors.white : Colors.black, // Sesuaikan warna teks jumlah item
              ),
            ),
          ),
        ],
      ),
    );
  }
}
