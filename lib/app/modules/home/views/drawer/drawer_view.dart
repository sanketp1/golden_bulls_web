import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_bulls_web_production/app/constant/appColor.dart';
import 'package:golden_bulls_web_production/app/data/services/authentication.dart';
import 'package:golden_bulls_web_production/app/modules/home/controllers/home_controller.dart';
import 'package:golden_bulls_web_production/app/modules/home/views/drawer/drawerHelper.dart';
import 'package:golden_bulls_web_production/app/routes/app_pages.dart';

import '../../../../data/models/userModel.dart';

class DrawerView extends StatelessWidget {
  final HomeController homeController;
  final UserModel userModel;
  GlobalKey<ScaffoldState> scaffoldKey;
  DrawerView(
      {required this.homeController,
      required this.userModel,
      required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              scaffoldKey.currentState!.closeDrawer();

              homeController.changePage(9);
            },
            child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                  backgroundImage: userModel.profile_img_link != null
                      ? NetworkImage(userModel.profile_img_link.toString())
                      : null,
                ),
                decoration: BoxDecoration(color: AppColor.primaryColor),
                accountName: Text(userModel.name ?? "Unknown name"),
                accountEmail: Text(userModel.email ?? "Not available")),
          ),
          Column(
            children: DrawerHelpers.drawerItems
                .map((item) => ListTile(
                      onTap: () async{
                        if (DrawerHelpers.drawerItems.indexOf(item) ==
                            DrawerHelpers.drawerItems.length - 1) {
                          scaffoldKey.currentState!.closeDrawer();
                         await Authentication.signOut();
                          Get.offAllNamed(Routes.LOGIN);
                        } else {
                          scaffoldKey.currentState!.closeDrawer();

                          homeController.changePage(
                              DrawerHelpers.drawerItems.indexOf(item));
                        }
                      },
                      leading: Icon(item.icon),
                      title: Text(item.label),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
