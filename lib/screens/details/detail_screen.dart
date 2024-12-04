import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/screens/details/components/body.dart';
import 'package:ui_ecommerce/size_config.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Menentukan apakah dalam mode gelap atau terang
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Warna AppBar berdasarkan mode
    Color appBarColor = isDarkMode ? Colors.black : Colors.white;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color iconColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: appBarColor, // Menyesuaikan warna AppBar
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: iconColor, // Warna ikon kembali sesuai dengan mode
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
            child: Row(
              children: [
                Text(
                  "${product.rating}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor, // Warna teks sesuai dengan mode
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
      body: Body(product: product), // Body tetap sama
    );
  }
}
