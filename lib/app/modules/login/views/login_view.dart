import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:get/get.dart';
import 'package:golden_bulls_web_production/app/constant/appColor.dart';
import 'package:golden_bulls_web_production/app/constant/font.dart';
import 'package:golden_bulls_web_production/app/routes/app_pages.dart';
import 'package:golden_bulls_web_production/app/utils/size_utils.dart';
import 'package:golden_bulls_web_production/app/widgets/elevatedContainer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        logo: AssetImage("assets/org_logo.png"),
        onLogin: (creds) {
          controller.onLogIn(creds.name, creds.password);
        },
        onRecoverPassword: (p0) {},
      ),
    );
  }
}
