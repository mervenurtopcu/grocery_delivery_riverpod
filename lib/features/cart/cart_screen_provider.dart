import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product/model/index.dart';

class CartScreenProvider extends ChangeNotifier{

  final List<ProductModel> _cartList = [];
  List<ProductModel> get getCartList => _cartList;

  double total = 0;

  double get getTotal => total;


  void addToList(ProductModel? product) {
    _cartList.add(product!);
    getTotalMoneyWithAdd();
    notifyListeners();
  }

  void removeFromList(ProductModel product) {
    _cartList.remove(product);
    getTotalMoneyWithRemove(product);
    notifyListeners();
  }
  void clearList(){
    _cartList.clear();
    getTotalMoneyWithClear();
    notifyListeners();
  }

  void getTotalMoneyWithAdd(){

    total = _cartList.fold(0, (previousValue, element) => previousValue + double.parse(element.productPriceWithDiscount ?? element.productPrice ?? '0'));
    notifyListeners();
  }
  void getTotalMoneyWithRemove(ProductModel product) {

    String productPrice = product.productPriceWithDiscount ?? product.productPrice ?? '0';
    total -= double.parse(productPrice);

    notifyListeners();
  }
  void getTotalMoneyWithClear(){
    total = 0;
    notifyListeners();
  }


}
final cartScreenProvider = ChangeNotifierProvider.autoDispose((ref) => CartScreenProvider());