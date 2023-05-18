import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grocerydelivery/features/cart/cart_screen_provider.dart';
import 'package:grocerydelivery/features/category/category_screen.dart';
import 'package:grocerydelivery/features/favorites/favorite_screen.dart';
import 'package:grocerydelivery/features/home/home_screen.dart';
import 'package:grocerydelivery/features/profile/profile_screen.dart';
import 'package:grocerydelivery/product/constants/color_constants.dart';
import '../../features/cart/cart_screen.dart';
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
    const FavoriteScreen(),
    const CartScreen(),
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
            const Spacer(
              flex: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BottomNavigationBar(
                currentIndex: navIndex.index,
                onTap: (index) {
                  ref.read(navProvider.notifier).updateIndex(index);
                },
                items:  [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Category',),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outlined), label: 'Favorite'),
                  ref.watch(cartScreenProvider).getCartList.isNotEmpty ? BottomNavigationBarItem(
                      icon: Stack(
                        children: [
                          Icon(Icons.shopping_cart),
                          Positioned(
                              top: 1.0,
                              right: 1.0,
                              child: Stack(
                            children: [
                              Container(
                                height: 15.0,
                                width: 15.0,
                                decoration: const BoxDecoration(
                                  color: ColorConstants.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(ref.watch(cartScreenProvider).getCartList.length.toString(),style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorConstants.white),),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    label: 'Cart',
                  ): const BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: 'Cart'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
