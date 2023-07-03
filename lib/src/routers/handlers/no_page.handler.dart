part of'./../router.dart';

class HandlerNoPageViews { 

  static Handler noPage = Handler(
    handlerFunc: ( context, params ) {
      return const NoPageFoundView();
    }
  );
  
}