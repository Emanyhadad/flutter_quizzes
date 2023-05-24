import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController{

  late SharedPreferences prefs;
  static SharedPreferencesController? inctance;

  SharedPreferencesController._init();

  factory SharedPreferencesController(){
    return inctance ??= SharedPreferencesController._init();
  }

  getInit() async {
    prefs = await SharedPreferences.getInstance();}

  setData({key, value}){
    if(value is int) prefs.setInt(key, value);
    else if(value is String) prefs.setString(key, value);
    else if(value is bool) prefs.setBool(key, value);
    else if(value is double) prefs.setDouble(key, value);}

  getData getData <getData> (key){return prefs.get(key) as getData;}
}

