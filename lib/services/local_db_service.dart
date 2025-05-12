import 'package:flutter/material.dart';
import 'package:shop_app/models/models.dart';
import 'package:shop_app/utils/constants.dart';

final List<ShoeModel> availableShoes = [
  ShoeModel(
    name: "NIKE",
    model: "AIR-MAX",
    price: 130.00,
    imgAddress: "assets/images/nike1.png",
    modelColor: AppConstantsColor.nikeRedColor,
    category: "Nike",
  ),
  ShoeModel(
    name: "ADIDAS",
    model: "ULTRABOOST",
    price: 180.00,
    imgAddress: "assets/images/nike2.png",
    modelColor: AppConstantsColor.adidasGreenColor,
    category: "Adidas",
  ),
  ShoeModel(
    name: "JORDAN",
    model: "RETRO HIGH",
    price: 200.00,
    imgAddress: "assets/images/nike3.png",
    modelColor: AppConstantsColor.jordanRedColor,
    category: "Jordan",
  ),
  ShoeModel(
    name: "PUMA",
    model: "RS-X",
    price: 120.00,
    imgAddress: "assets/images/nike4.png",
    modelColor: AppConstantsColor.pumaGreyColor,
    category: "Puma",
  ),
  ShoeModel(
    name: "GUCCI",
    model: "ACE SNEAKER",
    price: 650.00,
    imgAddress: "assets/images/nike5.png",
    modelColor: AppConstantsColor.gucciBlueColor,
    category: "Gucci",
  ),
  ShoeModel(
    name: "TOM FORD",
    model: "WARWICK",
    price: 890.00,
    imgAddress: "assets/images/nike6.png",
    modelColor: AppConstantsColor.tomFordGreyColor,
    category: "Tom Ford",
  ),
  ShoeModel(
    name: "KOIO",
    model: "CAPRI",
    price: 250.00,
    imgAddress: "assets/images/nike7.png",
    modelColor: AppConstantsColor.koioOrangeColor,
    category: "Koio",
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike8.png",
    modelColor: AppConstantsColor.nikeLightGreyColor,
    category: "Nike",
  ),
  ShoeModel(
    name: "ADIDAS",
    model: "NMD R1",
    price: 140.00,
    imgAddress: "assets/images/nike9.png",
    modelColor: AppConstantsColor.gucciBlueColor,
    category: "Adidas",
  ),
  ShoeModel(
    name: "JORDAN",
    model: "DELTA",
    price: 160.00,
    imgAddress: "assets/images/nike10.png",
    modelColor: AppConstantsColor.nikeRedColor,
    category: "Jordan",
  ),
];

List<ShoeModel> itemsOnBag = [];

List<String> get categories =>
    availableShoes.map((shoe) => shoe.category).toSet().toList();

final List featured = ['New', 'Featured', 'Upcoming'];

final List<double> sizes = [6, 7, 8, 9, 10, 11, 12];
