// ignore_for_file: non_constant_identifier_names


import 'package:capstone_project_four/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Sooto? _UserFromFirebase(var user) {
    return user != null ? Sooto(uid: user.uid) : null;
  }

  Stream<Sooto?> get user =>
      _auth
          .authStateChanges()
          .map(_UserFromFirebase);

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _UserFromFirebase(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _UserFromFirebase(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in anonimous
  Future signInAnon() async {
    try {
      var result = await _auth.signInAnonymously();
      User? user = result.user;
      return _UserFromFirebase(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
}