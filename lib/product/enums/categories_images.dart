enum CategoriesImages {
  vegetables('ic_vegetable'),
  fruits('ic_fruits'),
  meat('ic_meat'),
  seafood('ic_seafood'),
  milkEgg('ic_milk_egg'),
  bakery('ic_bakery'),
  drinks('ic_drink'),
  frozen('ic_frozen'),
  cleaning('ic_cleaning'),
  oil('ic_oils'),
  snacks('ic_snacks'),
  pasta('ic_pasta'),
  ;

  final String value;

  const CategoriesImages(this.value);

  String get toPng => 'assets/categories/$value.png';
}
