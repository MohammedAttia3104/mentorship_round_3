import 'package:flutter/material.dart';

import '../../product_details/models/product.dart';


List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "https://i.postimg.cc/c19zpJ6f/Image-Popular-Product-1.png",
      "https://i.postimg.cc/zBLc7fcF/ps4-console-white-2.png",
      "https://i.postimg.cc/KYpWtTJY/ps4-console-white-3.png",
      "https://i.postimg.cc/YSCV4RNV/ps4-console-white-4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: ["https://i.postimg.cc/CxD6nH74/Image-Popular-Product-2.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: ["https://i.postimg.cc/1XjYwvbv/glap.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: ["https://i.postimg.cc/d1QWXMYW/Image-Popular-Product-3.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: false,
    isPopular: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

 const starIcon = 'assets/svgs/star.svg';

const heartIcon = 'assets/svgs/heart.svg';