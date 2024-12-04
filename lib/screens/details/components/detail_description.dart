import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/favourite_provider.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Menentukan mode terang atau gelap
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Menentukan warna teks dan ikon berdasarkan mode
    Color titleColor = isDarkMode ? Colors.white : Colors.black;
    Color iconColor = isDarkMode ? Colors.redAccent : kSecondaryColor.withOpacity(0.5);
    Color containerColor = isDarkMode ? Colors.grey[800]! : kPrimaryColor.withOpacity(0.2);
    Color clickableTextColor = isDarkMode ? Colors.blue[200]! : kPrimaryColor;
    Color borderColor = isDarkMode ? Colors.white.withOpacity(0.5) : kPrimaryColor.withOpacity(0.5); // Warna border

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Produk
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Text(
            product.title,
            style: TextStyle(
              fontSize: getPropScreenWidth(20),
              color: titleColor, // Menyesuaikan warna teks berdasarkan mode
              fontWeight: FontWeight.bold, // Menambah ketebalan font
            ),
          ),
        ),
        
        // Tombol Favorit dengan Border
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            width: getPropScreenWidth(64),
            decoration: BoxDecoration(
              color: containerColor, // Mengubah warna container
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              border: Border.all(color: borderColor, width: 1.5), // Menambahkan border pada container
            ),
            child: Consumer<FavouriteProvider>(
              builder: (context, favourite, child) => InkWell(
                onTap: () {
                  favourite.toggleFavouriteStatus(product.id);
                },
                child: Icon(
                  Icons.favorite,
                  size: getPropScreenWidth(18),
                  color: product.isFavourite ? iconColor : kSecondaryColor.withOpacity(0.5), // Mengubah warna ikon
                ),
              ),
            ),
          ),
        ),
        
        // Deskripsi Produk
        Padding(
          padding: EdgeInsets.only(
            left: getPropScreenWidth(20),
            right: getPropScreenWidth(64),
          ),
          child: ReadMoreText(
            product.description,
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: clickableTextColor, // Mengubah warna teks "See more"
            trimCollapsedText: "\nSee more details",
            trimExpandedText: "\nSee less details",
            lessStyle: seeMoreStyle,
            moreStyle: seeMoreStyle,
          ),
        )
      ],
    );
  }
}
