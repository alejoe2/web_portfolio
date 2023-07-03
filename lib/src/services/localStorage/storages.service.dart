part of'./../services.dart';

class Storages {

  static Future<bool>  setTheme({ required ThemeSelect data }) async => await LocalStorage.prefs.setString(StorageUbication.theme.name, data.name );

  static ThemeSelect get getTheme {
    
    if ( LocalStorage.prefs.getString(StorageUbication.theme.name) != null ) {
       
      final i = ThemeSelect.values.indexWhere(( element ) => element.name.contains( LocalStorage.prefs.getString(StorageUbication.theme.name)! ) );
      
      return ThemeSelect.values[i];
    }
    return ThemeSelect.light;
  }


}