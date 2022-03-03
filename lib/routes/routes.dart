import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class PageRouting {
  static goToNextPage(
      {required BuildContext context, required Widget mavigateTo}) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => mavigateTo),
    );
  }
}
