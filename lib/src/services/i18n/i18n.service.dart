// ignore_for_file: prefer_collection_literals

part of './../services.dart';

class AppLocalizations {

  String _language = 'en';

  Map<String, Map<String, dynamic>> _localisedValues = Map<String, Map<String, dynamic>>();

  String get getLanguage => _language;

  static final AppLocalizations _singleton = AppLocalizations._internal();
  AppLocalizations._internal();
  static AppLocalizations get instance => _singleton;

  Future<AppLocalizations> load(Locale locale) async {
    _language = locale.languageCode;
    String jsonContent = await rootBundle.loadString("assets/i18n/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonContent);
    final resp = jsonMap.map((key, value) => MapEntry(key, value ));
    _localisedValues = resp.map((key, value) => MapEntry(key, value));
    return this;
  }

   String text({required String key, required String value}) {
     String text = '$key $value not found';
     if( _localisedValues[key] != null ) {
       if (_localisedValues[key]![value] != null) {
         text = _localisedValues[key]![value];
       }
     } 
    return text;
  }
  
}


class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.instance.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;
}