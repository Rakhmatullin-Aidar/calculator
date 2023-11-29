import 'package:shared_preferences/shared_preferences.dart';

class SharedService{

  final key = 'calculations';

  Future<void> setData(List<String> list) async{
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    prefs.setStringList(key, list);
  }

  Future<List<String>?> getData() async{
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    final result = prefs.getStringList(key);
    return result;
  }
}