import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/stylies/signup_screen_stylies.dart';
import 'package:flutter_application_1/svgimages/svg_images.dart';
import 'package:flutter_application_1/widgets/my_button_widget.dart';
import 'package:flutter_application_1/widgets/my_textfromfield_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  Widget buildTopPart() {
    return Column(
      children: [
        Image.asset(
          "images/Logo.png",
          height: 150,
        ),
        MyTextFromField("Full name", false),
        MyTextFromField("Email", false),
        MyTextFromField("Passward", true),
        MyTextFromField("Confirm Passward", true),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: MyButtonWidget(
            onPress: () {},
            color: AppColors.baseDarkPinkColor,
            text: "Create an account",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text: "By sigining up you agree to our\n\t",
            style: SignupScreenStylies.signInAgressStyle,
            children: <TextSpan>[
              TextSpan(
                text: "Terms\t",
                style: SignupScreenStylies.termsTextStyle,
              ),
              TextSpan(
                text: "and\t",
                style: SignupScreenStylies.andTextStyle,
              ),
              TextSpan(
                text: "Conditions of Use\t",
                style: SignupScreenStylies.ConditionofUseStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSocialButton(
      {required Widget child, required Function onPressed}) {
    return MaterialButton(
      onPressed: onPressed(),
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: AppColors.baseGrey40Color,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }

  Widget buildBottomPart() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "or sign in with social network",
            style: SignupScreenStylies.signInSocialStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.google,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                buildSocialButton(
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
          Container(
            margin: EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {},
              color: AppColors.baseGrey10Color,
              height: 55,
              elevation: 0,
              child: Center(
                child: Text(
                  "Sign up",
                  style: SignupScreenStylies.signUpButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            buildTopPart(),
            buildBottomPart(),
          ],
        ),
      ),
    );
  }
}
