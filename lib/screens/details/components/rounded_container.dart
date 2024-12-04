import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Mendapatkan mode tema yang aktif (gelap atau terang)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Menentukan warna latar belakang untuk gelap atau terang
    Color backgroundColor = isDarkMode
        ? Colors.grey[800]! // Warna latar belakang gelap
        : kSecondaryColor.withOpacity(0.1); // Warna latar belakang terang

    return Container(
      margin: EdgeInsets.only(top: getPropScreenWidth(20)),
      padding: EdgeInsets.only(top: getPropScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor, // Menggunakan warna dinamis berdasarkan mode
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: child,
    );
  }
}
