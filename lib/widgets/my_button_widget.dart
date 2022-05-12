import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPress;
  MyButtonWidget(
      {required this.text, required this.color, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        color: Colors.black,
        height: 45,
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        onPressed: () {
          onPress();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
