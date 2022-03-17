import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';

class HomeScreenStylies {
  static const TextStyle appBarUpperTitleStylies = TextStyle(
    color: AppColors.baseBlackColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle appBarBottomTitleStylies = TextStyle(
    color: Colors.grey,
    fontSize: 13,
  );
  static const TextStyle trendingProductNameStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle trendingProductModelStyle = TextStyle(
    fontSize: 14,
    color: AppColors.baseDarkPinkColor,
  );
  static const TextStyle trendingProductPriceStyle = TextStyle(
    fontSize: 18,
    color: AppColors.baseWhiteColor,
  );
}
