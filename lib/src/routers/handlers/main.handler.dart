part of'./../router.dart';

class HandlerAuthViews { 


  static Handler homePage = Handler(
    handlerFunc: ( context, params ) {
      // final sideMenuServices = Provider.of<SideMenuServices>(context!, listen: false);
      return const HomePage();
    }
  );
  
}