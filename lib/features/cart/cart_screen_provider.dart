import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product/model/index.dart';

class CartScreenProvider extends ChangeNotifier{

  final List<ProductModel> _cartList = [];
  int _counter =0;
  List<ProductModel> get getCartList => _cartList;
  int get getAmount => _counter;


  void addToList(ProductModel? product,int amount) {
    _cartList.add(product!);
    _counter = amount;
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

  void decrementCounter() {
    if (_counter > 0) {
      _counter = _counter - 1;
      notifyListeners();
    }
  }
  void incrementCounter() {
    _counter = _counter + 1;
    notifyListeners();
  }


}
final cartScreenProvider = ChangeNotifierProvider((ref) => CartScreenProvider());