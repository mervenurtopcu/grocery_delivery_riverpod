import 'package:flutter/material.dart';
import 'package:grocerydelivery/product/constants/index.dart';
import '../../features/search_view/search_delegate.dart';

PreferredSize appbarBottomWidget(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Text(
                StringConstants.appbarBottomText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorConstants.white,
                    ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(
                  Icons.search,
                  color: ColorConstants.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
