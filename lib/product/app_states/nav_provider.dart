import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/product/app_states/nav_states.dart';

class NavProvider extends StateNotifier<NavStates>{
  NavProvider() : super(const NavStates());

  void updateIndex(int index) {
    state = state.copyWith(index: index);
  }


}

final navProvider = StateNotifierProvider<NavProvider, NavStates>((ref) {
  return NavProvider();
});