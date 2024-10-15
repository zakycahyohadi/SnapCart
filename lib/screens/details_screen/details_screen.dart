import 'package:flutter/material.dart';
import 'package:ui_ecommerce/models/Product.dart';
import 'package:ui_ecommerce/screens/details_screen/components/body.dart';
import 'package:ui_ecommerce/screens/details_screen/components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil argumen produk dari ModalRoute
    final ProductDetailsArgument args = ModalRoute.of(context) !.settings.arguments as ProductDetailsArgument;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: args.product.rating),
      body: Body(product: args.product),
    );
  }
}



class ProductDetailsArgument {
  final Product product;

  ProductDetailsArgument({
    required this.product
  });
}











// body: SafeArea(
//   child: Column(
//     children: [
//       Expanded(
//         child: Container(
//           child: Image.asset(args.product.images[0]),
//         ),
//       ),
//       Expanded(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//           child: Column(
//             children: [
//               Text(
//                 args.product.title,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 args.product.description,
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "\$${args.product.price}",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   RoundedIconBtn(
//                     iconData: Icons.add_shopping_cart,
//                     press: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// ),