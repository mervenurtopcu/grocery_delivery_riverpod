part of 'cart_screen.dart';

class CartEmptyScreen extends ConsumerStatefulWidget {
  const CartEmptyScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CartEmptyScreenState();
}

class _CartEmptyScreenState extends ConsumerState<CartEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1,vertical: MediaQuery.of(context).size.height * 0.1),
      child: Center(
        child: Column(
          children: [
            Lottie.asset(LottieItems.emptyCart.lottiePath,
                height: 200, width: 200),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                StringConstants.cartEmpty,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorConstants.black,
                    fontSize: 16
                ),),
            ),
            Text(StringConstants.cartEmptyDescription,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorConstants.doveGray,
              ),textAlign: TextAlign.justify,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: (){
                    ref.read(navProvider.notifier).updateIndex(0);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.mountainMeadow,
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.05,vertical: MediaQuery.of(context).size.width*0.03),
                    shape: const StadiumBorder(),


                  ), child: Text(StringConstants.favAddProductButton,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorConstants.white,
              ),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
