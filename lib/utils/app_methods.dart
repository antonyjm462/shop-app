import 'package:flutter/material.dart';
import 'package:shop_app/models/shoe_model.dart';
import 'package:shop_app/services/local_db_service.dart';
import 'package:shop_app/widgets/snack_bar.dart';

class AppMethods {
  AppMethods._();
  static void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(failedSnackBar());
    } else {
      data.quantity = 1;
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar());
    }
  }
}
