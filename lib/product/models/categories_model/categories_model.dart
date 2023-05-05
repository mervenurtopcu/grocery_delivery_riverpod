import 'package:grocerydelivery/product/constants/string_constants.dart';
import 'package:grocerydelivery/product/enums/categories_images.dart';

class CategoryModel {
  CategoryModel(this.categoryId, this.categoryName, this.categoryImage);

  final int categoryId;
  final String categoryName;
  final String categoryImage;
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

final categoryList =
    List<CategoryModel>.generate(categoryNames.length, (index) {
  return CategoryModel(index, categoryNames[index], categoryImage[index]);
});
