import 'package:grocerydelivery/product/models/product_model/product_model.dart';
import '../../enums/products_images.dart';
import '../categories_model/categories_model.dart';

final List<String> discountProductImage = [
  ProductImages.bananas.toPng,
  ProductImages.bread.toPng,
  ProductImages.coffee.toPng,
  ProductImages.tide.toPng,
];

final List<String> discountProductPrice = ['17.99', '5.00', '49.99', '65.99'];
final List<double> discountProductRate = [4.5, 3.5, 4.0, 5.0];
final List<String> discountProductDescription = [
  'Fresh Bananas' * 10,
  'Fresh Bread' * 10,
  'Fresh Coffee' * 10,
  'Tide Detergent' * 10,
];
final List<String> discountProductName = [
  'Bananas',
  'Bread',
  'Coffee',
  'Tide Detergent'
];
final List<CategoryModel> discountProductCategory = [
  CategoryModel(1, 'Fruits', 'CategoriesImages.fruits.toPng'),
  CategoryModel(3, 'Bakery', 'CategoriesImages.bakery.toPng'),
  CategoryModel(2, 'Drinks', 'CategoriesImages.drinks.toPng'),
  CategoryModel(10, 'Cleaning', 'CategoriesImages.cleaning.toPng'),
];
final discountProductList =
    List<ProductModel>.generate(discountProductName.length, (index) {
  return ProductModel(
      discountProductCategory[index].categoryId,
      discountProductCategory[index].categoryName,
      discountProductCategory[index].categoryImage,
      index,
      discountProductName[index],
      discountProductDescription[index],
      discountProductPrice[index],
      discountProductRate[index],
      discountProductImage[index]);
});
