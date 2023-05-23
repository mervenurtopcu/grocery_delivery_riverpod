import 'package:flutter/material.dart';
import '../../features/search_view/search_delegate.dart';
import '../constants/color_constants.dart';
import 'appbar_search_textfield.dart';

PreferredSize appbarBottomWidget(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child:  Row(
            children: [
              Text("What are you looking for? ", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorConstants.white,
                  ),),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // method to show the search bar
                  showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate()
                  );
                },
                icon: const Icon(Icons.search, color: ColorConstants.white,),
              ),
            ],
          ),


          // IconButton(
          //   onPressed: () {
          //     // method to show the search bar
          //     showSearch(
          //         context: context,
          //         // delegate to customize the search bar
          //         delegate: CustomSearchDelegate()
          //     );
          //   },
          //   icon: const Icon(Icons.search),
          // ),
        ),
      ),
    ),
  );
}
