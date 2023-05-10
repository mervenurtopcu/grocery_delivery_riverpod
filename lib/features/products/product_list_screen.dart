import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grocerydelivery/product/constants/color_constants.dart';
import 'package:grocerydelivery/product/enums/assets_image_size.dart';

import '../../product/model/products/product_list.dart';
import '../../product/widget/product_container.dart';
import '../home/home_provider.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final int categoryId;

  @override
  ConsumerState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  List<ProductModel> productList = [];
  late String categoryName ;
  @override
  void initState() {
    super.initState();
    productList = productLists(widget.categoryId)!;
    categoryName = categoryNames[widget.categoryId];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mountainMeadow,
         title: Text(categoryName),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ColorConstants.white,
            ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: productList.isNotEmpty ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 25.0,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final list = productList[index];
                return ProductContainer(list: list);
              }):const Center(child: Text("No Product Found"),)),
    );
  }
}
