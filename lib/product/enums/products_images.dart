import 'package:flutter/material.dart';

enum ProductImages {
  bananas('ic_bananas'),
  bread('ic_bread'),
  coffee('ic_coffee'),
  tide('ic_tide'),
  ;
  final String value;
  const ProductImages(this.value);

  String get toPng => 'assets/products/${value}.png';
  //Image get toImage => Image.asset(toPng);
}