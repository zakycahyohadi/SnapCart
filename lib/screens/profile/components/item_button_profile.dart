import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class ItemButtonProfile extends StatelessWidget {
  const ItemButtonProfile({
    super.key, 
    required this.svgIcon, 
    required this.title, 
    required this.press,
  });

  final String svgIcon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    // Mendapatkan mode gelap atau terang
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Menentukan warna latar belakang dan teks berdasarkan mode
    Color backgroundColor = isDarkMode ? kSecondaryColor.withOpacity(0.1) : kSecondaryColor.withOpacity(0.2); // Gunakan kSecondaryColor dengan opacity
    Color textColor = isDarkMode ? Colors.white : kPrimaryColor; // Teks putih di mode gelap, kPrimaryColor di mode terang
    Color iconColor = isDarkMode ? kPrimaryColor : Colors.white; // Ikon warna kPrimaryColor di mode gelap dan putih di mode terang
    Color arrowColor = isDarkMode ? kPrimaryColor : kPrimaryColor; // Warna ikon panah konsisten dengan kPrimaryColor

    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getPropScreenWidth(20),
          vertical: getPropScreenWidth(10),
        ),
        padding: EdgeInsets.all(getPropScreenWidth(20)),
        decoration: BoxDecoration(
          color: backgroundColor,  // Warna latar belakang dinamis menggunakan kSecondaryColor
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              color: iconColor,  // Warna ikon dinamis menggunakan kPrimaryColor
              width: 22,
            ),
            SizedBox(width: getPropScreenWidth(20)),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: getPropScreenWidth(15),
                color: textColor,  // Warna teks dinamis menggunakan kPrimaryColor
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: arrowColor,  // Warna ikon panah dinamis menggunakan kPrimaryColor
            ),
          ],
        ),
      ),
    );
  }
}
