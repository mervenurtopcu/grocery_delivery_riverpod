// Model of product
import 'dart:ui';

class ProductModel {
  final int productId;
  final String productName;
  final String productDescription;
  final String? productAmount;
  final String? productPriceWithDiscount;
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
      this.discountRate,
      {this.productAmount,
      this.productPriceWithDiscount});

}

//category model
class CategoryModel {
  CategoryModel(this.categoryId, this.categoryName, this.categoryImage);

  final int categoryId;
  final String categoryName;
  final String categoryImage;
}

//discount model
class DiscountModel {
  DiscountModel(this.discountId, this.discountTitle, this.discountDescription,
      this.url, this.color);

  final int discountId;
  final String discountTitle;
  final String discountDescription;
  final String url;
  final Color color;
}
