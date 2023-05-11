enum ProductImages {
  bananas('ic_bananas'),
  apple('ic_apple'),
  orange('ic_oranges'),
  strawberries('ic_strawberries'),
  watermelon('ic_watermelon'),
  bread('ic_bread'),
  coffee('ic_coffee'),
  tide('ic_tide'),
  ;
  final String value;
  const ProductImages(this.value);

  String get toPng => 'assets/products/$value.png';
  //Image get toImage => Image.asset(toPng);
}