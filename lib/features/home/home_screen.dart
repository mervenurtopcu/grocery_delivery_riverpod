import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/product/constants/color_constants.dart';
import 'package:grocerydelivery/product/enums/assets_image_size.dart';
import 'package:grocerydelivery/product/models/categories_model/categories_model.dart';
import 'package:grocerydelivery/product/models/discount_model/discount_model.dart';
import 'package:grocerydelivery/product/widget/appbar_search_textfield.dart';

import '../../product/constants/string_constants.dart';
import '../../product/enums/png_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome \nLena John'),
        actions: [
          Image.asset(
            PngConstants.avatar.toPng,
            width: AssetsImageSize.small.value,
          ),
        ],
        bottom: _appbarBottomWidget(context),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: discountList.length,
                itemBuilder: (context, index) {
                  final list = discountList[index];
                  return _DiscountCard(list: list);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    StringConstants.homeCaptionsCategories,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  )),
                  _seeAllTextButton(),
                ],
              ),
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final list = categoryList[index];
              return Column(
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorConstants.offGreen,
                    ),
                    child: Image.asset(
                      list.categoryImage,
                      width: AssetsImageSize.small.value,
                    ),
                  ),
                  Text(list.categoryName),
                ],
              );
            },
          ))
        ],
      ),
    );
  }

  TextButton _seeAllTextButton() {
    return TextButton(
                    onPressed: () {},
                    child: const Text(
                      StringConstants.homeSeeAll,
                      style: TextStyle(color: ColorConstants.mountainMeadow),
                    ));
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

class _DiscountCard extends StatelessWidget {
  const _DiscountCard({
    super.key,
    required this.list,
  });

  final DiscountModel list;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: list.color,
        child: Row(
          children: [
            Image.asset(
              list.url,
              width: AssetsImageSize.small.value,
            ),
            Column(
              children: [
                Text(list.discountTitle),
                Text(list.discountDescription),
              ],
            ),
          ],
        ));
  }
}
