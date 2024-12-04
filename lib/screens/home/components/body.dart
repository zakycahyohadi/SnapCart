import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/screens/details/detail_screen.dart';
import 'package:ui_ecommerce/screens/home/components/banner_discount_home.dart';
import 'package:ui_ecommerce/screens/home/components/categories_home.dart';
import 'package:ui_ecommerce/screens/home/components/header_home_part.dart';
import 'package:ui_ecommerce/screens/home/components/popular_products.dart';
import 'package:ui_ecommerce/screens/home/components/special_offers.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/search_provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getPropScreenHeight(20)),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    const HeaderHomePart(),
                    SizedBox(height: getPropScreenHeight(10)),
                    const BannerDiscountHome(),
                    const Categories(),
                    const SpecialOffers(),
                    SizedBox(height: getPropScreenHeight(20)),
                    const PopularProducts(),
                    SizedBox(height: getPropScreenHeight(20)),
                  ],
                ),
                Positioned(
                  top: 60,  // Adjust this for correct positioning
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
          ],
        ),
      ),
    );
  }

  // Improved suggestion list with adjustments for compactness
  Widget _buildSuggestionsList(String searchQuery, BuildContext context) {
    final suggestions = _getSuggestions(searchQuery, context);
    final itemHeight = 60.0;  // Adjust item height for compactness

    final containerHeight = suggestions.length * itemHeight;

    return Container(
      height: containerHeight > 300 ? 300 : containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),  // Smoother corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Softer shadow to avoid extra space
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true, // Ensures the list wraps tightly around its content
        physics: BouncingScrollPhysics(),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return _buildSuggestionItem(suggestion, context);
        },
      ),
    );
  }

  // Build each suggestion item with improved styles
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
          border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
        ),
        child: Row(
          children: [
            Icon(Icons.shopping_bag, color: kPrimaryColor),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                suggestion.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,  // Slightly bigger font size for better readability
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
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
