enum LottieItems {
  shoppingNow,
  emptyCart,
  loading,
}

extension LottieExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.shoppingNow:
        return 'lottie_shopping_now';
      case LottieItems.emptyCart:
        return 'lottie_empty_cart';
      case LottieItems.loading:
        return 'lottie_loading';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
