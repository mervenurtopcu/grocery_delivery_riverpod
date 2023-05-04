import '../categories_model/categories_model.dart';

class ProductModel extends CategoryModel {
  final int productId;
  final String productName;
  final String productDescription;
  final String productLongDescription;
  final double productPrice;
  final double productRate;

  ProductModel(
      super.categoryName,
      super.categoryImage,
      super.categoryId,
      this.productId,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.productRate,
      this.productLongDescription,);
}
