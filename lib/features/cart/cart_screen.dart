import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
