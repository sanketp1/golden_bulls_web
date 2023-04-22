import 'package:flutter/material.dart';

import '../../../../constant/appColor.dart';
import '../../../../constant/font.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ContentModel {
  String title;
  String desc;
  ContentModel({
    required this.title,
    required this.desc,
  });
}


class AboutUsView extends StatelessWidget {
  ContentModel intro = ContentModel(title: 'Introduction', desc: ''''

\u2022 GOLDEN BULLS Trading Academy is an Open Financial Educational Platform for all types of Students, Job Seekers, Employees, Housewives, Businessmen, Traders, Leaders & Youth Entrepreneurs to provide Multiple Income Opportunities & Benefits to Earn Daily Profits

\u2022 We are in FOREX TRADING since last 5 years and we know all the Best Strategies about Forex Market. We believe in Safe Trading that’s why we Consistently make Profits and Provide Best Returns on it.

\u2022 We have Experienced Team which is Expert in Gold Commodity Trading & they are generating consistent profit since long time
''');

  ContentModel ourMission = ContentModel(title: 'Our Mission', desc: ''''

\u2022 Our Mission is to Create Awareness about Forex Trading and Provide Education to the Youth Power of the Nation and also want to Minimize Employment Problem in our Country.

\u2022 We want Our India to be 100% Financially Strong and Poverty Free.
 
\u2022 We want to Build minimum 1 Million Forex Traders by 2023.
 
\u2022 Create An Awareness of Financial Education in Schools & Colleges among Youth Power of Our Nation and make them to be Self-Independent.
''');

  ContentModel ourVision = ContentModel(title: 'Our Vision', desc: ''''

\u2022 We want to Build minimum 1 Million Forex Traders by 2023.
 
\u2022 We want Our India to be 100% Financially Strong and Poverty Free.
 
\u2022 Create An Awareness of Financial Education in Schools & Colleges among Youth Power of Our Nation and make them to be Self-Independent.
 
\u2022 Our Mission is to Create Awareness about Forex Trading and Provide Education to the Youth Power of the Nation and also want to Minimize Employment Problem in our Country.
''');

  List<ContentModel> get content => [intro, ourMission, ourVision];

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    // TODO: implement build
    return AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: content.length,
          itemBuilder: (BuildContext c, int i) {
            return AnimationConfiguration.staggeredList(
              position: i,
              delay: Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  flipAxis: FlipAxis.y,
                  child: Container(
                    margin: EdgeInsets.only(bottom: _w / 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Text.rich(TextSpan(
                        text: content[i].title,
                        style: AppFont.primaryFont.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                        children: [
                          TextSpan(
                            text: content[i].desc,
                            style: AppFont.primaryFont.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: AppColor.snackBarColor),
                          )
                        ])),
                  ),
                ),
              ),
            );
          },
        ),
      );
    
  }
}
