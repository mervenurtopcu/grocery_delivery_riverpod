import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product/model/index.dart';


class HomeScreenProvider extends ChangeNotifier {

  final List<ProductModel> _savedList = [];
  List<ProductModel> get getSavedList => _savedList;

  // bool _isLoading = false;
  //
  // bool get getIsLoading => _isLoading;

  void addToList(ProductModel product) {
    _savedList.add(product);
    notifyListeners();
  }
  void removeFromList(ProductModel product) {
    _savedList.remove(product);
    notifyListeners();
  }
  //
  // void changeLoadingState(bool state){
  //   _isLoading = state;
  //   notifyListeners();
  // }
}
final homeScreenProvider = ChangeNotifierProvider((ref) => HomeScreenProvider());