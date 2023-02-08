import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences shared_preferences ;

  static Init ()async{
    shared_preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> SvaeData (
      {
        required String key,
        required dynamic value,
      }
      )async{
    if(value is String ) {
      return await shared_preferences.setString(key, value);
    }
    if(value is bool ) {
      return await shared_preferences.setBool(key, value);
    }
    if(value is int ) {
      return await shared_preferences.setInt(key, value);
    }
    return shared_preferences.setDouble(key, value);

  }

  static GetData({
    required String key,
  }){
    return shared_preferences.get(key);
  }

  static Future<bool> RemoveData({
    required String key
  })async{
    return await shared_preferences.remove(key);
  }
}