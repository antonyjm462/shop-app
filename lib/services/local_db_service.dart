import 'package:flutter/material.dart';

import '../models/models.dart';

final List<ShoeModel> availableShoes = [
  ShoeModel(
    name: "NIKE",
    model: "AIR-MAX",
    price: 130.00,
    imgAddress: "assets/images/nike1.png",
    modelColor: const Color(0xffDE0106),
    category: "Nike",
  ),
  ShoeModel(
    name: "ADIDAS",
    model: "ULTRABOOST",
    price: 180.00,
    imgAddress: "assets/images/nike2.png",
    modelColor: const Color(0xff3F7943),
    category: "Adidas",
  ),
  ShoeModel(
    name: "JORDAN",
    model: "RETRO HIGH",
    price: 200.00,
    imgAddress: "assets/images/nike3.png",
    modelColor: const Color(0xffE66863),
    category: "Jordan",
  ),
  ShoeModel(
    name: "PUMA",
    model: "RS-X",
    price: 120.00,
    imgAddress: "assets/images/nike4.png",
    modelColor: const Color(0xffD7D8DC),
    category: "Puma",
  ),
  ShoeModel(
    name: "GUCCI",
    model: "ACE SNEAKER",
    price: 650.00,
    imgAddress: "assets/images/nike5.png",
    modelColor: const Color(0xff37376B),
    category: "Gucci",
  ),
  ShoeModel(
    name: "TOM FORD",
    model: "WARWICK",
    price: 890.00,
    imgAddress: "assets/images/nike6.png",
    modelColor: const Color(0xffE4E3E8),
    category: "Tom Ford",
  ),
  ShoeModel(
    name: "KOIO",
    model: "CAPRI",
    price: 250.00,
    imgAddress: "assets/images/nike7.png",
    modelColor: const Color(0xffD68043),
    category: "Koio",
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike8.png",
    modelColor: const Color(0xffE2E3E5),
    category: "Nike",
  ),
  ShoeModel(
    name: "ADIDAS",
    model: "NMD R1",
    price: 140.00,
    imgAddress: "assets/images/nike9.png",
    modelColor: const Color(0xff37376B),
    category: "Adidas",
  ),
  ShoeModel(
    name: "JORDAN",
    model: "DELTA",
    price: 160.00,
    imgAddress: "assets/images/nike10.png",
    modelColor: const Color(0xffDE0106),
    category: "Jordan",
  ),
];

List<ShoeModel> itemsOnBag = [];

List<String> get categories =>
    availableShoes.map((shoe) => shoe.category).toSet().toList();

final List featured = ['New', 'Featured', 'Upcoming'];

final List<double> sizes = [6, 7, 8, 9, 10, 11, 12];
