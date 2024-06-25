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

  Future<String> updateProfile(ProfileModel profile, File image) async {
    if (image.path != '') {
      final ref = FirebaseStorage.instance.ref().child('profile/$uid.jpg');
      final uploadTask = ref.putFile(image);
      uploadTask.whenComplete(() async {
        profile.image_url = await ref.getDownloadURL();

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
      });
    } else {
      return 'Image is required';
    }
    return 'Success';
  }

  Future<String> getUid() async {
    return uid;
  }
}
