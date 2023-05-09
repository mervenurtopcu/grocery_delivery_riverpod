import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/product/constants/string_constants.dart';
import 'package:grocerydelivery/product/widget/category_card.dart';

import '../../product/constants/color_constants.dart';
import '../../product/enums/assets_image_size.dart';
import '../../product/enums/png_constants.dart';
import '../../product/model/products/product_list.dart';
import '../../product/widget/appbar_search_textfield.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.catAppBar),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: ColorConstants.white,
        ),
        actions: [
          Image.asset(
            PngConstants.avatar.toPng,
            width: AssetsImageSize.small.value,
          ),
        ],
        bottom:  _appbarBottomWidget(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,

        ),itemCount: categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            final list = categoryList[index];
            return Column(
              children: [
                CategoryCard(containerHeight: 100,list: list, imageWidth: AssetsImageSize.large.value, containerWidth: 100, fit: BoxFit.fill),
                Expanded(child: Text(list.categoryName)),
              ],
            );
          },
        ),
      ),
    );
  }
  PreferredSize _appbarBottomWidget(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: const AppbarSearchTextField(),
          ),
        ),
      ),
    );
  }
}
