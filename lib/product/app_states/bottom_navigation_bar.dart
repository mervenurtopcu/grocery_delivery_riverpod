import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grocerydelivery/features/category/category_screen.dart';
import 'package:grocerydelivery/features/help/help_screen.dart';
import 'package:grocerydelivery/features/home/home_screen.dart';
import 'package:grocerydelivery/features/offer/offer_screen.dart';
import 'package:grocerydelivery/features/profile/profile_screen.dart';

import '../constants/color_constants.dart';
import 'nav_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CategoryScreen(),
    const HelpScreen(),
    const OfferScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      body: Center(
        child: _widgetOptions[navIndex.index],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BottomNavigationBar(
                currentIndex: navIndex.index,
                onTap: (index) {
                  ref.read(navProvider.notifier).updateIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Category',),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.help), label: 'Help'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.local_offer), label: 'Offer'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
