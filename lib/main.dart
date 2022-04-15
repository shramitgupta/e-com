import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/mybottombar/my_bottom_bar.dart';
// import 'package:flutter_application_1/screens/loginScreens/login_Screen.dart';
import 'package:flutter_application_1/screens/loginScreens/login_screen.dart';
import 'package:flutter_application_1/screens/signup/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MY APP',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
            color: AppColors.baseBlackColor,
          )),
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen());
  }
}
