import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:golden_bulls_web_production/app/constant/font.dart';
import 'package:golden_bulls_web_production/app/modules/home/controllers/home_controller.dart';

import '../../../../constant/loadingState.dart';
import '../../../../utils/size_utils.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final controller = Get.put(HomeController());
  //building carousel slider
  Widget _buildCarouselSlider(BuildContext context) {
    return Center(
      child: SizedBox(
        height: SizeUtils.getScreenHeight(context) * 0.5,
        // width: width,
        child: Obx(
            () => controller.isAllCarouselLoaded.value == LoadingState.loading
                ? Container()
                : CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(milliseconds: 1500),
                      aspectRatio: 16 / 9,
                      disableCenter: true,
                    ),
                    items: controller.carouselItems.value)),
      ),
    );
  }

  Widget _buildOrgInfo() {
    final orgInfo = """ 
  Golden Bulls Academy was established in 2016 with a vision to create a community of successful forex traders. The academy has been built by handpicking some of the most talented individuals in the field who have been able to achieve great success in forex trading. Over the years, the academy has gained a reputation for being one of the best in the industry, with a track record of producing successful traders.

The academy was founded by Mr. Amol Bhojgude, who is a renowned expert in forex trading. His vast knowledge and experience in the field have been instrumental in shaping the academy's curriculum and training programs. Mr. Bhojgude realized that there was a need to share this immense knowledge with individuals who were willing to step out of their comfort zone and explore alternative ways of making money.

With the aim of creating a million forex traders in India, Golden Bulls Academy is constantly raising the bar with every batch of students. The academy's training programs are designed to provide students with practical knowledge and skills that can help them succeed in the forex trading market. The academy's approach is to provide personalized attention to each student, ensuring that they receive the necessary support and guidance to achieve their goals.

Golden Bulls Academy is committed to helping both the youth and the elderly in India overcome unemployment issues. The academy firmly believes that forex trading can provide an excellent opportunity for individuals to achieve financial freedom and independence. The academy is driven by a strong sense of enthusiasm and dedication towards this goal and continues to expand its reach across India.

In conclusion, Golden Bulls Academy is an institution that has emerged as a beacon of hope for individuals who are looking to explore alternative ways of making money. The academy's commitment to providing quality education and training has been instrumental in shaping the lives of many individuals, providing them with the necessary skills and knowledge to succeed in the forex trading market. With its vision of creating a million forex traders in India, Golden Bulls Academy is on a mission to empower individuals and help them achieve financial freedom.
  """;
    return Text(
      orgInfo,
      style: AppFont.primaryFont.copyWith(fontSize: 16),
      textAlign: TextAlign.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _buildCarouselSlider(context),
            SizedBox(
              height: 20,
            ),
            _buildOrgInfo()
          ],
        ),
      ),
    );
  }
}
