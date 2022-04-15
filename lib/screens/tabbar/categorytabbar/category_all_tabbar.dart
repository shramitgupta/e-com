import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/category_screen_data.dart';
import 'package:flutter_application_1/models/SingleProductModel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screens/detailscreen/detail_screen.dart';
import 'package:flutter_application_1/widgets/show_all_widget.dart';
import 'package:flutter_application_1/widgets/singleProduct_widget.dart';

class CategoryAllTabBar extends StatelessWidget {
  Widget builderRender({required List<SingleProductModel> singleProduct}) {
    return Container(
      height: 250,
      child: GridView.builder(
        itemCount: singleProduct.length,
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.4),
        itemBuilder: (context, index) {
          var data = singleProduct[index];
          return SingleProductWidget(
            onPressed: () {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: DetailScreen(data: data),
              );
            },
            productImage: data.productImage,
            productModel: data.productModel,
            productName: data.productName,
            productOldPrice: data.productOldPrice,
            productPrice: data.productPrice,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ShowAllWidget(
          leftText: "Clothing",
        ),
        builderRender(
          singleProduct: categoryClothData,
        ),
        ShowAllWidget(
          leftText: "Shoes",
        ),
        builderRender(
          singleProduct: categoryShoesData,
        ),
        ShowAllWidget(
          leftText: "Accessories",
        ),
        builderRender(
          singleProduct: categoryAccessoriesData,
        ),
      ],
    );
  }
}
