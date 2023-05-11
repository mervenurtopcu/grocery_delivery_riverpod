import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailScreenProvider extends ChangeNotifier {
  int counter;

  ProductDetailScreenProvider({required this.counter});

  int get getCounter => counter;

  void incrementCounter() {
    counter = counter + 1;
    notifyListeners();
  }

  void decrementCounter() {
    if (counter > 1) {
      counter = counter - 1;
    } else {
      counter = 1;
    }
    notifyListeners();
  }
}

final productDetailScreenProvider =
    ChangeNotifierProvider((ref) => ProductDetailScreenProvider(
          counter: 1,
        ));
