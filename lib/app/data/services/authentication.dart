import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../constant/responseStatus.dart';
import '../../widgets/dialogBox.dart';

class Authentication {
  static final _firebase_auth = FirebaseAuth.instance;

  //* creating method for resetting the password link
  static Future<int?> resetPasswordLink({required String email}) async {
    try {
      await _firebase_auth.sendPasswordResetEmail(email: email);
      return ResponseStatus.SUCCESS;
    } on FirebaseAuthException catch (err) {
      Get.dialog(CustomDialog(
          title: "Error",
          message: err.message!,
          successButtonText: "OK",
          errorButtonText: "OK",
          isSuccess: false));
    }
  }

  //signing in the app
  static Future<User?> signIn(String email, String password) async {
    User? user;
    try {
      final status = await _firebase_auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = status.user;
    } on FirebaseAuthException catch (err) {
      Get.dialog(CustomDialog(
          title: "Error",
          message: err.message!,
          successButtonText: "OK",
          errorButtonText: "OK",
          isSuccess: false));
    }

    return user;
  }

  static Future<void> signOut() async {
    try {
      await _firebase_auth.signOut();
    } on FirebaseAuthException catch (err) {
      log(err.message!);
    }
  }

  static User? getCurrentUser() {
    return _firebase_auth.currentUser;
  }
}
