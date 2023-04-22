import 'dart:developer';

import 'package:get/get.dart';

import '../../../constant/loadingState.dart';
import '../../../data/models/userModel.dart';
import '../../../data/services/authentication.dart';
import '../../../data/services/firestore.dart';
import '../../../data/services/storage.dart';
import '../../../routes/app_pages.dart';
import '../views/login_view.dart';

class LoginController extends GetxController {
    
  Rx<UserModel> gUserModel = UserModel().obs;
  Rx<LoadingState> pageState = LoadingState.initial.obs;

  Future<void> onLogIn(String email, String password) async {
    pageState.value = LoadingState.loading;
    final user = await Authentication.signIn(email, password);
    if (user != null) {

      final userModel = await FireStore.getUserInfo(uid: user.uid);
      
   
      if (userModel!=null) {
        await Storage.saveUser(userModel);

        gUserModel.value = userModel;

        pageState.value = LoadingState.done;
        Get.offAllNamed(Routes.HOME , arguments: gUserModel.value);
      } else {
        pageState.value = LoadingState.error;
        Get.to(() => LoginView());
      }
    } else {
      pageState.value = LoadingState.error;
      Get.to(() => LoginView());

      log("An error occured");
    }
  }
  @override
  void onInit() {
    super.onInit();
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
