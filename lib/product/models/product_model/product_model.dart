import 'package:grocerydelivery/product/enums/products_images.dart';

import '../categories_model/categories_model.dart';

class ProductModel extends CategoryModel {
  final int productId;
  final String productName;
  final String productDescription;
  final String productPrice;
  final double productRate;
  final String productImage;

  ProductModel(
      super.categoryName,
      super.categoryImage,
      super.categoryId,
      this.productId,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.productRate,
      this.productImage);
}

final List<String> productImage = [
  ProductImages.bananas.toPng,
  ProductImages.bread.toPng,
  ProductImages.coffee.toPng,
  ProductImages.tide.toPng,
];

final List<String> productPrice = ['17.99', '5.00', '49.99', '65.99'];
final List<double> productRate = [4.5, 3.5, 4.0, 5.0];
final List<String> productDescription = [
  'Fresh Bananas' *10,
  'Fresh Bread'*10,
  'Fresh Coffee'*10,
  'Tide Detergent'*10,
];
final List<String> productName = [
  'Bananas',
  'Bread',
  'Coffee',
  'Tide Detergent'
];
final List<CategoryModel> productCategory = [
 CategoryModel(1, 'Fruits', 'CategoriesImages.fruits.toPng'),
  CategoryModel(3, 'Bakery', 'CategoriesImages.bakery.toPng'),
  CategoryModel(2, 'Drinks', 'CategoriesImages.drinks.toPng'),
  CategoryModel(10, 'Cleaning', 'CategoriesImages.cleaning.toPng'),
];
final productList = List<ProductModel>.generate(
    productName.length, (index) {
  return ProductModel(
      productCategory[index].categoryId,
      productCategory[index].categoryName,
      productCategory[index].categoryImage,
      index,
      productName[index],
      productDescription[index],
      productPrice[index],
      productRate[index],
      productImage[index]);
});