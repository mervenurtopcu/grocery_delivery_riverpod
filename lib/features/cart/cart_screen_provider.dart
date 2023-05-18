import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product/model/index.dart';

class CartScreenProvider extends ChangeNotifier{

  final List<ProductModel> _cartList = [];
  List<ProductModel> get getCartList => _cartList;


  void addToList(ProductModel? product) {
    _cartList.add(product!);
    notifyListeners();
  }

  void removeFromList(ProductModel product) {
    _cartList.remove(product);
    notifyListeners();
  }
  void clearList(){
    _cartList.clear();
    notifyListeners();
  }


}
final cartScreenProvider = ChangeNotifierProvider((ref) => CartScreenProvider());