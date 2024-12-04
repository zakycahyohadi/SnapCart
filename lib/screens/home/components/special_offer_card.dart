import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.image,
    required this.category,
    required this.numOfBrands,
    required this.press,
  });

  final String image, category, numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            // Gambar latar belakang dengan efek pada dark mode
            Container(
              width: getPropScreenWidth(242),
              height: getPropScreenWidth(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                boxShadow: isDarkMode
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ]
                    : [],
              ),
            ),
            // Gradient layer untuk tampilan lebih tajam
            Container(
              width: getPropScreenWidth(242),
              height: getPropScreenWidth(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: isDarkMode
                      ? [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.3)]
                      : [Colors.black.withOpacity(0.3), Colors.black.withOpacity(0.1)],
                ),
              ),
            ),
            // Text untuk kategori dan jumlah merek
            Positioned(
              left: getPropScreenWidth(10),
              top: getPropScreenWidth(10),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getPropScreenWidth(18),
                  ),
                  children: [
                    TextSpan(
                      text: "$category\n",
                      style: TextStyle(
                        fontSize: getPropScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "$numOfBrands Brands",
                      style: TextStyle(
                        fontSize: getPropScreenWidth(14),
                        fontWeight: FontWeight.normal,
                        color: isDarkMode ? Colors.grey[400] : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
