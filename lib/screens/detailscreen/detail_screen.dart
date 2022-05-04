import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/data/detail_screen_data.dart';
import 'package:flutter_application_1/models/SingleProductModel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screens/sizeguide/size_guide_screen.dart';
import 'package:flutter_application_1/stylies/detail_screen_stylies.dart';
import 'package:flutter_application_1/svgimages/svg_images.dart';
import 'package:flutter_application_1/widgets/drop_button_widget.dart';
import 'package:flutter_application_1/widgets/singleProduct_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/widgets/drop_button_widget.dart';

class DetailScreen extends StatefulWidget {
  final SingleProductModel data;
  DetailScreen({required this.data});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _ratingController = "red";
  String _sizeController = "25";
  PreferredSize buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Reebok",
          style: TextStyle(
            color: AppColors.baseBlackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.heart,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.upload,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                "images/Logo.png",
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.productName,
                  style: DetailScreenStylies.commpanyTitleStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.data.productModel,
                  style: DetailScreenStylies.productModelStyle,
                ),
              ],
            ),
            trailing:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.data.productPrice.toString(),
                style: DetailScreenStylies.productPriceStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.data.productOldPrice.toString(),
                style: DetailScreenStylies.productOldPriceStyle,
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.data.productImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 15, top: 15),
                        child: Image.network(widget.data.productSecondImage),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 15, top: 15),
                        child: Image.network(widget.data.productThirdImage),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 15, top: 15),
                        child: Image.network(widget.data.productFourImage),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: DropButton(
                  hintText: "Color",
                  item: ["red", "blue", "white", "black", "pink"],
                  ratingController: _ratingController,
                ),
              ),
              Expanded(
                child: DropButton(
                  hintText: "Color",
                  item: ["25", "30", "35", "40", "45"],
                  ratingController: _sizeController,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: MaterialButton(
              elevation: 0,
              height: 50,
              color: AppColors.baseDarkGreenColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                "Add to Cart",
                style: DetailScreenStylies.buttonTextStyle,
              ),
              onPressed: () {},
            ),
          ),
          ExpansionTile(
            title: Text(
              "Description",
              style: DetailScreenStylies.descriptionTextStyle,
            ),
            children: [
              ListTile(
                title: Wrap(
                  children: [
                    Text(
                      "this women\s tank top is designed to help you stay cool.It's made of strectly and breathable fabric that moves heat away from your skin",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ".\t\tMaterial",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                            Text(
                              "84%\tnylon",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "16% elastance",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ".\t\tSize",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                            Text(
                              "2XS,\tXS,\tM,\tL ",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ".\t\tGender",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                            Text(
                              "Women",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ".\t\tProvince",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                            Text(
                              "Delhi",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\t\tCountry",
                                  style: TextStyle(
                                    fontSize: 18.60,
                                  ),
                                ),
                                Text(
                                  "India ",
                                  style: TextStyle(
                                    fontSize: 18.60,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              height: 55,
                              elevation: 0,
                              child: Text(
                                "Size guide",
                                style: DetailScreenStylies.SizeGuideTextStyle,
                              ),
                              minWidth: double.infinity,
                              color: AppColors.basewhite60Color,
                              onPressed: () {
                                PageRouting.goToNextPage(
                                  context: context,
                                  navigateTo: SizeGuideScreen(),
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListTile(
            leading: Text(
              "You may also like",
              style: DetailScreenStylies.youmayalsolikeTextStyle,
            ),
            trailing: Text(
              "Show All",
              style: DetailScreenStylies.showAllTextStyle,
            ),
          ),
          Container(
            height: 240,
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: true,
                itemCount: detailScreenData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  var data = detailScreenData[index];
                  return SingleProductWidget(
                    onPressed: () {
                      PageRouting.goToNextPage(
                        context: context,
                        navigateTo: DetailScreen(
                          data: data,
                        ),
                      );
                      print("Hello I am clicked.");
                    },
                    productImage: data.productImage,
                    productModel: data.productModel,
                    productName: data.productName,
                    productOldPrice: data.productOldPrice,
                    productPrice: data.productPrice,
                  );
                }),
          )
        ],
      ),
    );
  }
}
