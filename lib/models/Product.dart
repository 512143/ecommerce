import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Офисная",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "поясная сумка",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Темный асфальт",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Старая мода",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Офиснная",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Офисная",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
  
];
List<Product> productZoloto=[
  Product(
    id: 1,
    title: "Кольцо золотое",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/jewelry.png",
    color: Colors.yellowAccent,
  ),
  Product(
    id: 2,
    title: "Ожерелье Рубин",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/jewelry1.png",
    color: Colors.red,
  ),
  Product(
    id: 3,
    title: "Серьги Рубин",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/jewelry2.png",
    color: Colors.redAccent,
  ),
  Product(
    id: 4,
    title: "Офисная",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/jewelry3.png",
    color: Colors.grey,
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
