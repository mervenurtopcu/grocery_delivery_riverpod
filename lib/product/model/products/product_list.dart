import 'dart:ui';

import 'package:grocerydelivery/product/enums/products_images.dart';
import '../../constants/color_constants.dart';
import '../../constants/string_constants.dart';
import '../../enums/categories_images.dart';
import '../../enums/png_constants.dart';


class ProductModel{
  final int productId;
  final String productName;
  final String productDescription;
  final String productPrice;
  final double productRate;
  final String productImage;
  final int categoryId;
  final String categoryName;
  final String categoryImage;
  final double discountRate;

  ProductModel(
      this.productId,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.productRate,
      this.productImage,
      this.categoryId,
      this.categoryName,
      this.categoryImage,
      this.discountRate);


}


final List<ProductModel> products = [
  ProductModel(0,'Apple', 'AppleApple', '15.99', 3.5, ProductImages.apple.toPng, 1, categoryNames[1], categoryImage[1], 0),
  ProductModel(1, 'Bananas', 'BananaBanana', '17.99', 4.5, ProductImages.bananas.toPng, 1, categoryNames[1], categoryImage[1], 20),
  ProductModel(2, 'Bread', 'BreadBread', '5.00', 3.5, ProductImages.bread.toPng, 3, categoryNames[3], categoryImage[3], 0),
  ProductModel(3, 'Coffee', 'CoffeeCoffee', '49.99', 4.0, ProductImages.coffee.toPng, 2, categoryNames[2], categoryImage[2], 50),
  ProductModel(4, 'Oranges', 'OrangesOranges', '9.99', 4.0, ProductImages.orange.toPng, 1, categoryNames[1], categoryImage[1], 0),
  ProductModel(5, 'Strawberries', 'StrawberriesStrawberries', '24.99', 3.5, ProductImages.strawberries.toPng, 1, categoryNames[1], categoryImage[1], 20),
  ProductModel(6, 'Tide Detergent', 'Tide DetergentTide Detergent', '65.99', 5.0, ProductImages.tide.toPng, 9, categoryNames[9], categoryImage[9], 0),
  ProductModel(0, 'Watermelon', 'WatermelonWatermelon', '32.00', 4.5, ProductImages.watermelon.toPng, 1, categoryNames[1], categoryImage[1], 20),

];



//kategoriye göre ürün listesi
List<ProductModel>? productLists(int categoryId){
   switch (categoryId){
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
  // final List<ProductModel> catVegetablesList = products.where((element) => element.categoryId == 0).toList();
  // final List<ProductModel> catFruitsList = products.where((element) => element.categoryId == 1).toList();
  // final List<ProductModel> catDrinksList = products.where((element) => element.categoryId == 2).toList();
  // final List<ProductModel> catBakeryList = products.where((element) => element.categoryId == 3).toList();
  // final List<ProductModel> catSnacksList = products.where((element) => element.categoryId == 4).toList();
  // final List<ProductModel> catMilkEggList = products.where((element) => element.categoryId == 5).toList();
  // final List<ProductModel> catFrozenList = products.where((element) => element.categoryId == 6).toList();
  // final List<ProductModel> catOilsList = products.where((element) => element.categoryId == 7).toList();
  // final List<ProductModel> catPastaList = products.where((element) => element.categoryId == 8).toList();
  // final List<ProductModel> catCleaningList = products.where((element) => element.categoryId == 9).toList();

}


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

class CategoryModel {
  CategoryModel(this.categoryId, this.categoryName, this.categoryImage);

  final int categoryId;
  final String categoryName;
  final String categoryImage;
}

final categoryList = List<CategoryModel>.generate(categoryNames.length, (index) {
  return CategoryModel(index, categoryNames[index], categoryImage[index]);
});

//indirimli ürün listesi
final discountProductList = products.where((element) => element.discountRate != 0).toList();



class DiscountModel {
  DiscountModel(this.discountId, this.discountTitle, this.discountDescription,
      this.url, this.color);

  final int discountId;
  final String discountTitle;
  final String discountDescription;
  final String url;
  final Color color;


}

final discountLists =List<DiscountModel>.generate(10, (index){
  if(index%2==0){
    return DiscountModel(index, StringConstants.discountTitle1, StringConstants.discountDescription1, PngConstants.vegetables.toPng, ColorConstants.offGreen);
  }else {
    return DiscountModel(index, StringConstants.discountTitle2, StringConstants.discountDescription2, PngConstants.carrot.toPng, ColorConstants.negroni);

  }
});


List<ProductModel> twentyDiscountList = [];
List<ProductModel> fiftyDiscountList = [];

List<ProductModel> getDiscountList() {
  for (int i = 0; i < products.length; i++) {
    if (products[i].discountRate == 20) {
      twentyDiscountList.add(products[i]);
      return twentyDiscountList;
    } else if (products[i].discountRate == 50) {
      fiftyDiscountList.add(products[i]);
      return fiftyDiscountList;
    }
  }
  return [];
}
