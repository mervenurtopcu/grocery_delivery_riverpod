import 'all_models.dart';
import '../../product/enums/index.dart';
import '../../product/constants/index.dart';

// All products
final List<ProductModel> products = [
  ProductModel(0, 'Apple', StringConstants.productDetail, '9.99', 3.5,
      ProductImages.apple.toPng, 1, categoryNames[1], categoryImage[1], 50, productAmount: '1 Kg',productPriceWithDiscount: newPrice(9.99, 50.0)),

  ProductModel(1, 'Bananas', StringConstants.productDetail, '17.99', 4.5,
      ProductImages.bananas.toPng, 1, categoryNames[1], categoryImage[1], 20,
      productAmount: '1 Kg',productPriceWithDiscount: newPrice(17.99, 20.0)),

  ProductModel(2, 'Bread', StringConstants.productDetail, '5.00', 3.5,
      ProductImages.bread.toPng, 3, categoryNames[3], categoryImage[3], 0),

  ProductModel(3, 'Coffee', StringConstants.productDetail, '49.99', 4.0,
      ProductImages.coffee.toPng, 2, categoryNames[2], categoryImage[2], 50,productPriceWithDiscount: newPrice(49.99, 50.0)),

  ProductModel(4, 'Oranges', StringConstants.productDetail, '9.99', 4.0,
      ProductImages.orange.toPng, 1, categoryNames[1], categoryImage[1], 50, productAmount: '1 Kg',productPriceWithDiscount: newPrice(9.99, 50.0)),

  ProductModel(
      5, 'Strawberries', StringConstants.productDetail, '24.99', 3.5,
      ProductImages.strawberries.toPng, 1, categoryNames[1], categoryImage[1], 20, productAmount: '1 Kg',productPriceWithDiscount: newPrice(24.99, 20.0)),

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

//All categorie names
final List<String> categoryNames = [
  StringConstants.catVegetables,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_fruits.png?alt=media&token=c0fee4d8-91b3-4c27-a211-93cd148079db
  StringConstants.catFruits,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_fruits.png?alt=media&token=c0fee4d8-91b3-4c27-a211-93cd148079db
  StringConstants.catDrinks,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_drink.png?alt=media&token=d33fa5d0-7b61-4ca6-889c-9aef385214de
  StringConstants.catBakery,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_bakery.png?alt=media&token=ba601581-1ec8-409d-8d42-cbccd786d37d
  StringConstants.catSnacks,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_snacks.png?alt=media&token=c0990e05-5974-47dc-9364-52c3f8d5a4d6
  StringConstants.catMilkEgg,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_milk_egg.png?alt=media&token=5143dcd4-e5ef-46fd-86c2-08b8fead1e14
  StringConstants.catFrozen,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_frozen.png?alt=media&token=66a3fd2a-97c8-4de9-a83c-6a9f7d21be43
  StringConstants.catOils,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_oils.png?alt=media&token=6ce69ff0-4c1e-42d3-bc1f-bd2351aa6ad8
  StringConstants.catPasta,
  // https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_pasta.png?alt=media&token=966928a6-e0f2-407d-98cb-3e6d2d587766
  StringConstants.catCleaning
  //https://firebasestorage.googleapis.com/v0/b/grocery-delivery-54e0e.appspot.com/o/categories%2Fic_cleaning.png?alt=media&token=392843cb-dae6-4be9-aa0d-f836f497e66e
];

//All categorie images path
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
