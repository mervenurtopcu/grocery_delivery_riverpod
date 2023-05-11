import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/features/cart/cart_screen_provider.dart';
import 'package:grocerydelivery/features/products/product_detail_screen_provider.dart';
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
    return Scaffold(
      appBar: AppBar(
        title:const Text(StringConstants.cartAppBar),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: ColorConstants.white,
        ),
        actions: [
          IconButton(onPressed: (){
            ref.read(cartScreenProvider).clearList();
          }, icon: const Icon(Icons.delete_forever,color: ColorConstants.white,)),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: ref.watch(cartScreenProvider).getCartList.length,
              itemBuilder: (context,index){
            var cartList = ref.watch(cartScreenProvider).getCartList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstants.doveGray.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartList.productName,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorConstants.black,
                          ),),
                          Text(cartList.productPrice,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorConstants.doveGray,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    ref.read(cartScreenProvider).decrementCounter();
                                  }, icon: const Icon(Icons.remove_circle_outline,color: ColorConstants.mountainMeadow,)),
                                  Text(ref.watch(cartScreenProvider).getAmount.toString(),style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorConstants.black,
                                  ),),
                                  IconButton(onPressed: (){
                                    ref.read(cartScreenProvider).incrementCounter();
                                  }, icon: const Icon(Icons.add_circle_outline,color: ColorConstants.mountainMeadow,)),
                                ],
                              ),
                              IconButton(onPressed: (){
                                ref.read(cartScreenProvider).removeFromList(cartList);
                              }, icon: const Icon(Icons.delete_outline,color: ColorConstants.mountainMeadow,)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }))
        ],
      )
    );
  }
}
