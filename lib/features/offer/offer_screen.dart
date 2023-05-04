import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfferScreen extends ConsumerStatefulWidget {
  const OfferScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OfferScreenState();
}

class _OfferScreenState extends ConsumerState<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Offer Screen'),
    );
  }
}
