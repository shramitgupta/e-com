import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/home_page_data.dart';
import 'package:flutter_application_1/models/SingleProductModel.dart';
import 'package:flutter_application_1/widgets/singleProduct_widget.dart';

class TabBarBar extends StatelessWidget {
  final List<SingleProductModel> productData;
  TabBarBar({required this.productData});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: colothsData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        var data = colothsData[index];
        return SingleProductWidget(
          onPressed: () {},
          productImage: data.productImage,
          productModel: data.productModel,
          productName: data.productName,
          productOldPrice: data.productOldPrice,
          productPrice: data.productPrice,
        );
      },
    );
  }
}
