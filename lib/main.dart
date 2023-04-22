import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:golden_bulls_web_production/app/constant/appTheme.dart';

import 'app/data/services/authentication.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await GetStorage.init();
  // final user = Authentication.getCurrentUser();



  runApp(
    GetMaterialApp(
      theme: AppTheme.appTheme,
      title: "Golden Bulls Web",
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
