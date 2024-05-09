import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/utils/formatTanggal.dart';

class MoodTrackerService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> tambahRiwayatMoodTracker(Map<String, dynamic> track) async {
    bool isExist = false;
    await init();
    Map<String, dynamic> moodTracker = {
      "point": track['point'].toString(),
      "date": track['date'].toString(),
    };

    List<String> listMoodTracker = _prefs.getStringList('moodTracker') ?? [];

    listMoodTracker.forEach((element) {
      if (element.substring(17, element.length - 1) ==
          DateFormat("yyyy-MM-dd").format(DateTime.now())) {
        isExist = true;
      }
    });

    if (!isExist) {
      listMoodTracker.add(moodTracker.toString());
    } else {
      listMoodTracker.removeWhere((element) =>
          element.substring(17, element.length - 1) ==
          DateFormat("yyyy-MM-dd").format(DateTime.now()));
      listMoodTracker.add(moodTracker.toString());
    }

    await _prefs.setStringList('moodTracker', listMoodTracker);
  }

  Future<List<Map<String, dynamic>>> getRiwayatMoodTracker() async {
    await init();
    List<String> listMoodTracker = _prefs.getStringList('moodTracker') ?? [];
    List<Map<String, dynamic>> result = [];
    listMoodTracker.forEach((element) {
      Map<String, dynamic> moodTracker = {
        "point": element.substring(8, 9),
        "date": element.substring(17, element.length - 1),
      };
      result.add(moodTracker);
    });
    return result;
  }

  Future<int> getPointMoodTrackerToday() async {
    await init();
    List<String> listMoodTracker = _prefs.getStringList('moodTracker') ?? [];
    int point = 0;
    listMoodTracker.forEach((element) {
      if (element.substring(17, element.length - 1) ==
          DateFormat("yyyy-MM-dd").format(DateTime.now())) {
        point = int.parse(element.substring(8, 9));
      }
    });
    return point;
  }
}
