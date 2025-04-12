import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeNotifier() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', _isDarkTheme);
    notifyListeners();
  }

  ThemeData get currentTheme {
    return _isDarkTheme ? ThemeData.dark() : ThemeData.light();
  }
}
