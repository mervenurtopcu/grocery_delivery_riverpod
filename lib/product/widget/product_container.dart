import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/features/cart/cart_screen_provider.dart';
import '../../features/home/home_provider.dart';
import '../../features/products/product_details_screen.dart';
import '../../product/enums/index.dart';
import '../../product/constants/index.dart';
import '../../product/model/index.dart';
import '../../product/widget/index.dart';


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
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetails(item: list,),fullscreenDialog: true));
            },
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
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
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
                                onTap: (){
                                  ref.read(cartScreenProvider).addToList(list);
                                },
                                child: const AddButton(icon: Icons.add,height: 25,width: 25,)
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
