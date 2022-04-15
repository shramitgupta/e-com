import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';

class ToggleButtonWidget extends StatefulWidget {
  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButtonWidget> {
  List<bool> isSelected = [true, false, false];
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  late List<FocusNode> focusToggle;
  @override
  void initState() {
    focusToggle = [focusNodeButton1, focusNodeButton2, focusNodeButton3];
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();
    focusNodeButton3.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderWidth: 0,
      focusColor: null,
      fillColor: Colors.transparent,
      selectedColor: AppColors.baseDarkPinkColor,
      disabledColor: AppColors.baseBlackColor,
      selectedBorderColor: Colors.transparent,
      focusNodes: focusToggle,
      children: [
        Icon(
          Icons.grid_view,
          size: 25,
        ),
        Icon(
          Icons.view_agenda_outlined,
          size: 25,
        ),
        Icon(
          Icons.crop_square_sharp,
          size: 25,
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < isSelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
        });
      },
      isSelected: isSelected,
    );
  }
}
