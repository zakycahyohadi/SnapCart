import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'package:ui_ecommerce/state_managements/favourite_provider.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan status dark mode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Consumer<FavouriteProvider>(
      builder: (context, favourite, child) => ListView.builder(
        itemCount: favourite.favouriteProducts.length,
        itemBuilder: (context, index) {
          final Product product = favourite.favouriteProducts[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getPropScreenWidth(20),
              vertical: getPropScreenHeight(10),
            ),
            child: Slidable(
              key: Key(product.id.toString()),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    icon: Icons.shopping_cart,
                    label: 'Cart',
                    padding: EdgeInsets.all(getPropScreenWidth(20)),
                    backgroundColor: isDarkMode
                        ? Colors.greenAccent.withOpacity(0.8) // Sesuaikan dengan kPrimaryColor di dark mode
                        : Colors.greenAccent.withOpacity(0.8), // Sesuaikan dengan kPrimaryColor di mode terang
                    onPressed: (context) {
                      Provider.of<CartProvider>(context, listen: false).addCartItem(Cart(product: product, numOfItem: 1));
                      favourite.toggleFavouriteStatus(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to cart :)"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                  SlidableAction(
                    icon: Icons.delete,
                    label: 'Delete',
                    padding: EdgeInsets.all(getPropScreenWidth(20)),
                    backgroundColor: isDarkMode
                        ? Colors.red.withOpacity(0.8) // Sesuaikan dengan kPrimaryColor di dark mode
                        : Colors.red.withOpacity(0.8), // Sesuaikan dengan kPrimaryColor di mode terang
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    onPressed: (context) {
                      favourite.toggleFavouriteStatus(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Removed from favourite"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getPropScreenWidth(88),
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        padding: EdgeInsets.all(getPropScreenWidth(15)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: isDarkMode ? Colors.grey[850] : kSecondaryColor.withOpacity(0.3), // Background color for product
                        ),
                        child: Image.asset(product.images[0]),
                      ),
                    ),
                  ),
                  SizedBox(width: getPropScreenWidth(15)),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "£${product.price}",
                          style: TextStyle(
                            fontSize: getPropScreenWidth(18),
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor, // Harga mengikuti warna kPrimaryColor
                          ),
                        ),
                      ])),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
