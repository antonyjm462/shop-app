import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/local_db_service.dart';
import '../widgets/snack_bar.dart';

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

  static double sumOfItemsOnBag() {
    double sumPrice = 0.0;
    for (ShoeModel bagModel in itemsOnBag) {
      sumPrice = sumPrice + bagModel.price;
    }
    return sumPrice;
  }
}