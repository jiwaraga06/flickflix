import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickflix/source/Env/env.dart';

class AuthRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late Stream<User?> authSubscription;
  Future session() async {
    try {
      authSubscription = firebaseAuth.authStateChanges();
      return authSubscription;
    } catch (e) {
      print("Error Session: $e");
    }
    return null;
  }

  Future<User?> signUpWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Error Sign Up: $e");
      messageAuthError = e.message!;
    }
    return null;
  }

  Future<User?> signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Error Sign In: $e");
      messageAuthError = e.message!;
    }
    return null;
  }

  Future<void> logout() async {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error Sign out: $e");
    }
  }
}
