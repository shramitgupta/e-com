import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';

class ShowAllWidget extends StatelessWidget {
  final String leftText;
  ShowAllWidget({required this.leftText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
              fontSize: 17,
              color: AppColors.baseBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Show All",
            style: TextStyle(
              fontSize: 17,
              color: AppColors.baseDarkPinkColor,
            ),
          ),
        ],
      ),
    );
  }
}
