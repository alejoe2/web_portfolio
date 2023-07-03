import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:web_portfolio/src/routers/router.dart';
import 'package:web_portfolio/src/services/services.dart';

void main() => runApp(const States());

class States extends StatefulWidget {
  const States({super.key});

  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    await LocalStorage.configPrefs();
    WidgetsFlutterBinding.ensureInitialized();
    RouterFluro.configRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => ThemeServices() ),
        ChangeNotifierProvider( create: ( _ ) => GlobalServices() ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {

  const MyApp({
    super.key, 
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async{
    await Future.delayed( const Duration( milliseconds: 500 ) );
    await Future.delayed( Duration.zero ).then((value) => Provider.of<ThemeServices>(context, listen: false).validateTheme( context: context ) );
    await Future.delayed( const Duration( milliseconds: 50 ) );
  }


  @override
  Widget build(BuildContext context) {

    final globalServices = Provider.of<GlobalServices>(context);

    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
        scrollbars: true,
      ),
        localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: globalServices.locale,
      supportedLocales: const [
          Locale('en', 'EN'),
          Locale('es', 'ES'),
      ],
      localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode || supportedLocale.countryCode == locale?.countryCode ) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      initialRoute: RouterFluro.rootRoute,
      onGenerateRoute: RouterFluro.router.generator,
      navigatorKey: NavigatonServices.navigatiorKey,
      builder: (_, child ) {
          return child!;
      },
    );
  }
}