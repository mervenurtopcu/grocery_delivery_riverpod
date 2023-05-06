import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/product/models/product_model/discountProductList.dart';

import '../../product/models/product_model/product_model.dart';
class HomeScreenProvider extends ChangeNotifier {

  final List<ProductModel> _productList = discountProductList;
  List<ProductModel> get getProducts => _productList;

  final List<ProductModel> _savedList = [];
  List<ProductModel> get getSavedList => _savedList;

  void addToList(ProductModel product) {
    _savedList.add(product);
    notifyListeners();
  }
  void removeFromList(ProductModel product) {
    _savedList.remove(product);
    notifyListeners();
  }

}
final homeScreenProvider = ChangeNotifierProvider((ref) => HomeScreenProvider());