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
