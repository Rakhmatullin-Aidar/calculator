import 'package:shared_preferences/shared_preferences.dart';

class SharedService{

  final key = 'calculations';

  Future<void> setData(List<String>? list) async{
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;

    prefs.setStringList(key, list ?? []);
  }

  Future<List<String>> getData() async{
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;

    final result = prefs.getStringList(key);
    return result ?? [];
  }
}