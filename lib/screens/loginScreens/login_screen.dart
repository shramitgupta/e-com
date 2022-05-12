import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/mybottombar/my_bottom_bar.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screens/homepage/home_page.dart';
import 'package:flutter_application_1/screens/signup/signup_screen.dart';
import 'package:flutter_application_1/screens/socialmedialogin/login_with_google.dart';
import 'package:flutter_application_1/stylies/login_screen_stylies.dart';
import 'package:flutter_application_1/svgimages/svg_images.dart';
import 'package:flutter_application_1/widgets/my_textfromfield_widget.dart';
import 'package:flutter_application_1/widgets/my_button_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget buildTopPart() {
    return Column(
      children: [
        Image.asset(
          "images/Logo.png",
          height: 150,
        ),
        Column(
          children: [
            MyTextFromField("E-mail", false, emailController),
            MyTextFromField("Password", true, passController),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MaterialButton(
                  color: AppColors.baseGrey10Color,
                  height: 55,
                  elevation: 0,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: LoginScreenStylies.signupButtonTextStylies,
                    ),
                  ),
                  onPressed: () async {
                    UserCredential? credential;
                    try {
                      credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.value.text,
                              password: passController.value.text);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        log('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        log('Wrong password provided for that user.');
                      }
                    }
                    if (credential?.user != null) {
                      PageRouting.goToNextPage(
                          context: context, navigateTo: Navbar());
                    }
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: MaterialButton(
                  color: AppColors.baseGrey10Color,
                  height: 55,
                  elevation: 0,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: LoginScreenStylies.signupButtonTextStylies,
                    ),
                  ),
                  onPressed: () {
                    PageRouting.goToNextPage(
                        context: context, navigateTo: SignupScreen());
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Forgot password?",
          style: LoginScreenStylies.forgotPasswordStylies,
        ),
      ],
    );
  }

  Widget buildSocialButton(Widget child, Function onPressed) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: AppColors.baseGrey40Color,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: () {},
      child: child,
    );
  }

  Widget buildBottomPart({required BuildContext context}) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "or sign in with social networks",
            style: LoginScreenStylies.signinSocialStylies,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                MaterialButton(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: AppColors.baseGrey40Color),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                MaterialButton(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: AppColors.baseGrey40Color),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    PageRouting.goToNextPage(
                        context: context, navigateTo: LoginWithGoogle());
                  },
                  child: SvgPicture.asset(
                    SvgImages.google,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                MaterialButton(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: AppColors.baseGrey40Color),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.twitter,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTopPart(),
                  buildBottomPart(context: context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
