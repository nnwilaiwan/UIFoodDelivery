import 'package:flutter/material.dart';
class Product {
  final String image, title;
  final double price;
 

  Product({
    required this.image,
    required this.title,
    required this.price,
   
  });
}

List<Product> demo_product = [
  Product(
    image: "assets/images/hamburger-2.jpg",
    title: "Hamburger 1",
    price: 8.99,
   
  ),
  Product(
    image: "assets/images/hamburger-3.jpg",
    title: "Hamburger 2",
    price: 5.93,
   
  ),
  Product(
    image: "assets/images/hamburger-4.jpg",
    title: "Hamburger 3",
    price: 6.99,
   
  ),
  Product(
    image: "assets/images/hamburger-6.jpg",
    title: "Hamburger 4",
    price: 7.55,
   
  ),
];