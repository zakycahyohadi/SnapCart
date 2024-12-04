import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/screens/cart/cart_screen.dart';
import 'package:ui_ecommerce/screens/details/detail_screen.dart';
import 'package:ui_ecommerce/screens/home/components/icon_with_trigger.dart';
import 'package:ui_ecommerce/screens/home/components/search_field.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'package:ui_ecommerce/screens/home/components/search_field.dart';
import 'package:ui_ecommerce/state_managements/search_provider.dart'; // Import the SearchField widget

class HeaderHomePart extends StatelessWidget {
  const HeaderHomePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Stack(
        clipBehavior: Clip.none,  // Allow child widgets to overflow outside the stack
        children: [
          // The Row containing the search field and icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SearchField(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                child: Consumer<CartProvider>(
                  builder: (context, cart, child) => IconWithTrigger(
                    svgIcon: "assets/icons/Cart Icon.svg",
                    trigger: cart.cartItems.length.toString(),
                  ),
                ),
              ),
              const IconWithTrigger(
                svgIcon: "assets/icons/Bell.svg",
              ),
            ],
          ),
          // Positioned widget for the suggestions box
          Positioned(
            top: 100,  // Adjust this to set the position where you want the suggestions box
            left: 0,
            right: 0,
            child: Consumer<SearchProvider>(
              builder: (context, searchProvider, child) {
                return searchProvider.searchQuery.isNotEmpty
                    ? _buildSuggestionsList(searchProvider.searchQuery, context)
                    : SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to display the suggestion list
  Widget _buildSuggestionsList(String searchQuery, BuildContext context) {
    final suggestions = _getSuggestions(searchQuery, context);
    final itemHeight = 60.0;

    final containerHeight = suggestions.length * itemHeight;

    return Container(
      height: containerHeight > 300 ? 300 : containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return _buildSuggestionItem(suggestion, context);
        },
      ),
    );
  }

  // Function to build each suggestion item
  Widget _buildSuggestionItem(Product suggestion, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(product: suggestion),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
        ),
        child: Row(
          children: [
            Icon(Icons.shopping_bag, color: kPrimaryColor),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                suggestion.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to get suggestions based on the search query
  List<Product> _getSuggestions(String query, BuildContext context) {
    final products = context.read<SearchProvider>().listProducts;
    return products.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
