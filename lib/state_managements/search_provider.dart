import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/products.dart';  // Import model produk

class SearchProvider with ChangeNotifier {
  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  // Daftar produk yang bisa diakses
  List<Product> _products = demoProducts;  // Menggunakan demoProducts yang sudah ada
  List<Product> get listProducts => _products;

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
