import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  final Future<SharedPreferences> sharedPreference = SharedPreferences.getInstance();
  final String _userKey = 'USER';
  final String _tokenKey = 'TOKEN';
  final String _isLoggedIn = 'IS_LOGGED_IN';

  // UserStorage({required this.sharedPreference});

  Future<dynamic> get user async {
    final prefs = await sharedPreference;
    return prefs.getString(_userKey) ?? {};
  }

  Future<dynamic> get token async {
    final prefs = await sharedPreference;
    return prefs.getString(_tokenKey) ?? '';
  }

  Future<dynamic> get isLoggedIn async {
    final prefs = await sharedPreference;
    return prefs.getBool(_isLoggedIn) ?? false;
  }

  void setUserKey (dynamic value) async {
    final prefs = await sharedPreference;
    prefs.setString(_userKey, json.encode(value));
  }

  void setTokenKey (String value) async {
    final prefs = await sharedPreference;
    prefs.setString(_tokenKey, value);
  }

  void setIsLoggedIn (bool value) async {
    final prefs = await sharedPreference;
    prefs.setBool(_isLoggedIn, value);
  }
}