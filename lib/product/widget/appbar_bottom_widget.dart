import 'package:flutter/material.dart';
import 'appbar_search_textfield.dart';

PreferredSize appbarBottomWidget(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: const AppbarSearchTextField(),
        ),
      ),
    ),
  );
}
