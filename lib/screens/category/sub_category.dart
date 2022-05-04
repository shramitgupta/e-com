//import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/models/SingleProductModel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screens/detailscreen/detail_screen.dart';
import 'package:flutter_application_1/stylies/sub_category_stylies.dart';
import 'package:flutter_application_1/svgimages/svg_images.dart';
import 'package:flutter_application_1/widgets/singleProduct_widget.dart';
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
  int isSelect = 1;

  List<bool> isSelected = [true, false, false];
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  late List<FocusNode> focusToggle;

  onTogglePressed(index) {
    if (index == 0) {
      setState(() {
        isSelect = 1;
      });
    } else if (index == 1) {
      setState(() {
        isSelect = 2;
      });
    } else if (index == 2) {
      setState(() {
        isSelect = 3;
      });
    }
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
  }

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
                        buildToggleButtons()
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
                  crossAxisCount: isSelect == 1
                      ? 2
                      : isSelect == 2
                          ? 1
                          : isSelect == 3
                              ? 1
                              : 2,
                  childAspectRatio: isSelect == 1
                      ? 0.7
                      : isSelect == 2
                          ? 1.5
                          : isSelect == 3
                              ? 0.8
                              : 0.7,
                ),
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

  ToggleButtons buildToggleButtons() {
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
                          onTogglePressed(index);
                        },
                        isSelected: isSelected,
                      );
  }
}

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
