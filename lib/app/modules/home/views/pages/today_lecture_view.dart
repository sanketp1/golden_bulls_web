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
class TodaysLectureView extends StatelessWidget {
  
  bool canJoin(String timeStamp) {
    log(timeStamp);
    //parsing time
    final time = DateFormat('yyyy-MM-dd HH:mm:ss').parse(timeStamp);

    // getting current time
    final now = DateTime.now();

    if (now.hour >= time.hour && now.minute >= time.minute) {
      return true;
    } else {
      return false;
    }
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
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(CollectionPaths.lecture_links)
              .doc(DocumentFieldName.today_lecture_link)
              .snapshots(),
          builder: (_, snapshot) {
            switch (snapshot.connectionState) {
              // case ConnectionState.active:
              case ConnectionState.none:
              case ConnectionState.waiting:
                return SkeletonListTile(
                  hasLeading: false,
                  hasSubtitle: true,
                  titleStyle: const SkeletonLineStyle(height: 50),
                  subtitleStyle: const SkeletonLineStyle(height: 24),
                );
              case ConnectionState.active:
                if (snapshot.hasData && snapshot.data!.exists) {
                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  final today_lecture = LectureLinkModel.fromMap(data);
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
                        Text(today_lecture.topic.toString(),
                            style: AppFont.primaryFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 30,
                        ),
                        canJoin(today_lecture.timeStamp!)
                            ? TextButton.icon(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColor.primaryColor),
                                ),
                                onPressed: () async {
                                  await UrlLauncher.launchLecture(
                                      today_lecture.link!);
                                },
                                icon: const Text("Join Now"),
                                label: const Icon(Icons.arrow_forward))
                            : Text.rich(TextSpan(
                                text: "Schedule At: ",
                                style: AppFont.primaryFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                children: [
                                    TextSpan(
                                        text: getTime(
                                            DateFormat('yyyy-MM-dd HH:mm:ss')
                                                .parse(
                                                    today_lecture.timeStamp!),
                                            false),
                                        style: AppFont.primaryFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal))
                                  ]))
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("No lecture link available"),
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
          }),
    );
  }
}
