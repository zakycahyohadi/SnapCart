import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/components/rounded_icon_button.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/screens/details/components/color_picker.dart';
import 'package:ui_ecommerce/screens/details/components/detail_description.dart';
import 'package:ui_ecommerce/screens/details/components/image_detail.dart';
import 'package:ui_ecommerce/screens/details/components/rounded_container.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'package:ui_ecommerce/state_managements/favourite_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentSelectedColor = 0;
  int totalSelected = 1;

  @override
  Widget build(BuildContext context) {
    // Cek apakah saat ini mode gelap atau terang
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Menentukan warna untuk mode gelap dan terang (tanpa tombol warna)
    Color textColor = isDarkMode ? Colors.white : Colors.black;

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageDetail(product: widget.product),
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailDescription(product: widget.product),
                  SizedBox(height: getPropScreenHeight(40)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
                    child: Row(
                      children: [
                        // Pilihan Warna
                        ...List.generate(
                          widget.product.colors.length, (index) {
                            final Color color = widget.product.colors[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentSelectedColor = index;
                                });
                              },
                              child: ItemColorDot(
                                color: color,
                                isSelected: index == currentSelectedColor,
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        SizedBox(
                          height: getPropScreenHeight(40),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundedIconBtn(
                                icon: Icons.remove,
                                showShadow: true, 
                                press: () {
                                  setState(() {
                                    if (totalSelected > 1) {
                                      totalSelected--;
                                    }
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "$totalSelected",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: textColor, // Warna teks jumlah item
                                  ),
                                ),
                              ),
                              RoundedIconBtn(
                                icon: Icons.add, 
                                showShadow: true,
                                press: () {
                                  setState(() {
                                    totalSelected++;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getPropScreenWidth(70),
                      vertical: getPropScreenHeight(60),
                    ),
                    child: MyDefaultButton(
                      text: "Add To Cart", 
                      press: () {
                        // Menambah item ke keranjang
                        Provider.of<CartProvider>(context, listen: false).addCartItem(
                          Cart(
                            product: widget.product, 
                            numOfItem: totalSelected
                          )
                        );

                        // Toggle favorit jika sudah favorit
                        if (widget.product.isFavourite) {
                          Provider.of<FavouriteProvider>(context, listen: false).toggleFavouriteStatus(widget.product.id);
                        }
                        
                        // Menampilkan pesan snack bar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added to cart :)"))
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
