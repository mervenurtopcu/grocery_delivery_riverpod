import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../product/constants/index.dart';

class CategoryCard extends ConsumerStatefulWidget {
  const CategoryCard({
    Key? key,
    required this.list,
    this.containerHeight,
    required this.imageWidth,
    this.containerWidth,
    required this.fit,
  }) : super(key: key);

  final list;
  final double imageWidth;
  final double? containerWidth;
  final BoxFit fit;
  final double? containerHeight;

  @override
  ConsumerState createState() => _CategoryCardState();
}

class _CategoryCardState extends ConsumerState<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: ColorConstants.offGreen,
      ),
      child: FittedBox(
        fit: widget.fit,
        child: Image.asset(
          widget.list.categoryImage,
          width: widget.imageWidth,
        ),
      ),
    );
  }
}
