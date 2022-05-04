import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screens/confirmation/confirmation_page.dart';
import 'package:flutter_application_1/svgimages/svg_images.dart';
import 'package:flutter_application_1/widgets/my_button_widget.dart';
import 'package:flutter_application_1/widgets/my_textfromfield_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.plus,
            color: AppColors.baseBlackColor,
            width: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.delete,
            color: AppColors.baseBlackColor,
            width: 25,
          ),
        ),
      ],
    );
  }

  Widget buildTextField(
      {required double leftPadding,
      required double rightPadding,
      required String hintText}) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
        top: 20,
        left: leftPadding,
        right: rightPadding,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar() as PreferredSizeWidget,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "payment",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "order number is 123456688",
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.baseGrey50Color,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 180,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: SweepGradient(
                        center: AlignmentDirectional(1, -1),
                        startAngle: 1.7,
                        endAngle: 3,
                        colors: const <Color>[
                          Color(0xff148535),
                          Color(0xff148535),
                          Color(0xff0D6630),
                          Color(0xff0D6630),
                          Color(0xff148535),
                          Color(0xff148535),
                        ],
                        stops: const <double>[
                          0.0,
                          0.3,
                          0.3,
                          0.7,
                          1.0
                        ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "VISA",
                          style: TextStyle(
                            fontSize: 24.30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseWhiteColor,
                          ),
                        ),
                        Text(
                          "VISA ELECTRON",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseWhiteColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "****\t\t****\t\t****\t\t****\t\t2193",
                      style: TextStyle(
                        fontSize: 24.30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.baseWhiteColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "card holder",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.baseWhiteColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "JOHN WICK",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.baseWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "EXPIRES",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.baseWhiteColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "07\t/\t26",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.baseWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Align(
                              alignment: Alignment.centerRight,
                              child: CircleAvatar(
                                backgroundColor: AppColors.baseLightGreenColor,
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: AppColors.basewhite60Color,
                                ),
                              ),
                            ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              MyTextFromField("card Holder", false),
              MyTextFromField("card Number", false),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      hintText: "Exp",
                      leftPadding: 20,
                      rightPadding: 0,
                    ),
                  ),
                  Expanded(
                    child: buildTextField(
                      hintText: "CVV",
                      leftPadding: 3,
                      rightPadding: 10,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 50,
                    margin: EdgeInsets.only(right: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        primary: AppColors.baseLightOrangeColor,
                        onSurface: Colors.grey,
                      ),
                      icon: SvgPicture.asset(
                        SvgImages.plus,
                        color: AppColors.baseWhiteColor,
                        width: 20,
                      ),
                      label: Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.baseWhiteColor,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: AppColors.baseGrey10Color,
                title: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order amount",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.baseBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Your Total amount of discount",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.baseBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$103.98",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.baseBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "\$-55.98",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.baseBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: AppColors.baseGrey10Color,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 23),
                child: MyButtonWidget(
                  color: AppColors.baseDarkPinkColor,
                  onPress: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: ConfirmationPage(),
                    );
                  },
                  text: "Confirmation",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
