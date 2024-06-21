import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/models/ProfileModel.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<ProfileModel> getProfile() async {
    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .collection('profile')
        .get();
    final data = doc.docs.first.data();
    return ProfileModel.fromJson(data);
  }

  Future<void> updateProfile(ProfileModel profile, File image) async {
    final url = await addImage(image);
    profile.image_url = url;

    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .collection('profile')
        .get();
    final data = doc.docs.first.data();
    final newData = {
      ...data,
      ...profile.toJson(),
    };
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('profile')
        .doc(doc.docs.first.id)
        .update(newData);
  }

  Future<String> addImage(File image) async {
    String url = '';
    final ref = FirebaseStorage.instance.ref().child('profile/$uid');
    final uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();
    });
    return url;
  }
}
