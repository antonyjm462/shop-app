import 'package:flutter/material.dart';

class ShoeModel {
  String name;
  String model;
  double price;
  String imgAddress;
  Color modelColor;
  String category;
  int quantity;

  ShoeModel({
    required this.name,
    required this.model,
    required this.price,
    required this.imgAddress,
    required this.modelColor,
    required this.category,
    this.quantity = 1,
  });
}