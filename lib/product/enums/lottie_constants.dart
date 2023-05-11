enum LottieItems {
  shoppingNow,
}

extension LottieExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.shoppingNow:
        return 'lottie_shopping_now';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
