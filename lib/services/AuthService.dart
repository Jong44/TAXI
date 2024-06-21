import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return "success";
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case 'invalid-credential':
          return 'Email atau Password Salah';
        default:
          return 'Unknown error';
      }
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password,
      String fullName, String gender, String birthday, String no_hp) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      _firestore.collection('users').doc(user.uid).collection('profile').add({
        'email': user.email,
        'uid': user.uid,
        'fullName': fullName,
        'gender': gender,
        'birthday': birthday,
        'no_hp': no_hp,
      });
      return "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'Email Sudah Terdaftar';
        default:
          return 'Unknown error';
      }
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
