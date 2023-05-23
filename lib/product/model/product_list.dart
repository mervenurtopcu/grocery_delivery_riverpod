import 'package:flutter/material.dart';
import 'all_models.dart';
import '../../product/enums/index.dart';
import '../../product/constants/index.dart';

// All products
final List<ProductModel> products = [
  ProductModel(0, 'Apple', StringConstants.productDetail, '9.99', 3.5,
      ProductImages.apple.toPng, 1, categoryNames[1], categoryImage[1], 50,
      productAmount: '1 Kg', productPriceWithDiscount: newPrice(9.99, 50.0)),
  ProductModel(1, 'Bananas', StringConstants.productDetail, '17.99', 4.5,
      ProductImages.bananas.toPng, 1, categoryNames[1], categoryImage[1], 20,
      productAmount: '1 Kg', productPriceWithDiscount: newPrice(17.99, 20.0)),
  ProductModel(2, 'Bread', StringConstants.productDetail, '5.00', 3.5,
      ProductImages.bread.toPng, 3, categoryNames[3], categoryImage[3], 0),
  ProductModel(3, 'Coffee', StringConstants.productDetail, '49.99', 4.0,
      ProductImages.coffee.toPng, 2, categoryNames[2], categoryImage[2], 50,
      productPriceWithDiscount: newPrice(49.99, 50.0)),
  ProductModel(4, 'Oranges', StringConstants.productDetail, '9.99', 4.0,
      ProductImages.orange.toPng, 1, categoryNames[1], categoryImage[1], 50,
      productAmount: '1 Kg', productPriceWithDiscount: newPrice(9.99, 50.0)),
  ProductModel(
      5,
      'Strawberries',
      StringConstants.productDetail,
      '24.99',
      3.5,
      ProductImages.strawberries.toPng,
      1,
      categoryNames[1],
      categoryImage[1],
      20,
      productAmount: '1 Kg',
      productPriceWithDiscount: newPrice(24.99, 20.0)),
  ProductModel(6, 'Tide Detergent', StringConstants.productDetail, '65.99', 5.0,
      ProductImages.tide.toPng, 9, categoryNames[9], categoryImage[9], 0),
  ProductModel(7, 'Watermelon', StringConstants.productDetail, '32.00', 4.5,
      ProductImages.watermelon.toPng, 1, categoryNames[1], categoryImage[1], 20,
      productAmount: '3 Kg', productPriceWithDiscount: newPrice(32.00, 20.0)),
];

String newPrice(double price, double discountRate) {
  return (price - (price * discountRate / 100)).toStringAsFixed(2);
}

//product list by category id
List<ProductModel>? productLists(int categoryId) {
  switch (categoryId) {
    case 0:
      return products.where((element) => element.categoryId == 0).toList();
    case 1:
      return products.where((element) => element.categoryId == 1).toList();
    case 2:
      return products.where((element) => element.categoryId == 2).toList();
    case 3:
      return products.where((element) => element.categoryId == 3).toList();
    case 4:
      return products.where((element) => element.categoryId == 4).toList();
    case 5:
      return products.where((element) => element.categoryId == 5).toList();
    case 6:
      return products.where((element) => element.categoryId == 6).toList();
    case 7:
      return products.where((element) => element.categoryId == 7).toList();
    case 8:
      return products.where((element) => element.categoryId == 8).toList();
    case 9:
      return products.where((element) => element.categoryId == 9).toList();
  }
  return null;
}

// product list by discount rate
final List<ProductModel> twentyDiscountList =
    products.where((element) => element.discountRate == 20).toList();
final List<ProductModel> fiftyDiscountList =
    products.where((element) => element.discountRate == 50).toList();

//All category names
final List<String> categoryNames = [
  StringConstants.catVegetables,
  StringConstants.catFruits,
  StringConstants.catDrinks,
  StringConstants.catBakery,
  StringConstants.catSnacks,
  StringConstants.catMilkEgg,
  StringConstants.catFrozen,
  StringConstants.catOils,
  StringConstants.catPasta,
  StringConstants.catCleaning
];

//All category image paths
final List<String> categoryImage = [
  CategoriesImages.vegetables.toPng,
  CategoriesImages.fruits.toPng,
  CategoriesImages.drinks.toPng,
  CategoriesImages.bakery.toPng,
  CategoriesImages.snacks.toPng,
  CategoriesImages.milkEgg.toPng,
  CategoriesImages.frozen.toPng,
  CategoriesImages.oil.toPng,
  CategoriesImages.pasta.toPng,
  CategoriesImages.cleaning.toPng
];

//category list
final categoryList =
    List<CategoryModel>.generate(categoryNames.length, (index) {
  return CategoryModel(index, categoryNames[index], categoryImage[index]);
});

//discount product list
final discountProductList =
    products.where((element) => element.discountRate != 0).toList();

//discount list for home screen
final discountLists = List<DiscountModel>.generate(2, (index) {
  if (index % 2 == 0) {
    return DiscountModel(
        index,
        StringConstants.discountTitle1,
        StringConstants.discountDescription1,
        PngConstants.vegetables.toPng,
        ColorConstants.offGreen);
  } else {
    return DiscountModel(
        index,
        StringConstants.discountTitle2,
        StringConstants.discountDescription2,
        PngConstants.carrot.toPng,
        ColorConstants.negroni);
  }
});

final profileList = [
  Profile(
      index: 0,
      listTitle: StringConstants.profilePersonalInfo,
      icon: const Icon(Icons.person),
      color: Colors.deepPurpleAccent),
  Profile(
      index: 1,
      listTitle: StringConstants.profileYourActivity,
      icon: const Icon(Icons.history),
      color: Colors.orangeAccent),
  Profile(
      index: 2,
      listTitle: StringConstants.profileSettings,
      icon: const Icon(Icons.settings),
      color: Colors.pinkAccent),
  Profile(
      index: 3,
      listTitle: StringConstants.profileRewards,
      icon: const Icon(Icons.card_giftcard),
      color: Colors.greenAccent),
  Profile(
      index: 4,
      listTitle: StringConstants.profileQrCode,
      icon: const Icon(Icons.qr_code),
      color: Colors.lightBlueAccent),
  Profile(
      index: 5,
      listTitle: StringConstants.profileNotification,
      icon: const Icon(Icons.notifications),
      color: Colors.deepOrangeAccent),
  Profile(
      index: 6,
      listTitle: StringConstants.profileLogOut,
      icon: const Icon(Icons.logout),
      color: Colors.purpleAccent),
];
