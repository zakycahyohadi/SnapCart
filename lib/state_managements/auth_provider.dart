import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier { 
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  String? _email;
  String? get email => _email;

  AuthProvider() {
    loadAuth();
  }

  // untuk handle konfigurasi perubahan tema secara lokal
  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    // setbool => key & value
    print("loadAuth: $_isLoggedIn");
    notifyListeners();
  }

  void setAuth(bool status, {String? email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // getbool => key aja
    if (status) {
      _email = email;
    }else{
      _email = null;
    }
    _isLoggedIn = status;
    await prefs.setBool("isLoggedIn", status);
    notifyListeners();
  }
}