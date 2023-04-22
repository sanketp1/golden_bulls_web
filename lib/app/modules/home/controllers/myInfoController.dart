import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constant/loadingState.dart';
import '../../../data/models/userModel.dart';

class MyInfoController extends GetxController {
  UserModel userModel;

  MyInfoController({required this.userModel});

  RxBool canEdit = false.obs;

  Rx<LoadingState> pageState = LoadingState.initial.obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact_no = TextEditingController();
  TextEditingController location = TextEditingController();

  void initiallize() {
    name.text = userModel.name!;
    email.text = userModel.email!;
    contact_no.text = userModel.contact_no!;
    location.text = userModel.location!;
  }

//As per client demand student don't need to edit (write) their information
//that't why commenting this section in future if needed can be revoke again
  /*

  void doEdit() {
    canEdit.value = true;
  }

  void disableEdit() {
    canEdit.value = false;
  }


  Future<void> saveInfo() async {
    pageState.value = LoadingState.loading;
    final updated_userModel = userModel.copyWith(
        uid: userModel.uid,
        name: name.text,
        email: email.text,
        location: location.text,
        contact_no: contact_no.text);
    final status = await FireStore.updateUserData(userModel: updated_userModel);

    if (status == ResponseStatus.SUCCESS) {
      await Storage.saveUser(userModel);
      pageState.value = LoadingState.done;
      Get.dialog(CustomDialog(
          title: "Success",
          message: "Details has been successfully updated.",
          successButtonText: "OK",
          errorButtonText: "OK",
          isSuccess: true));
    } else {
      pageState.value = LoadingState.error;

      Get.dialog(CustomDialog(
          title: "Error",
          message: status["message"],
          successButtonText: "OK",
          errorButtonText: "OK",
          isSuccess: false));
    }
  }
  
  */

  @override
  void onInit() {
    super.onInit();
    // log(userModel.toMap().toString());
    initiallize();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
