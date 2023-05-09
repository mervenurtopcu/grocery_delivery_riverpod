import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/home/home_provider.dart';
import '../constants/color_constants.dart';
import '../enums/assets_image_size.dart';
import '../model/products/product_list.dart';



class ProductContainer extends ConsumerWidget {
  const ProductContainer( {
    super.key,
    required this.list,

  });

  final ProductModel? list;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: Container(
              width: 150,
              //height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.green.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: ColorConstants.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      if (!ref
                          .watch(homeScreenProvider)
                          .getSavedList
                          .contains(list)) {
                        ref.read(homeScreenProvider).addToList(list!);
                      } else {
                        ref.read(homeScreenProvider).removeFromList(list!);
                      }
                    },
                    icon:
                        ref.watch(homeScreenProvider).getSavedList.contains(list)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.green,
                              ),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        list!.productImage,
                        width: AssetsImageSize.large.value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list!.productName,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: ColorConstants.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          list!.categoryName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: ColorConstants.gray,
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${list!.productPrice}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            InkWell(
                              child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: ColorConstants.mountainMeadow,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: ColorConstants.white,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
