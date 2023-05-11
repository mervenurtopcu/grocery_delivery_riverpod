import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grocerydelivery/product/constants/string_constants.dart';
import '../../product/constants/color_constants.dart';
import '../../product/model/products/product_list.dart';
import '../../product/widget/product_container.dart';

class SpecialDeals extends ConsumerStatefulWidget {
  const SpecialDeals({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SpecialDealsState();
}

class _SpecialDealsState extends ConsumerState<SpecialDeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.homeCaptionsSpecialDeals),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ColorConstants.white,
            ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 1,),
          Expanded(
            flex: 8,
            child: Card(
              color: ColorConstants.offGreen,
              margin: const EdgeInsets.all(8.0),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        'Products with 20% discount (${twentyDiscountList.length})',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith()),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ProductContainer(
                            list: twentyDiscountList[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemCount: twentyDiscountList.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 8,
            child: Card(
              color: ColorConstants.negroni,
              margin: const EdgeInsets.all(8.0),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        'Products with 50% discount (${fiftyDiscountList.length})',
                        style:
                        Theme.of(context).textTheme.titleMedium?.copyWith()),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ProductContainer(
                            list: fiftyDiscountList[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemCount: fiftyDiscountList.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 1,),
        ],
      ),
    );
  }
}
