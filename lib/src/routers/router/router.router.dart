part of'./../router.dart';

class RouterFluro {

  static final FluroRouter router = FluroRouter();

  static String rootRoute               = '/';


  static void configRoutes() {
    // Routes
    router.define( rootRoute, handler: HandlerAuthViews.homePage, transitionType: TransitionType.none );

    // 404
    router.notFoundHandler = HandlerNoPageViews.noPage;
  }


}