import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class AppbarSearchTextField extends StatelessWidget {
  const AppbarSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: ColorConstants.whiteApprox,
      ),
    );
  }
}
