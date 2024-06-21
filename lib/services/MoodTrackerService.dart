import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/utils/formatTanggal.dart';

class MoodTrackerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addMoodTracker(String note, List emosiNegatif, List emosiPositif,
      List pengaruh, int point) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('mood_tracker')
        .add({
      'point': point,
      'note': note,
      'emosi_negatif': emosiNegatif,
      'emosi_positif': emosiPositif,
      'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      'pengaruh': pengaruh,
    });
  }

  Future<List> getMoodTracker() async {
    List moodTracker = [];
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('mood_tracker')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        moodTracker.add(doc.data());
      });
    });
    return moodTracker;
  }

  Future<int> getPointMoodTrackerToday() async {
    int point = 0;
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('mood_tracker')
        .where('date',
            isEqualTo: DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        final data = doc.data() as Map;
        point = data['point'];
      });
    });
    return point;
  }

  Future getMoodTrackerToday() async {
    Map moodTracker = {};
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('mood_tracker')
        .where('date',
            isEqualTo: DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        moodTracker = doc.data() as Map;
        moodTracker['id'] = doc.id;
      });
    });
    return moodTracker;
  }

  Future updateMoodTracker(String note, List emosiNegatif, List emosiPositif,
      List pengaruh, int point, String id) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('mood_tracker')
        .doc(id)
        .update({
      'note': note,
      'emosi_negatif': emosiNegatif,
      'emosi_positif': emosiPositif,
      'pengaruh': pengaruh,
      'point': point,
    });
  }
}
