import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/features/home/home_provider.dart';
import 'package:grocerydelivery/product/constants/color_constants.dart';
import 'package:grocerydelivery/product/widget/product_container.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HelpScreenState();
}

class _HelpScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Your Favorites'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: ColorConstants.white,
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 25.0,
            ),
            itemCount: ref.watch(homeScreenProvider).getSavedList.length,
            itemBuilder: (_, index) {
              final list =ref.watch(homeScreenProvider).getSavedList[index];
              return ProductContainer(list: list);
            }),
      ),
    );
  }
}
