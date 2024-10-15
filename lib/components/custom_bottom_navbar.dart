import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/screens/profile/profile_screen.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key,
    required this.selectedMenu,
  });

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = kSecondaryColor;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: kSecondaryColor.withOpacity(0.15)
          )
        ]
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenu ?
                kPrimaryColor :
                inActiveIconColor
              ),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            ),

            IconButton(
              icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                color: MenuState.favourite == selectedMenu ?
                kPrimaryColor :
                inActiveIconColor
              ),
              onPressed: () {
                // Pastikan Anda mendefinisikan route untuk screen favorit
                Navigator.pushNamed(context, '/favourite');
              }
            ),

            IconButton(
              icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",
                color: MenuState.message == selectedMenu ?
                kPrimaryColor :
                inActiveIconColor
              ),
              onPressed: () {
                // Pastikan Anda mendefinisikan route untuk screen pesan
                Navigator.pushNamed(context, '/message');
              }
            ),

            IconButton(
              icon: SvgPicture.asset("assets/icons/User Icon.svg",
                color: MenuState.profile == selectedMenu ?
                kPrimaryColor :
                inActiveIconColor
              ),
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              }
            ),
          ],
        ),
      ),
    );
  }
}