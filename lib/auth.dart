import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Auth {
  Future<bool> register(email, password) async {
    print("signup wala me aya hai");
    print(email);
    print(password);
    try {
      dynamic credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Successful signup");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print("Signup failed");
      return false;
    } catch (e) {
      print(e);
      print("Sign up failed");
      return false;
    }
  }

  Future<bool> login(
    email,
    password,
  ) async {
    print("login wala me aya hai ");
    print(email);
    print(password);
    try {
      dynamic credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("successful login");
      dynamic user = FirebaseAuth.instance.currentUser;
      print("auth page me");
      print(user.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print("login failed");
      return false;
    }
  }

  static logout() async {
    await FirebaseAuth.instance.signOut();

    // <-- Import statement

    //   await FirebaseAuth.instance.signOut();
    // //   print("log out successful");
    //   FirebaseAuth.instance
    // .authStateChanges()
    // .listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     print('User is signed in!');
    //   }
    // });
    // await DefaultCacheManager().emptyCache();

    // FirebaseFirestore.instance.settings =
    //                                     Settings(persistenceEnabled: false);
    //                                 await FirebaseFirestore.instance
    //                                     .clearPersistence();

    // // Disable persistence on web platforms
    //  await FirebaseAuth.instance.setPersistence(Persistence.NONE);
    //   return "";
    // await FirebaseFirestore.instance.terminate(); await FirebaseFirestore.instance.clearPersistence();
  }
}
