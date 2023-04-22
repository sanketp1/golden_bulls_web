import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/appColor.dart';
import '../../../../constant/font.dart';
import '../../../../data/models/analysisModel.dart';
import '../../../../data/services/firestore.dart';

class AnalysisView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          // color: AppColor.primaryColor,
          child: StreamBuilder(
            stream: FireStore.getAnalysis(),
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
                if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      AnalysisModel analysisModel = AnalysisModel.fromMap(
                          snapshot.data!.docs[index].data()
                              as Map<String, dynamic>);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                            analysisModel.imageUrl!))),
                              ),
                              ListTile(
                                title: Text(
                                  analysisModel.title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppFont.primaryFont
                                      .copyWith(color: Colors.white),
                                ),
                                subtitle: Text(
                                  analysisModel.desc!,
                                  style: AppFont.primaryFont.copyWith(
                                      fontSize: 12, color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      Get.dialog(AlertDialog(
                                        title: Row(
                                          children: [
                                            InkWell(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Icon(Icons.close)),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Text("Preview"),
                                          ],
                                        ),
                                        content: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: InteractiveViewer(
                                              maxScale: 5,
                                              child: Image.network(
                                                  analysisModel.imageUrl!)),
                                        ),
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.lightBlue,
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No analysis available"),
                  );
                }
              }
            },
          ),
        );
  }
}
