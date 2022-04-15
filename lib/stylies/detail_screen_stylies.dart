import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';

class DetailScreenStylies {
  static const TextStyle commpanyTitleStyle = TextStyle(
    color: AppColors.baseBlackColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productModelStyle = TextStyle(
    color: AppColors.baseDarkPinkColor,
  );
  static const TextStyle productPriceStyle = TextStyle(
    color: AppColors.baseBlackColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productOldPriceStyle = TextStyle(
    color: AppColors.baseGrey60Color,
    fontSize: 16,
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productDropDownValueStyle = TextStyle(
    color: AppColors.baseBlackColor,
    fontSize: 22,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    color: AppColors.baseWhiteColor,
    fontSize: 20,
  );
  static const TextStyle descriptionTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.baseBlackColor);
  static const TextStyle SizeGuideTextStyle =
      TextStyle(fontSize: 18.0, color: AppColors.baseBlackColor);
  static const TextStyle youmayalsolikeTextStyle =
      TextStyle(fontSize: 18.0, color: AppColors.baseBlackColor);
  static const TextStyle showAllTextStyle = TextStyle(
    fontSize: 18.0,
    color: AppColors.baseDarkPinkColor,
  );
}
