import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/mybottombar/my_bottom_bar.dart';
import 'package:flutter_application_1/provider/nav_provider.dart';
// import 'package:flutter_application_1/screens/loginScreens/login_Screen.dart';
import 'package:flutter_application_1/screens/loginScreens/login_screen.dart';
import 'package:flutter_application_1/screens/payment/payment_screen.dart';
import 'package:flutter_application_1/screens/signup/signup_screen.dart';
import 'package:flutter_application_1/screens/socialmedialogin/login_with_google.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NavbarViewModel(),
          ),
        ],
        child: MaterialApp(
            title: 'MY APP',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                color: AppColors.baseBlackColor,
              )),
              primarySwatch: Colors.blue,
            ),
            //home: LoginWithGoogle(),
            home: LoginScreen()));
  }
}
