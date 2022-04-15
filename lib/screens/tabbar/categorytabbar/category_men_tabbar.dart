import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/category_screen_data.dart';
import 'package:flutter_application_1/data/home_page_data.dart';
import 'package:flutter_application_1/models/CategoryProductModel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screens/category/sub_category.dart';
import 'package:flutter_application_1/widgets/category_product_widget.dart';

class CategoryMenTabBar extends StatelessWidget {
  List<CategoryProductModel> categoryProductModel = [];
  CategoryMenTabBar({required this.categoryProductModel});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categoryProductModel.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        var data = categoryProductModel[index];
        return CategoryProductWidget(
          onPressed: () {
            if (index == 0) {
              PageRouting.goToNextPage(
                navigateTo: SubCategory(
                  productModel: colothsData[index].productModel,
                  productData: colothsData,
                  productName: menCategoryData[index].productName,
                ),
                context: context,
              );
            } else if (index == 1) {
              PageRouting.goToNextPage(
                navigateTo: SubCategory(
                  productModel: shoesData[index].productModel,
                  productData: shoesData,
                  productName: menCategoryData[index].productName,
                ),
                context: context,
              );
            } else if (index == 2) {
              PageRouting.goToNextPage(
                navigateTo: SubCategory(
                  productModel: accessoriesData[index].productModel,
                  productData: accessoriesData,
                  productName: menCategoryData[index].productName,
                ),
                context: context,
              );
            } else if (index == 3) {
              PageRouting.goToNextPage(
                navigateTo: SubCategory(
                  productModel: accessoriesData[index].productModel,
                  productData: accessoriesData,
                  productName: menCategoryData[index].productName,
                ),
                context: context,
              );
            } else if (index == 4) {
              PageRouting.goToNextPage(
                navigateTo: SubCategory(
                  productModel: accessoriesData[index].productModel,
                  productData: accessoriesData,
                  productName: menCategoryData[index].productName,
                ),
                context: context,
              );
            }
          },
          productImage: data.productImage,
          productModel: data.productModel,
          productName: data.productName,
        );
      }),
    );
  }
}
