enum LottieItems {
  shoppingNow,
  emptyCart,
}

extension LottieExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.shoppingNow:
        return 'lottie_shopping_now';
      case LottieItems.emptyCart:
        return 'lottie_empty_cart';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
