import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../product/widget/index.dart';
import '../../product/model/index.dart';
import '../../product/constants/index.dart';

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
          const Spacer(flex: 1,),
          Expanded(
            flex: 8,
            child: _DiscountCard(list: twentyDiscountList,discountRate: '20', ),
          ),
          const Spacer(flex: 1,),
          Expanded(
            flex: 8,
            child: _DiscountCard(list: fiftyDiscountList,discountRate: '50', ),
          ),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}

class _DiscountCard extends StatelessWidget {
  const _DiscountCard({
    super.key,
    required this.list,
    required this.discountRate,
  });
  final List<ProductModel> list;
  final String discountRate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.offGreen,
      margin: const EdgeInsets.all(8.0),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                'Products with $discountRate% discount (${list.length})',
                style:
                    Theme.of(context).textTheme.titleMedium?.copyWith()),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ProductContainer(
                    list: list[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
