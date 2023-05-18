import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grocerydelivery/features/cart/cart_screen_provider.dart';
import '../../product/widget/index.dart';
import '../../product/model/index.dart';
import '../../product/constants/index.dart';
import '../../product/enums/index.dart';

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({
    required this.item,
    Key? key,
  }) : super(key: key);

  final ProductModel? item;

  @override
  ConsumerState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: const BackButton(
            color: ColorConstants.black,
          ),
          actions: [
            Image.asset(
              PngConstants.avatar.toPng,
              width: AssetsImageSize.small.value,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        widget.item!.productName ,
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Text(
                        widget.item!.categoryName,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      RatingBarIndicator(
                        rating: widget.item!.productRate,
                        unratedColor: ColorConstants.offGreen,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: ColorConstants.mountainMeadow,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60.0),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                            widget.item!.productImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  StringConstants.productDetailTitle,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorConstants.black, fontWeight: FontWeight.w500),
                ),
                Text(widget.item?.productAmount ?? '',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.w100),),
                ExpandableText(
                  widget.item!.productDescription,
                  expandText: StringConstants.expandableShowMore,
                  maxLines: 2,
                  collapseText: StringConstants.expandableShowLess,
                  linkColor: ColorConstants.mountainMeadow,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorConstants.doveGray,
                      ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: _BottomNavBar(widget: widget,ref: ref,));
  }
}

class _BottomNavBar extends StatelessWidget {
   const _BottomNavBar({
    required this.widget,
    required this.ref,
  });

  final ProductDetails widget;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorConstants.doveGray,
                      ),
                ),
                Text(
                  '\$${widget.item!.productPrice}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              ref.read(cartScreenProvider).addToList(widget.item);
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: ColorConstants.white,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstants.mountainMeadow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            label: Text(
              'Add to Cart',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ColorConstants.white),
            ),
          )
        ],
      ),
    );
  }
}
