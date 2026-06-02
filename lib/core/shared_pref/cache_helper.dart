import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper{

  static late final SharedPreferences _pref;

  static Future<void> init()async{
      _pref = await SharedPreferences.getInstance();
  }
  static Future<void> saveData({
    required String key,
    required dynamic value,
})async {
try {
  if(value is bool) {
    _pref.setBool(key, value);
  }else if(value is String) {
       await _pref.setString(key, value);
      }else if (value is int) {
       await _pref.setInt(key, value);
      }else if(value is double) {
       await _pref.setDouble(key, value);
      }else if(value is List<String>){
       await _pref.setStringList(key, value);
      }
    }catch(error){
  if (kDebugMode) {
    log(error.toString());
  }
  
};


  }
  static dynamic getData({
    required String key
}){
    try{
    updateData();
    return _pref.get(key);}catch(error){
      if(kDebugMode){
        log(error.toString());
      }
    }
  }

  static Future<bool> removeData({
    required String key
})async{
   return await _pref.remove(key);
  }

  static Future<bool>clearData() async {
    return await _pref.clear();
  }
  static Future<void> updateData()async {
    try{
    await _pref.reload();}catch(error){
      if(kDebugMode){
        log(error.toString());
      }
    }
  }


}