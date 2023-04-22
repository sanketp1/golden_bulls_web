// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:golden_bulls_web_production/app/data/models/userModel.dart';
import 'package:golden_bulls_web_production/app/modules/home/views/pages/home_page.dart';
import 'package:golden_bulls_web_production/app/modules/login/views/login_view.dart';
import 'package:golden_bulls_web_production/app/routes/app_pages.dart';
import '../pages/pages_export.dart';

class DrawerHelpers {
  static final List<DrawerItem> drawerItems = [
    DrawerItem(label: "Home", icon: Icons.home, navigateTo: HomePage()),
    DrawerItem(
        label: "Today Lecture Link",
        icon: Icons.class_,
        navigateTo: TodaysLectureView()),
    DrawerItem(
        label: "Upcoming Webinar Lecture Link",
        icon: Icons.group,
        navigateTo: UpcomingWebinarLectureView()),
    DrawerItem(
        label: "Analysis", icon: Icons.analytics, navigateTo: AnalysisView()),
    DrawerItem(
        label: "Recorded Videos",
        icon: Icons.smart_display,
        navigateTo: RecordedVideosView()),
    DrawerItem(
        label: "Feedback", icon: Icons.feedback, navigateTo: FeedbackView()),
    DrawerItem(
        label: "About Us", icon: Icons.person, navigateTo: AboutUsView()),
    DrawerItem(
        label: "Privacy Policy",
        icon: Icons.privacy_tip,
        navigateTo: PolicyView()),
    DrawerItem(label: "Logout", icon: Icons.logout, navigateTo: LoginView()),
  ];

  static Widget getPage(int index, UserModel user) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return TodaysLectureView();
      case 2:
        return UpcomingWebinarLectureView();
      case 3:
        return AnalysisView();
      case 4:
        return RecordedVideosView();
      case 5:
        return FeedbackView();
      case 6:
        return AboutUsView();
      case 7:
        return PolicyView();

      case 8:
        return LoginView();

      case 9:
        return ProfileView(userModel: user);

      default:
        return HomePage();
    }
  }
}

class DrawerItem {
  final String label;
  final IconData icon;
  final Widget navigateTo;
  DrawerItem({
    required this.label,
    required this.icon,
    required this.navigateTo,
  });
}
