import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_bulls_web_production/app/constant/appColor.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchLecture(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      final status = !await launchUrl(
          mode: LaunchMode.externalApplication, Uri.parse(url));

      if (status == false) {
        Get.snackbar("Success", "Launching meeting with $url",
            backgroundColor: AppColor.snackBarColor,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
      } else {
        Get.snackbar("Error", "Could not launch meeting with $url",
            backgroundColor: AppColor.snackBarColor,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
      }
    } else {
      Get.snackbar("Error", "Could not launch meeting with $url",
          backgroundColor: AppColor.snackBarColor,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
    }
  }


  static Future<void>  makeCallLaunchable(String phoneNumber)async{
     String url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar("Error", "Can't dial $phoneNumber",
          backgroundColor: AppColor.snackBarColor,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
