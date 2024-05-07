import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/models/ProfileModel.dart';

class ProfileService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String> getData() async {
    await init();
    return _prefs.getString('dataProfile') ?? '';
  }

  Future<void> saveData(Map<String, dynamic> data) async {
    await init();
    ProfileModel profile = ProfileModel.fromJson(data);
    String dataProfile = jsonEncode(data);
    _prefs.setString('dataProfile', dataProfile);
  }
}
