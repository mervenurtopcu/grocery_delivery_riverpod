import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/model/products/product_list.dart';
class SpecialDealsProvider extends ChangeNotifier{

  List<ProductModel> twentyDiscountList = [];
  List<ProductModel> fiftyDiscountList = [];

  void getDiscountList(List<ProductModel> list){
    for(int i=0;i<list.length;i++){
      if(list[i].discountRate==20){
        twentyDiscountList.add(list[i]);
      }
      else if(list[i].discountRate==50){
        fiftyDiscountList.add(list[i]);
      }
    }
  }

}