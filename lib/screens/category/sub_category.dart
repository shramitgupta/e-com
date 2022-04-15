import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/models/SingleProductModel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screens/detailscreen/detail_screen.dart';
import 'package:flutter_application_1/stylies/sub_category_stylies.dart';
import 'package:flutter_application_1/svgimages/svg_images.dart';
import 'package:flutter_application_1/widgets/singleProduct_widget.dart';
import 'package:flutter_application_1/widgets/toggle_button_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubCategory extends StatefulWidget {
  List<SingleProductModel> productData;
  final String productName;
  final String productModel;
  SubCategory({
    required this.productData,
    required this.productName,
    required this.productModel,
  });
  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: RotationTransition(
            turns: AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(
              SvgImages.filter,
              color: AppColors.baseBlackColor,
              width: 35,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 35,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productName,
                style: SubCategoryScreenStylies.subCategoryTitleStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${widget.productData.length}Products",
                style: SubCategoryScreenStylies.subCategoryProductItemStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list_alt_sharp,
                          color: AppColors.baseBlackColor,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.productModel,
                          style: SubCategoryScreenStylies
                              .subCategoryModelNameStylies,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ToggleButtonWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              GridView.builder(
                shrinkWrap: true,
                itemCount: widget.productData.length,
                primary: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  var data = widget.productData[index];
                  return SingleProductWidget(
                    onPressed: () {
                      PageRouting.goToNextPage(
                        context: context,
                        navigateTo: DetailScreen(
                          data: data,
                        ),
                      );
                    },
                    productImage: data.productImage,
                    productModel: data.productModel,
                    productOldPrice: data.productOldPrice,
                    productName: data.productName,
                    productPrice: data.productPrice,
                  );
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
