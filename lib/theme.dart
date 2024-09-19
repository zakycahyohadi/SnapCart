import 'package:flutter/material.dart';
import 'constant.dart';

ThemeData themeData() {
  return ThemeData(
    // Nonaktifkan Material 3 jika tidak diperlukan
    useMaterial3: false,

    // Set font global untuk aplikasi
    fontFamily: 'Oswald',

    // Set warna latar belakang aplikasi
    scaffoldBackgroundColor: Colors.white,

    // Konfigurasi AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, // Warna background AppBar
      elevation: 0, // Menghilangkan bayangan di AppBar
      iconTheme: IconThemeData(color: Colors.black), // Warna ikon di AppBar
      titleTextStyle: TextStyle(
        color: Colors.black, // Warna teks judul di AppBar
        fontSize: 18, // Ukuran font teks judul
        fontWeight: FontWeight.bold, // Ketebalan teks judul
      ),
    ),

    // Konfigurasi TextTheme (untuk mengatur gaya teks global)
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: kTextColor, // Warna teks body
        fontSize: 14, // Ukuran teks body
      ),
      titleMedium: TextStyle(
        color: kTextColor, // Warna teks title
        fontSize: 18, // Ukuran teks title
      ),
    ),

    // Mengatur visual density untuk kompatibilitas platform
    visualDensity: VisualDensity.adaptivePlatformDensity,

    // Konfigurasi tema InputDecoration (untuk input forms)
    inputDecorationTheme: inputDecorationTheme(),
  );
}

// Fungsi untuk mengatur InputDecorationTheme
InputDecorationTheme inputDecorationTheme() {
  const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    borderSide: BorderSide(color: kPrimaryColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    labelStyle: const TextStyle(color: kTextColor),
  );
}
