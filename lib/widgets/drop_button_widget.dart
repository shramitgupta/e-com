import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/stylies/detail_screen_stylies.dart';

class DropButton extends StatefulWidget {
  final String hintText;
  String ratingController;
  final List<String> item;
  DropButton(
      {required this.hintText,
      required this.ratingController,
      required this.item});
  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          fillColor: AppColors.baseWhiteColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        hint: Text(
          "${widget.hintText}",
          style: DetailScreenStylies.productDropDownValueStyle,
        ),
        value: widget.ratingController,
        items: widget.item
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            widget.ratingController = value!;
          });
        },
      ),
    );
  }
}
