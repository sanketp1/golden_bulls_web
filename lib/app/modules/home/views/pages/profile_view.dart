import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_bulls_web_production/app/data/models/userModel.dart';

import '../../../../constant/appColor.dart';
import '../../../../constant/font.dart';
import '../../../../widgets/userAvatar.dart';
import '../../controllers/myInfoController.dart';

class ProfileView extends StatelessWidget {
  final UserModel userModel;
  ProfileView({required this.userModel});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
        reverse: true,
        child: GetBuilder(
          init: MyInfoController(userModel: userModel),
          builder: (controller) {
            return GetX<MyInfoController>(builder: (controller) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Hero(
                    tag: "profile-pic",
                    child: Container(
                      height: 160,
                      width: 160,
                      child: UserAvatar(
                          url: userModel.profile_img_link.toString()),
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: ListTile(
                      leading: Text(
                        "Roll No. ",
                        style: AppFont.primaryFont.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      title: Text(
                        userModel.roll_no ?? "",
                        style: AppFont.primaryFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: TextFormField(
                      controller: controller.name,
                      cursorColor: AppColor.primaryColor,
                      decoration: InputDecoration(
                          enabled: controller.canEdit.value,
                          hintText: "Name",
                          prefixIcon: const Icon(Icons.person)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: TextFormField(
                      controller: controller.email,
                      cursorColor: AppColor.primaryColor,
                      decoration: InputDecoration(
                          enabled: controller.canEdit.value,
                          hintText: "Email",
                          prefixIcon: const Icon(Icons.mail)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: TextFormField(
                      controller: controller.contact_no,
                      cursorColor: AppColor.primaryColor,
                      decoration: InputDecoration(
                          enabled: controller.canEdit.value,
                          hintText: "Contact No",
                          prefixIcon: const Icon(Icons.phone)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: TextFormField(
                      controller: controller.location,
                      cursorColor: AppColor.primaryColor,
                      decoration: InputDecoration(
                          enabled: controller.canEdit.value,
                          hintText: "Location",
                          prefixIcon: const Icon(Icons.location_on)),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // controller.canEdit.value
                  //     ? Center(
                  //         child: controller.pageState.value ==
                  //                 LoadingState.loading
                  //             ? SizedBox(
                  //                 height: 60,
                  //                 width: 60,
                  //                 child: CircularProgressIndicator(
                  //                   color: AppColor.primaryColor,
                  //                   strokeWidth: 2,
                  //                 ),
                  //               )
                  //             : ElevatedButton(
                  //                 style: ElevatedButton.styleFrom(
                  //                     backgroundColor: AppColor.primaryColor,
                  //                     foregroundColor: Colors.white,
                  //                     minimumSize:
                  //                         Size(context.width * 0.6, 44)),
                  //                 onPressed: () async {
                  //                   controller.disableEdit();
                  //                   await controller.saveInfo();
                  //                 },
                  //                 child: Text("Save")),
                  //       )
                  //     : Container()
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
