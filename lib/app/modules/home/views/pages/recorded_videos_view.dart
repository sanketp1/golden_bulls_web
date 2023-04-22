import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constant/appColor.dart';
import '../../../../constant/font.dart';
import '../../../../data/models/recored_video_model.dart';

class RecordedVideosView extends StatelessWidget {
  Widget _buildVideosList(
      List<RecordedVideoModel> recored_videos, BuildContext context) {
    if (recored_videos.isNotEmpty) {
      return ListView.builder(
          itemCount: recored_videos.length,
          itemBuilder: (_, index) {
            return Card(
              margin: const EdgeInsets.all(4),
              color: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(recored_videos[index]
                                      .cover_url
                                      .toString()))),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              // Get.to(
                              //     () => VideoPlayerView(
                              //           videoPlayerViewModel: VideoPlayerViewModel(title: recored_videos[index].title!, video_url: recored_videos[index].lecture_url!),
                              //         ),
                              //     transition: Transition.rightToLeft);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.primaryColor),
                              child: Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                  color: AppColor.secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      recored_videos[index].title.toString(),
                      style: AppFont.primaryFont.copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      recored_videos[index].desc.toString(),
                      style: AppFont.primaryFont
                          .copyWith(fontSize: 12, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            );
          });
    } else {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.subscriptions,
              size: 40,
              color: AppColor.primaryColor,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "No Recored Videos",
              style: AppFont.primaryFont.copyWith(color: Colors.black),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning,
              color: AppColor.primaryColor,
              size: 32,
            ),
            Text(
              "Currently not supporting on web",
              style: AppFont.primaryFont.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
