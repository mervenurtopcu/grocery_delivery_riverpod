import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/features/cart/cart_screen_provider.dart';
import 'package:grocerydelivery/product/constants/index.dart';
import 'package:lottie/lottie.dart';
import '../../product/enums/index.dart';
import '../../product/app_states/nav_provider.dart';

part 'cart_screen.g.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(cartScreenProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.cartAppBar),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorConstants.white,
              ),
          actions: [
            _appbarIconButton(context, provider),
          ],
          centerTitle: true,
        ),
        body: provider.getCartList.isNotEmpty
            ? Column(
                children: [
                  Expanded(child: _buildListView(provider)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _priceContainer(provider, context),
                  ),
                ],
              )
            : const CartEmptyScreen());
  }

  Container _priceContainer(CartScreenProvider provider, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
              top: BorderSide(
                  color: ColorConstants.doveGray.withOpacity(0.5), width: 1))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  StringConstants.cartTotal,
                  style: TextStyle(
                    color: ColorConstants.doveGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '\$${provider.getTotal}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorConstants.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            _checkoutButton(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton _checkoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ref.read(navProvider.notifier).updateIndex(0);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.mountainMeadow,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.05,
            vertical: MediaQuery.of(context).size.width * 0.03),
        shape: const StadiumBorder(),
      ),
      child: Text(
        StringConstants.cartCheckout,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorConstants.white,
            ),
      ),
    );
  }

  ListView _buildListView(CartScreenProvider provider) {
    return ListView.builder(
        itemCount: provider.getCartList.length,
        itemBuilder: (context, index) {
          final item = provider.getCartList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.mountainMeadow.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Image.asset(
                      item.productImage,
                      width: AssetsImageSize.medium.value,
                      height: AssetsImageSize.medium.value,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.productName,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ColorConstants.black,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            item.productAmount ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: ColorConstants.doveGray,
                                  fontWeight: FontWeight.w200,
                                ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            item.productPriceWithDiscount != null
                                ? Text(
                                    '\$${item.productPrice}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: ColorConstants.doveGray,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  )
                                : Text(
                                    '\$${item.productPrice}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: ColorConstants.mountainMeadow,
                                        ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: item.productPriceWithDiscount != null
                                  ? Text(
                                      '\$${item.productPriceWithDiscount}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color:
                                                ColorConstants.mountainMeadow,
                                          ),
                                    )
                                  : const Text(''),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      StringConstants.cartAlertTitle),
                                  backgroundColor: ColorConstants.white,
                                  content: Text(
                                      'Do you want to remove ${item.productName} from cart?'),
                                  actions: [
                                    CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                            StringConstants.cartAlertNo)),
                                    CupertinoDialogAction(
                                        onPressed: () {
                                          provider.removeFromList(item);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                            StringConstants.cartAlertYes)),
                                  ],
                                ));
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: ColorConstants.mountainMeadow,
                      )),
                ],
              ),
            ),
          );
        });
  }

  IconButton _appbarIconButton(
      BuildContext context, CartScreenProvider provider) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text(StringConstants.cartAlertTitle),
                  backgroundColor: ColorConstants.white,
                  content: const Text(StringConstants.cartAlertDescr),
                  actions: [
                    CupertinoDialogAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(StringConstants.cartAlertNo)),
                    CupertinoDialogAction(
                        onPressed: () {
                          provider.clearList();
                          Navigator.pop(context);
                        },
                        child: const Text(StringConstants.cartAlertYes)),
                  ],
                ));
      },
      icon: provider.getCartList.isNotEmpty
          ? const Icon(
              Icons.delete_forever,
              color: ColorConstants.white,
            )
          : const SizedBox(),
    );
  }
}
