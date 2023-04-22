import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:golden_bulls_web_production/app/constant/loadingState.dart';

import '../../../data/models/carouselModel.dart';
import '../../../data/models/userModel.dart';
import '../../../data/services/authentication.dart';
import '../../../data/services/firestore.dart';
import '../../../data/services/storage.dart';

class HomeController extends GetxController {
  RxInt drawerIndex = 0.obs;

  //method for changing the page
  void changePage(int index) {
    drawerIndex.value = index;
  }

  //setting up list for getting the carousels
  RxList<Widget> carouselItems = <Widget>[].obs;

  //setting up enum for checking is all carousel are loaded or not?
  Rx<LoadingState> isAllCarouselLoaded = LoadingState.initial.obs;

  Rx<UserModel> user = UserModel().obs;

  User? firebase_user;

  Future<void> getCarousels() async {
    isAllCarouselLoaded.value = LoadingState.loading;
    List<CarouselModel> carouselList = await FireStore.getCarouselsList();
    carouselList.forEach((element) {
      carouselItems.add(Image.network(
        element.src,
        fit: BoxFit.cover,
      ));
    });
    isAllCarouselLoaded.value = LoadingState.done;

    // print(carouselItems.value);
  }

  void getCurrentUserInfo() {
    firebase_user = Authentication.getCurrentUser();
    
    print("Getting current user");
    if (Storage.getUser() != null) {
      user.value = Storage.getUser()!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCarousels();
    getCurrentUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
