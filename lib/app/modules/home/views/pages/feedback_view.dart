import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/appColor.dart';
import '../../../../constant/font.dart';
import '../../../../data/models/feedbackModel.dart';
import '../../../../data/services/firestore.dart';

class FeedbackView extends StatelessWidget {
  _buildImagePreview(String url, BuildContext context) async {
    Get.dialog(AlertDialog(
      title: Row(
        children: [
          InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close)),
          const SizedBox(
            width: 8,
          ),
          const Text("Preview"),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: InteractiveViewer(maxScale: 5, child: Image.network(url)),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // color: AppColor.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.secondaryColor),
            onPressed: () {},
            icon: Text(
              "Share feedback with us",
              style: AppFont.primaryFont.copyWith(fontSize: 16),
            ),
            label: Icon(Icons.arrow_forward),
          ),
          SizedBox(
            height: 12,
          ),
          StreamBuilder(
              stream: FireStore.getFeedbacks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
                } else {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          FeedbackModel feedbackModel = FeedbackModel.fromMap(
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>);

                          return feedbackModel.sourceType == SourceType.image
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Card(
                                    color: AppColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 8,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8)),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      feedbackModel
                                                          .source_link!))),
                                        ),
                                        ListTile(
                                          title: Text(
                                            feedbackModel.name!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: AppFont.primaryFont
                                                .copyWith(color: Colors.white),
                                          ),
                                          trailing: IconButton(
                                              onPressed: () {
                                                Get.dialog(AlertDialog(
                                                  title: Row(
                                                    children: [
                                                      InkWell(
                                                          onTap: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: const Icon(
                                                              Icons.close)),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      const Text("Preview"),
                                                    ],
                                                  ),
                                                  content: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    child: InteractiveViewer(
                                                        maxScale: 5,
                                                        child: Image.network(
                                                            feedbackModel
                                                                .source_link!)),
                                                  ),
                                                ));
                                              },
                                              icon: Icon(
                                                Icons.visibility,
                                                color: AppColor.secondaryColor,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Card(
                                    color: AppColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 8,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8)),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    feedbackModel.coverLink!)),
                                          ),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {
                                                Get.snackbar("Warning",
                                                    "Currently not supporting video playing on web",
                                                    colorText: Colors.white,
                                                    backgroundColor:
                                                        AppColor.primaryColor);
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (_) =>
                                                //         VideoPlayerView(
                                                //       videoPlayerViewModel: VideoPlayerViewModel(title: "Feedback", video_url: feedbackModel.source_link!),
                                                //     ),
                                                //   ));
                                              },
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor:
                                                    AppColor.primaryColor,
                                                child: Center(
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    size: 36,
                                                    color:
                                                        AppColor.secondaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8)),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      feedbackModel
                                                          .coverLink!))),
                                        ),
                                        ListTile(
                                          title: Text(
                                            feedbackModel.name!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: AppFont.primaryFont
                                                .copyWith(color: Colors.white),
                                          ),
                                          subtitle: Text(
                                            "On " +
                                                feedbackModel.timeStamp
                                                    .toString(),
                                            style: AppFont.primaryFont.copyWith(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "No Feedback added",
                        style:
                            AppFont.primaryFont.copyWith(color: Colors.white),
                      ),
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
