import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grocerydelivery/features/cart/cart_screen_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../product/app_states/nav_provider.dart';
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
            InkWell(
              child: Image.asset(
                PngConstants.avatar.toPng,
                width: AssetsImageSize.small.value,
              ),
              onTap: () {
                Navigator.pop(context);
                ref.read(navProvider.notifier).updateIndex(4);
              },
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
                        widget.item!.productName,
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
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
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
                Text(
                  StringConstants.productDetailTitle,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorConstants.black, fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.item?.productAmount ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorConstants.black, fontWeight: FontWeight.w100),
                ),
                ExpandableText(
                  widget.item!.productDescription,
                  expandText: StringConstants.expandableShowMore,
                  maxLines: 2,
                  collapseText: StringConstants.expandableShowLess,
                  linkColor: ColorConstants.mountainMeadow,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorConstants.doveGray,
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SfCircularChart(
                  backgroundColor: ColorConstants.offGreen,
                  borderWidth: 1,
                  borderColor: ColorConstants.mountainMeadow,
                  title: ChartTitle(
                    text: 'Nutritional Values',
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorConstants.black,
                        ),
                  ),
                  legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.scroll,
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorConstants.black,
                        ),
                  ),
                  series: <CircularSeries>[
                    DoughnutSeries<ChartData, String>(
                      dataSource: <ChartData>[
                        ChartData('Protein', 0.2, '20%'),
                        ChartData('Fat', 0.05, '5%'),
                        ChartData('Carbonhydrate', 0.65, '65%'),
                        ChartData('Leaf', 0.1, '15%'),
                        ChartData('Sugar', 0.1, '10%'),
                      ],
                      xValueMapper: (ChartData data, _) => data.xData,
                      yValueMapper: (ChartData data, _) => data.yData,
                      dataLabelMapper: (ChartData data, _) => data.text,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: ColorConstants.black),
                      ),
                      enableTooltip: true,
                      radius: '100%',
                      innerRadius: '60%',
                      explode: true,
                      explodeIndex: 0,
                      explodeOffset: '10%',
                      groupMode: CircularChartGroupMode.point,
                      pointRadiusMapper: (ChartData data, _) => data.text,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: _BottomNavBar(
          widget: widget,
          ref: ref,
        ));
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
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                widget.item?.productPriceWithDiscount != null
                    ? Text(
                        '\$${widget.item?.productPrice}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: ColorConstants.doveGray,
                              decoration: TextDecoration.lineThrough,
                            ),
                      )
                    : Text(
                        '\$${widget.item?.productPrice}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: ColorConstants.doveGray,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: widget.item?.productPriceWithDiscount != null
                ? Text(
                    '\$${widget.item?.productPriceWithDiscount}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ColorConstants.mountainMeadow,
                        ),
                  )
                : Text(''),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                ref.read(cartScreenProvider).addToList(widget.item);
                var snackBar = SnackBar(
                    content: Text(
                        '${widget.item?.productName} added to cart successfully'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            ),
          )
        ],
      ),
    );
  }
}
