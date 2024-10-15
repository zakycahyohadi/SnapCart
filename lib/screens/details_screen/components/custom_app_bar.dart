import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/rounded_icon_btn.dart';
import 'package:ui_ecommerce/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double rating;

  const CustomAppBar({
    Key ? key,
    required this.rating
  }): super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(width: 5, )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}