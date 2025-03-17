import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_boxs_name.dart';
import 'pref_keys.dart';

class GlobalFunctions {
  GlobalFunctions._();

  static String? getLangCode() {
    Box localBox = Hive.box<String>(AppBox.localBox);
    String? langCode = localBox.get("lang");
    return langCode;
  }

  static Future<void> setLanguageCode(String langCode) async {
    Box localBox = Hive.box<String>(AppBox.localBox);
    await localBox.put("lang", langCode);
  }

  static bool isAuth() {
    Box localBox = Hive.box(AppBox.configBox);
    bool isauth = localBox.containsKey(PrefKeys.token);
    return isauth;
  }

  static Future<String?> getToken() async {
    Box localBox = Hive.box(AppBox.configBox);
    String? token = await localBox.get(PrefKeys.token);
    return token;
  }

  static Future<void> setToken(String token) async {
    Box localBox = Hive.box(AppBox.configBox);
    await localBox.put(PrefKeys.token, token);
  }

  static Future<void> removeToken() async {
    Box localBox = Hive.box(AppBox.configBox);
    await localBox.delete(PrefKeys.token);
  }

  static Future<void> logout() async {
    await removeToken();
    await removeUserId();
  }

  static int getUserId() {
    Box localBox = Hive.box(AppBox.configBox);
    int userId = localBox.get(PrefKeys.user);
    return userId;
  }

  static Future<void> setUserId(int userId) async {
    Box localBox = Hive.box(AppBox.configBox);
    await localBox.put(PrefKeys.user, userId);
  }

  static Future<void> removeUserId() async {
    Box localBox = Hive.box(AppBox.configBox);
    await localBox.delete(PrefKeys.user);
  }
}
