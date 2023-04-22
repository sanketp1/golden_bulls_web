import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../constant/appColor.dart';
import '../../../../constant/font.dart';
import '../../../../data/collectionPaths.dart';
import '../../../../data/models/lectureLinkModel.dart';
import '../../../../data/services/urlLauncher.dart';
class UpcomingWebinarLectureView extends StatelessWidget {

  
  String parseTimeStamp(String timeStamp) {
    final time = DateFormat('yyyy-MM-dd HH:mm:ss').parse(timeStamp);
    return getTime(time, false);
  }

  String getTime(DateTime now, bool isSpacedNeedBetweenTime) {
    var hour = now.hour;
    var minute = now.minute;
    var amPm = hour < 12 ? "AM" : "PM";
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;
    var minuteStr = minute < 10 ? "0$minute" : "$minute";
    return isSpacedNeedBetweenTime
        ? "$hour:$minuteStr\n$amPm"
        : "$hour:$minuteStr $amPm";
  }

  bool canJoin(String timeStamp) {
    log(timeStamp);
    final time = DateFormat('yyyy-MM-dd HH:mm:ss').parse(timeStamp);

    final now = DateTime.now();
    if (time.day == now.day &&
        time.month == now.month &&
        time.year == now.year) {
      if (now.hour >= time.hour && now.minute >= time.minute) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(CollectionPaths.lecture_links)
              .doc(DocumentFieldName.upcoming_lecture_links)
              .collection("lectures")
              .snapshots(),
          builder: (_, snapshot) {
            switch (snapshot.connectionState) {
              // case ConnectionState.active:
              case ConnectionState.none:
              case ConnectionState.waiting:
                return SkeletonListView(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return SkeletonListTile(
                      hasLeading: false,
                      hasSubtitle: true,
                      titleStyle: const SkeletonLineStyle(height: 50),
                      subtitleStyle: const SkeletonLineStyle(height: 24),
                    );
                  },
                );

              case ConnectionState.active:
                if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (_, index) {
                        final data = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        final upcoming_webinar = LectureLinkModel.fromMap(data);
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(8),
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(2.0, 4.0),
                                    color: Colors.grey.shade200,
                                    blurRadius: 8)
                              ]),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(upcoming_webinar.topic.toString(),
                                  style: AppFont.primaryFont.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 30,
                              ),
                              Text.rich(TextSpan(
                                  text: "Schedule at: ",
                                  style: AppFont.primaryFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: upcoming_webinar.timeStamp != null
                                            ? parseTimeStamp(
                                                upcoming_webinar.timeStamp!)
                                            : "",
                                        style: AppFont.primaryFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                        children: [
                                          TextSpan(
                                              text: " (" +
                                                  DateFormat("dd-MM-yyyy")
                                                      .format(DateFormat(
                                                              'yyyy-MM-dd HH:mm:ss')
                                                          .parse(upcoming_webinar
                                                              .timeStamp!)) +
                                                  ")")
                                        ])
                                  ])),

                              canJoin(upcoming_webinar.timeStamp!)
                                  ? TextButton.icon(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                AppColor.primaryColor),
                                      ),
                                      onPressed: () async {
                                        await UrlLauncher.launchLecture(
                                            upcoming_webinar.link!);
                                      },
                                      icon: const Text("Join Now"),
                                      label: const Icon(Icons.arrow_forward))
                                  : const SizedBox()

                              // TextButton.icon(
                              //     style: ButtonStyle(
                              //       foregroundColor: MaterialStateProperty.all(
                              //           AppColor.primaryColor),
                              //     ),
                              //     onPressed: () {
                              //       // Clipboard.setData(ClipboardData(
                              //       //     text: upcoming_webinar.link));
                              //       Get.snackbar(
                              //           "Success", "link copied sucessfully",
                              //           snackPosition: SnackPosition.BOTTOM,
                              //           backgroundColor: AppColor.snackBarColor,
                              //           colorText: Colors.white);
                              //     },
                              //     icon: Text("copy link"),
                              //     label: Icon(Icons.copy))
                            ],
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: Text("No upcoming webinars"),
                  );
                }

              default:
                return const Center(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                );
            }
          })
    );
  }
}
