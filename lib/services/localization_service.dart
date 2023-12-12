import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LocalizationService with ChangeNotifier {
  late Locale _locale;
  late Map<String, dynamic> _localizedStrings = {};

  static LocalizationService? _instance;

  static LocalizationService getInstance() {
    _instance ??= LocalizationService();
    return _instance!;
  }

  Locale getLocale() => _locale;

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedLanguageCode = prefs.getString('language_code');
    _locale = Locale(storedLanguageCode ?? 'en');
    await _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    String languageCode = _locale.languageCode;
    bool fileExists = await rootBundle
        .load('assets/$languageCode.json')
        .then((value) => true)
        .catchError((error) => false);
    if (fileExists) {
      String jsonString = await rootBundle.loadString('assets/$languageCode.json');
      _localizedStrings = json.decode(jsonString);
    } else {
      String jsonString = await rootBundle.loadString('assets/en.json');
      _localizedStrings = json.decode(jsonString);
    }
    notifyListeners();
  }

  String? translate(String key) {
    return _localizedStrings[key];
  }

  Future<void> changeLanguage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    _locale = locale;
    await _loadLanguage();
  }

  void initializeLocale(Locale locale) {
    _locale = locale;
  }

  Locale get locale => _locale;

}