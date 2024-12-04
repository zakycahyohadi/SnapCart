import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/favourite/favourite_screen.dart';
import 'package:ui_ecommerce/screens/profile/profile_screen.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.menu,
  });

  final MenuState menu;

  @override
  Widget build(BuildContext context) {
    return Consumer < ThemeProvider > (
      builder: (context, theme, child) => Container(
        padding: EdgeInsets.symmetric(
          vertical: getPropScreenHeight(15),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getPropScreenWidth(25)),
            topRight: Radius.circular(getPropScreenWidth(25)),
          ),
          color: theme.isDarkMode ? Colors.black87 : Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 15,
              color: theme.isDarkMode
                  ? kPrimaryColor.withOpacity(0.4) // Shadow color in dark mode
                  : const Color(0xFFDADADA).withOpacity(0.3), // Light shadow color
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getPropScreenWidth(25)),
            topRight: Radius.circular(getPropScreenWidth(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == menu ?
                  kPrimaryColor :
                  theme.isDarkMode ? Colors.white : kInActiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, FavouriteScreen.routeName);
                },
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",
                  color: MenuState.favorite == menu ?
                  kPrimaryColor :
                  theme.isDarkMode ? Colors.white : kInActiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: theme.isDarkMode ? Colors.white : kInActiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == menu ?
                  kPrimaryColor :
                  theme.isDarkMode ? Colors.white : kInActiveIconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
