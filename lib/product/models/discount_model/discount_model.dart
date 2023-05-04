import 'dart:ui';

import 'package:grocerydelivery/product/constants/color_constants.dart';
import 'package:grocerydelivery/product/constants/string_constants.dart';
import 'package:grocerydelivery/product/enums/png_constants.dart';

class DiscountModel {
  DiscountModel(this.discountId, this.discountTitle, this.discountDescription,
      this.url, this.color);

  final int discountId;
  final String discountTitle;
  final String discountDescription;
  final String url;
  final Color color;
}


final discountList =List<DiscountModel>.generate(10, (index){
  if(index%2==0){
    return DiscountModel(index, StringConstants.discountTitle1, StringConstants.discountDescription1, PngConstants.vegetables.toPng, ColorConstants.offGreen);
  }else {
    return DiscountModel(index, StringConstants.discountTitle2, StringConstants.discountDescription2, PngConstants.carrot.toPng, ColorConstants.negroni);

  }
});

