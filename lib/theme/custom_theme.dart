import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants.dart';

class AppThemes {
  AppThemes._();
  static const TextStyle homeAppBar = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );
  static const TextStyle homeProductName = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle homeProductModel = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  static const TextStyle homeProductPrice = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static const TextStyle homeMoreText = TextStyle(
    fontSize: 22,
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle homeGridNewText = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const TextStyle homeGridNameAndModel = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle homeGridPrice = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsAppBar = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );
  static const TextStyle detailsMoreText = TextStyle(
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    height: 1,
  );
  static final TextStyle detailsProductDescriptions = TextStyle(
    color: AppConstantsColor.unSelectedTextColor,
  );
  static const TextStyle bagEmptyListTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bagEmptyListSubTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle bagProductModel = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppConstantsColor.darkTextColor,
  );
  static const TextStyle bagProductPrice = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppConstantsColor.darkTextColor,
  );
  static const TextStyle bagProductNumOfShoe = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle bagTotalPrice = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static const TextStyle bagSumOfItemOnBag = TextStyle(
    color: AppConstantsColor.darkTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}
