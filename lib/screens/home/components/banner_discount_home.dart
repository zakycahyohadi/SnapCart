import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';

class BannerDiscountHome extends StatelessWidget {
  const BannerDiscountHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => Container(
        margin: EdgeInsets.all(getPropScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getPropScreenWidth(20),
          vertical: getPropScreenHeight(15),
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.isDarkMode ? Color(0xff1F1B24) : Color(0xff4a3298),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 10,
              color: theme.isDarkMode
                  ? Colors.black.withOpacity(0.4)
                  : Colors.transparent,
            ),
          ],
        ),
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              color: theme.isDarkMode ? Colors.white : Colors.white,
            ),
            children: [
              const TextSpan(
                text: "A Summer Surprise\n",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: "Cashback 20%",
                style: TextStyle(
                  fontSize: getPropScreenWidth(24),
                  fontWeight: FontWeight.bold,
                  color: theme.isDarkMode ? Colors.orange : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
