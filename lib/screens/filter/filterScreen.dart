import 'package:flutter/material.dart';
import 'package:flutter_application_1/appColors/app_colors.dart';
import 'package:flutter_application_1/stylies/detail_screen_stylies.dart';
import 'package:flutter_application_1/widgets/my_button_widget.dart';

class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late String _ratingController;
  late String _categoryController;
  RangeValues _currentRangeValue = const RangeValues(40, 80);
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "Filter",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
    );
  }

  Widget buildExpansionTil({
    List<String>? items,
    String title = "",
    String hint = "",
    String value = "",
  }) {
    return ExpansionTile(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: AppColors.basewhite60Color,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                iconSize: 30,
                hint: Text(
                  hint,
                  style: DetailScreenStylies.productDropDownValueStyle,
                ),
                value: value,
                items: items!
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.baseBlackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildListTile({required String title}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.baseBlackColor,
        ),
      ),
    );
  }

  Widget buildSizeGuides(
      { String text="",
      bool containerColor = false,
      Color color= Colors.black}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor ? color : AppColors.baseGrey10Color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: containerColor
          ? Container()
          : Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  Widget buildPriceExpansionTile() {
    return ExpansionTile(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                RangeSlider(
                  values: _currentRangeValue,
                  min: 0,
                  max: 1000,
                  labels: RangeLabels(
                    _currentRangeValue.start.round().toString(),
                    _currentRangeValue.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValue = values;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$\t${_currentRangeValue.start.toInt()}",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.baseBlackColor,
                  ),
                  ),
                   Text("\$\t${_currentRangeValue.end.toInt()}",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.baseBlackColor,
                  ),
                  ),
                  ],
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Price",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.baseBlackColor,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          buildListTile(
            title: "Most Popular",
          ),
          Divider(),
          buildListTile(
            title: "New Items",
          ),
          Divider(),
          buildListTile(
            title: "Price\t High - Low",
          ),
          Divider(),
          buildListTile(
            title: "Price\t Low - High",
          ),
          Divider(),
          buildExpansionTil(
            value: _ratingController,
            items: [
              "Women",
              "Men",
              "Kids",
            ],
            hint: "Gender",
            title: "Gender",
          ),
          Divider(),
          buildExpansionTil(
            value: _categoryController,
            items: [
              "T-Shirt",
              "Jacket",
              "Snickers",
            ],
            hint: "Category",
            title: "Category",
          ),
          Divider(),
          ExpansionTile(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 5,
                  primary: true,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildSizeGuides(
                      text: "5",
                    ),
                    buildSizeGuides(
                      text: "5.5",
                    ),
                    buildSizeGuides(
                      text: "6",
                    ),
                    buildSizeGuides(
                      text: "6.5",
                    ),
                    buildSizeGuides(
                      text: "7",
                    ),
                    buildSizeGuides(
                      text: "7.5",
                    ),
                    buildSizeGuides(
                      text: "8",
                    ),
                    buildSizeGuides(
                      text: "8.5",
                    ),
                    buildSizeGuides(
                      text: "9",
                    ),
                    buildSizeGuides(
                      text: "9.5",
                    ),
                    buildSizeGuides(
                      text: "10",
                    ),
                    buildSizeGuides(
                      text: "10.5",
                    ),
                    buildSizeGuides(
                      text: "11",
                    ),
                  ],
                ),
              ),
            ],
            title: Text(
              "Size",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlackColor,
              ),
            ),
          ),
          Divider(),
          ExpansionTile(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 5,
                  primary: true,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildSizeGuides(
                      color: AppColors.baseDarkPinkColor,
                      containerColor: true,
                      
                    ),
                    buildSizeGuides(
                      color: AppColors.baseDarkGreenColor,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: AppColors.baseDarkOrangeColor,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: AppColors.baseGrey30Color,
                      containerColor: true,
                    ),
                  ],
                ),
              ),
            ],
            title: Text(
              "Colors",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlackColor,
              ),
            ),
          ),
          buildPriceExpansionTile(),
          Container(
            margin: EdgeInsets.all(20.0),
            child: MyButtonWidget(
              color: AppColors.baseDarkPinkColor,
              onPress: (){},
              text: "View more item",
            ),
          )
        ],
      ),
    );
  }
}
