import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';

class ImageDetail extends StatefulWidget {
  const ImageDetail({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Mendapatkan mode tema aktif (gelap atau terang)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Menentukan warna border dan background berdasarkan mode tema
    Color borderColor = isDarkMode ? Colors.white.withOpacity(0.5) : kPrimaryColor.withOpacity(0.2);
    Color selectedBackgroundColor = isDarkMode ? Colors.white.withOpacity(0.1) : kPrimaryLightColor.withOpacity(0.7);
    Color unselectedBackgroundColor = isDarkMode ? Colors.white.withOpacity(0.05) : kPrimaryLightColor.withOpacity(0.2);

    return Column(
      children: [
        SizedBox(
          width: getPropScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.images[currentIndex],
              child: Image.asset(widget.product.images[currentIndex]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.product.images.length,
            (index) {
              return smallImage(index: index, borderColor: borderColor, selectedBackgroundColor: selectedBackgroundColor, unselectedBackgroundColor: unselectedBackgroundColor);
            },
          ),
        ),
      ],
    );
  }

  Widget smallImage({
    required int index,
    required Color borderColor,
    required Color selectedBackgroundColor,
    required Color unselectedBackgroundColor,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: getPropScreenHeight(5)),
        duration: defaultDuration,
        padding: EdgeInsets.all(getPropScreenWidth(8)),
        height: getPropScreenWidth(50),
        width: getPropScreenWidth(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
          color: currentIndex == index ? selectedBackgroundColor : unselectedBackgroundColor,
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
