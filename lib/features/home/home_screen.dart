import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grocerydelivery/product/models/product_model/product_model.dart';

import '../../product/constants/color_constants.dart';
import '../../product/constants/string_constants.dart';
import '../../product/enums/assets_image_size.dart';
import '../../product/enums/png_constants.dart';
import '../../product/models/categories_model/categories_model.dart';
import '../../product/models/discount_model/discount_model.dart';
import '../../product/models/product_model/discountProductList.dart';
import '../../product/widget/appbar_search_textfield.dart';
import '../../product/widget/product_container.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                //width: 100,
                child: const _DiscountListview(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      StringConstants.homeCaptionsCategories,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: ColorConstants.black,
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(StringConstants.homeSeeAll,
                        style: TextStyle(color: ColorConstants.forestGreen)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15.0,
                ),
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final list = categoryList[index];
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: ColorConstants.offGreen,
                          ),
                          child: FittedBox(
                            fit: BoxFit.values[5],
                            child: Image.asset(
                              list.categoryImage,
                              width: AssetsImageSize.small.value,
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Text(list.categoryName)),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      StringConstants.homeCaptionsSpecialDeals,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: ColorConstants.black,
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(StringConstants.homeSeeAll,
                        style: TextStyle(color: ColorConstants.forestGreen)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: ColorConstants.offGreen,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,bottom: 20,
                  ),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 25.0,
                      ),
                      itemCount: discountProductList.length,
                      itemBuilder: (_, index) {
                        final list = discountProductList[index];
                        return ProductContainer(list: list);
                      }),
                ),
              ),
            )
          ],
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



class _DiscountListview extends StatelessWidget {
  const _DiscountListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: discountList.length,
      itemBuilder: (context, index) {
        final list = discountList[index];
        return SizedBox(
            width: MediaQuery.of(context).size.height * 0.4,
            child:
                FittedBox(fit: BoxFit.fill, child: _DiscountCard(list: list)));
      },
      scrollDirection: Axis.horizontal,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                list.url,
                width: AssetsImageSize.small.value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(list.discountTitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.mountainMeadow)),
                  Text(list.discountDescription,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(color: ColorConstants.boulder)),
                ],
              ),
            ),
          ],
        ));
  }
}
