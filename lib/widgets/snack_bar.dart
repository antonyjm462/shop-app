import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants.dart';

SnackBar successSnackBar() => SnackBar(
  backgroundColor: AppConstantsColor.materialButtonColor,
  content: const Text('Added Item to your bag!'),
  action: SnackBarAction(
    textColor: AppConstantsColor.lightTextColor,
    label: 'Got it',
    onPressed: () {},
  ),
);

SnackBar failedSnackBar() => SnackBar(
  backgroundColor: AppConstantsColor.unSelectedTextColor,
  content: const Text('Already added this item!'),
  action: SnackBarAction(
    textColor: AppConstantsColor.lightTextColor,
    label: 'Got it',
    onPressed: () {},
  ),
);
