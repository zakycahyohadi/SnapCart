import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name, icon;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: getPropScreenWidth(55),
      child: Column(
        children: [
          // Icon container
          Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            height: getPropScreenWidth(55),
            width: getPropScreenWidth(55),
            decoration: BoxDecoration(
              color: isDarkMode ? kPrimaryColor.withOpacity(0.2) : kPrimaryLightColor, // Darker background in dark mode
              borderRadius: BorderRadius.circular(10),
              boxShadow: isDarkMode
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ]
                  : [],
            ),
            child: SvgPicture.asset(
              icon,
              color: isDarkMode ? Colors.white : kPrimaryColor, // Adjust icon color for dark mode
            ),
          ),
          const SizedBox(height: 5),
          // Category name text
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black, // White text in dark mode
              fontWeight: FontWeight.bold,
              fontSize: getPropScreenWidth(14),
            ),
          ),
        ],
      ),
    );
  }
}
