import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/size_config.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key, required this.cart,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                color: kSecondaryColor.withOpacity(0.3),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: getPropScreenWidth(15)),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "£${cart.product.price}",
                    style: TextStyle(
                    fontSize: getPropScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor),
                  ),
                  TextSpan(
                    text: " x${cart.numOfItem}",
                    style: const TextStyle(color: kTextColor),
                  )
                ]
              )
            ),
          ],
        )
      ],
    );
  }
}