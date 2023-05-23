import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/features/products/product_list_screen.dart';
import '../../product/app_states/nav_provider.dart';
import '../../product/widget/index.dart';
import '../../product/model/index.dart';
import '../../product/constants/index.dart';
import '../../product/enums/index.dart';
import '../search_view/search_delegate.dart';

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
      body: const Padding(
        padding: EdgeInsets.only(top: 20),
        child: _CategoriesGridView(),
      ),
    );
  }
}

class _CategoriesGridView extends StatelessWidget {
  const _CategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        final list = categoryList[index];
        return Column(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListScreen(
                                categoryId: list.categoryId,
                              )));
                },
                child: CategoryCard(
                    containerHeight: 100,
                    list: list,
                    imageWidth: AssetsImageSize.large.value,
                    containerWidth: 100,
                    fit: BoxFit.fill)),
            Expanded(child: Text(list.categoryName)),
          ],
        );
      },
    );
  }
}
