part of'../services.dart';

class GlobalServices with ChangeNotifier {

  Locale _locale = const Locale('es', 'ES');

  Locale get locale => _locale;

  void setlocale(Locale locale) async {
    _locale = locale;
    notifyListeners();
  }

}