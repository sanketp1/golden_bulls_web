import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:golden_bulls_web_production/app/constant/loadingState.dart';
import 'package:golden_bulls_web_production/app/modules/home/views/drawer/drawer_view.dart';
import 'package:golden_bulls_web_production/app/modules/home/views/drawer/drawerHelper.dart';
import 'package:golden_bulls_web_production/app/routes/app_pages.dart';
import 'package:golden_bulls_web_production/app/utils/size_utils.dart';

import '../../../data/models/userModel.dart';
import '../../../data/services/authentication.dart';
import '../controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  //setting up home controller
  final controller = Get.put(HomeController());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final user = Authentication.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    print(controller.firebase_user);
    final UserModel? userModel = Get.arguments != null
        ? Get.arguments as UserModel
        : controller.user.value;
    return controller.firebase_user == null
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Sorry! you are not authenticated.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton.icon(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      icon: Text("Login"),
                      label: Icon(Icons.login))
                ],
              ),
            ),
          )
        : Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Obx(() => controller.drawerIndex.value == 9
                  ? Text("Profile")
                  : Text(DrawerHelpers
                      .drawerItems[controller.drawerIndex.value].label)),
              centerTitle: true,
            ),
            drawer: DrawerView(
              userModel: userModel ?? controller.user.value,
              homeController: controller,
              scaffoldKey: scaffoldKey,
            ),
            body: Obx(() => DrawerHelpers.getPage(controller.drawerIndex.value,
                userModel ?? controller.user.value)));
  }
}
