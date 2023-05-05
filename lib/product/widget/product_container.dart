import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../enums/assets_image_size.dart';
import '../models/product_model/product_model.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.list,
  });

  final ProductModel list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: ColorConstants.offGreen,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
                width: 150,
                //height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: ColorConstants.white,
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                            Icons.favorite_border_outlined)),
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          list.productImage,
                          width: AssetsImageSize.large.value,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            list.productName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            list.categoryName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: ColorConstants.gray,
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text(
                                '\$${list.productPrice}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                  color: ColorConstants
                                      .black,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(5.0),
                                      color: ColorConstants
                                          .mountainMeadow,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: ColorConstants
                                          .white,
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
      ),
    );
  }
}