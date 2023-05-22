import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grocerydelivery/features/products/product_list_screen.dart';
import 'package:grocerydelivery/features/special_deals/special_deals.dart';
import '../../product/app_states/nav_provider.dart';
import '../../product/widget/index.dart';
import '../../product/model/index.dart';
import '../../product/constants/index.dart';
import '../../product/enums/index.dart';
import '../profile/profile_screen.dart';

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
          InkWell(
            child: Image.asset(
              PngConstants.avatar.toPng,
              width: AssetsImageSize.small.value,
            ),
            onTap: () {
              ref.read(navProvider.notifier).updateIndex(4);
            },
          ),
        ],
        bottom: appbarBottomWidget(context),
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
                    onPressed: () {
                      ref.read(navProvider.notifier).updateIndex(1);
                    },
                    child: const Text(StringConstants.homeSeeAll,
                        style: TextStyle(color: ColorConstants.forestGreen)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const _CategoryListView(),
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SpecialDeals(),
                              fullscreenDialog: true));
                    },
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
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: _SpecialDealsGridView(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SpecialDealsGridView extends StatelessWidget {
  const _SpecialDealsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 25.0,
        ),
        itemCount: discountProductList.length > 4
            ? discountProductList.length - 2
            : discountLists.length,
        itemBuilder: (_, index) {
          final list = discountProductList[index];
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: ColorConstants.offGreen,
              ),
              child: ProductContainer(list: list));
        });
  }
}

class _CategoryListView extends StatelessWidget {
  const _CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 15.0,
      ),
      itemCount: categoryList.length > 6
          ? categoryList.length - 4
          : categoryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final list = categoryList[index];
        return Column(
          children: [
            Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductListScreen(
                                    categoryId: list.categoryId,
                                  )));
                    },
                    child: CategoryCard(
                        list: list,
                        imageWidth: AssetsImageSize.small.value,
                        containerWidth: 75,
                        fit: BoxFit.values[5]))),
            Expanded(child: Text(list.categoryName)),
          ],
        );
      },
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
      itemCount: discountLists.length,
      itemBuilder: (context, index) {
        final list = discountLists[index];
        return SizedBox(
            width: MediaQuery.of(context).size.height * 0.4,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SpecialDeals(),
                          fullscreenDialog: true));
                },
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: _DiscountCard(
                      list: list,
                      width: 100,
                      height: 100,
                      imageWidth: AssetsImageSize.small.value,
                    ))));
      },
      scrollDirection: Axis.horizontal,
    );
  }
}

class _DiscountCard extends StatelessWidget {
  const _DiscountCard({
    super.key,
    required this.list,
    required this.height,
    required this.width,
    required this.imageWidth,
  });

  final DiscountModel list;
  final double height;

  final double width;

  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: list.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Image.asset(
                list.url,
                width: imageWidth,
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
