import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
  });

  final IconData icon;
  final double height ;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: ColorConstants.mountainMeadow,
        ),
        child:  Icon(
          icon,
          color: ColorConstants.white,
        ));
  }
}