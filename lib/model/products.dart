import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Colors.black,
      const Color.fromARGB(255, 0, 104, 188),
      const Color.fromARGB(255, 182, 12, 0),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: "Experience the freedom of wireless gaming with our PS4 controller, designed for precision and comfort. This controller features Bluetooth connectivity, ensuring a stable and responsive connection with your console for uninterrupted play. The ergonomic design and textured grips provide a comfortable hold during extended gaming sessions.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Colors.black,
      const Color.fromARGB(255, 0, 63, 115),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pants",
    price: 50.05,
    description: "Elevate your workout style with the Nike Sport White Men's Pants, combining comfort, performance, and sleek design. Made from lightweight, moisture-wicking fabric, these pants keep you cool and dry during intense training sessions. With an athletic fit, they offer a full range of motion, and the adjustable drawstring waistband ensures a secure, personalized fit.",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Colors.black,
      const Color.fromARGB(255, 134, 134, 134),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: "Experience ultimate grip and comfort with the Gloves XC Omega from Polygon, designed for cyclists who demand performance and durability. These gloves feature a breathable, lightweight fabric that keeps your hands cool, even on long rides. The padded palm provides enhanced shock absorption and reduces hand fatigue.",
    rating: 4.3,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Colors.black,
      const Color.fromARGB(255, 18, 130, 221),
      Colors.white,
    ],
    title: "Logitech - Gaming Headset",
    price: 20.20,
    description: "Elevate your audio experience with the Logitech Headset, perfect for immersive gaming, video conferencing, and music listening. This headset features premium sound quality with deep bass and crystal-clear highs, allowing you to enjoy rich, detailed audio. The lightweight design and plush ear cushions ensure all-day comfort, while the adjustable headband provides a secure, custom fit.",
    rating: 4.6,
    isFavourite: true,
  ),
  // Additional Products
  Product(
    id: 5,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Colors.black,
      const Color.fromARGB(255, 56, 163, 212),
      Colors.white,
    ],
    title: "Smart Watch X500",
    price: 150.00,
    description: "Stay connected and active with the Smart Watch X500. Track your fitness goals, monitor heart rate, and receive notifications from your phone with this sleek, stylish watch. The waterproof design and long battery life make it the perfect companion for both workouts and daily wear.",
    rating: 4.5,
    isFavourite: false,
    isPopular: false,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Colors.black,
      const Color.fromARGB(255, 255, 87, 34),
      Colors.white,
    ],
    title: "assets/images/wireless headset.png",
    price: 999.99,
    description: "The Laptop Pro M1 offers the best in performance and design. With the latest M1 chip, it's built for multitasking and high-performance gaming, all while maintaining long battery life. The sleek design and ultra-lightweight build make it perfect for professionals and students on the go.",
    rating: 4.9,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Colors.white,
      const Color.fromARGB(255, 0, 0, 0),
    ],
    title: "Wireless AirPods Pro",
    price: 199.99,
    description: "Experience premium sound quality with the Wireless AirPods Pro. These earphones are designed for ultimate comfort and noise cancellation. Whether you're commuting or working out, enjoy crystal-clear audio and seamless connectivity with Apple devices.",
    rating: 4.7,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 8,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Colors.pink,
      Colors.black,
      Colors.white,
    ],
    title: "Phone Case XS Max",
    price: 25.50,
    description: "Protect your phone in style with the Phone Case XS Max. Made from durable materials, this case shields your phone from drops and scratches while adding a fashionable touch. Available in multiple colors to suit your style.",
    rating: 4.4,
    isFavourite: false,
    isPopular: true,
  ),
];
