import 'package:flutter/material.dart';
import '../../features/search_view/search_delegate.dart';
import '../../product/constants/index.dart';

class AppbarSearchTextField extends StatelessWidget {
  const AppbarSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: IconButton(
          onPressed: () {
            // method to show the search bar
            showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
            );
          },
          icon: const Icon(Icons.search),
        ),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: ColorConstants.white,

      ),
    );
  }
}
