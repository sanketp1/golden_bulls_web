import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_bulls_web_production/app/constant/appColor.dart';
import 'package:golden_bulls_web_production/app/constant/responseStatus.dart';
import 'package:golden_bulls_web_production/app/data/collectionPaths.dart';
import 'package:golden_bulls_web_production/app/data/models/guestModel.dart';
import 'package:golden_bulls_web_production/app/data/models/recored_video_model.dart';
import 'package:golden_bulls_web_production/app/data/models/refererModel.dart';
import 'package:golden_bulls_web_production/app/data/models/userModel.dart';
import 'package:golden_bulls_web_production/app/widgets/dialogBox.dart';

import '../models/carouselModel.dart';

class FireStore {
  static final _firestore = FirebaseFirestore.instance;

  //* method to getting the referer
  static Future<List<RefererModel>> getRefererList() async {
    List<RefererModel> referers = [];
    try {
      final data = await _firestore.collection(CollectionPaths.referer).get();
      data.docs.forEach((element) {
        referers.add(
            RefererModel.fromMap(element.data() as Map<String, dynamic>)
                .copyWith(id: element.id));
      });
    } on FirebaseException catch (err) {
      Get.snackbar(err.code, err.message!,
          backgroundColor: AppColor.snackBarColor,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
    return referers;
  }

  //* creating method for getting the carousel

  static Future<List<CarouselModel>> getCarouselsList() async {
    List<CarouselModel> carouselList = [];
    try {
      final data = await _firestore.collection(CollectionPaths.carousel).get();
      data.docs.forEach((element) {
        carouselList.add(
            CarouselModel.fromMap(element.data() as Map<String, dynamic>)
                .copyWith(id: element.id));
      });
    } on FirebaseException catch (err) {
      Get.snackbar(err.code, err.message!,
          backgroundColor: AppColor.snackBarColor,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }

    return carouselList;
  }

  //method to get the uploaded feedback stream
  static Stream<QuerySnapshot<Map<String, dynamic>>> getFeedbacks() {
    return _firestore.collection(CollectionPaths.feedbacks).snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAnalysis() {
    return _firestore.collection(CollectionPaths.analysis).snapshots();
  }

  static Future<int?> pushFcmToken(String uid, String token) async {
    try {
      await _firestore
          .collection(CollectionPaths.user)
          .doc(uid)
          .update({"fcmToken": token});
      return ResponseStatus.SUCCESS;
    } on FirebaseException catch (err) {
      Get.dialog(CustomDialog(
          title: err.code,
          message: err.message!,
          successButtonText: "OK",
          errorButtonText: "OK",
          isSuccess: false));
    }
    return null;
  }

  static Future<UserModel?> getUserInfo({required String uid}) async {
    UserModel? userModel;
    await _firestore
        .collection(CollectionPaths.user)
        .doc(uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data() as Map<String, dynamic>);
    });

    return userModel;
  }

  static Future<List<RecordedVideoModel>> getRecoredVideos() async {
    final data =
        await _firestore.collection(CollectionPaths.recorded_videos).get();

    final recored_vidoes = data.docs
        .map(
            (e) => RecordedVideoModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();

    return recored_vidoes;
  }

  // static Future<int?> registerUser(UserModel userModel) async {
  //   try {
  //     final data = userModel.toMap();
  //     data['keywords'] = SearchKeywords.generate(userModel.name!);
  //     await _firestore
  //         .collection(CollectionPaths.registration_request)
  //         .add(data);
  //     return ResponseStatus.SUCCESS;
  //   } on FirebaseException catch (err) {
  //     Get.dialog(CustomDialog(
  //         title: err.code,
  //         message: err.message!,
  //         successButtonText: "OK",
  //         errorButtonText: "OK",
  //         isSuccess: false));
  //   }
  //   return null;
  // }

  static Future<bool> isGuestExist(String id) async {
    final status =
        await _firestore.collection(CollectionPaths.guests).doc(id).get();
    if (status.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<int?> loginAsGuest(GuestModel guestModel) async {
    try {
      if (await isGuestExist(guestModel.contact_no)) {
        //do nothing
      } else {
        await _firestore
            .collection(CollectionPaths.guests)
            .doc(guestModel.contact_no)
            .set(guestModel.toMap());
      }

      return ResponseStatus.SUCCESS;
    } on FirebaseException catch (err) {
      Get.dialog(CustomDialog(
          title: err.code,
          message: err.message!,
          successButtonText: "OK",
          errorButtonText: "OK",
          isSuccess: false));
    }
  }

  //locking this feature as per client request that student can't write their data

  // static Future<dynamic> updateUserData({required UserModel userModel}) async {
  //   try {
  //     await _firestore
  //         .collection(CollectionPaths.user)
  //         .doc(userModel.uid)
  //         .update(userModel.toMap());
  //     return ResponseStatus.SUCCESS;
  //   } on FirebaseException catch (err) {
  //     return ResponseStatus.onError(
  //         status_code: err.code, message: err.message!);
  //   }
  // }
}
