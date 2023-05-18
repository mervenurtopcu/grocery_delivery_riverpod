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
        title:const Text(StringConstants.cartAppBar),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: ColorConstants.white,
        ),
        actions: [
          IconButton(onPressed: (){
            provider.clearList();
          }, icon: const Icon(Icons.delete_forever,color: ColorConstants.white,)),
        ],
        centerTitle: true,
      ),
      body: provider.getCartList.isNotEmpty ? Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: provider.getCartList.length,
              itemBuilder: (context,index){
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
                    Image.asset(item.productImage,width:AssetsImageSize.medium.value ,height: AssetsImageSize.medium.value,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item.productName,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ColorConstants.black,
                            ),),
                            Text( '\$${item.productPrice}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: ColorConstants.doveGray,
                            ),),
                          ],
                        ),
                      ),

                    ),
                      IconButton(onPressed: (){
                        provider.removeFromList(item);
                      }, icon: const Icon(Icons.delete_forever,color: ColorConstants.mountainMeadow,)),
                  ],
                ),
              ),
            );
          }))
        ],
      ) : const CartEmptyScreen()
    );
  }
}
