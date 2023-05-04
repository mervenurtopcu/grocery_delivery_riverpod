import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/product/constants/color_constants.dart';
import 'package:grocerydelivery/product/enums/assets_image_size.dart';
import 'package:grocerydelivery/product/widget/appbar_search_textfield.dart';

import '../../product/enums/png_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome \nLena John'),
        actions: [
          Image.asset(
            PngConstants.avatar.toPng,
            width: AssetsImageSize.small.value,
          ),
        ],
        bottom: appbarBottomWidget(context),
      ),
    );
  }

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
}
