import 'package:flutter/material.dart';
import 'package:max_supreme_flutter/common_widget/common_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class AppsScreen extends StatefulWidget {
  const AppsScreen({Key? key}) : super(key: key);

  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  List appList = [
    {
      'image': 'assets/images/apps_icon/netflix.png',
    },
    {
      'image': 'assets/images/apps_icon/chrome.png',
    },
    {
      'image': 'assets/images/apps_icon/youtube.png',
    },
    {
      'image': 'assets/images/apps_icon/prime.png',
    },
    {
      'image': 'assets/images/apps_icon/play-store.png',
    },
    {
      'image': 'assets/images/apps_icon/zee.png',
    },
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonWidget.commonBackground(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                Image.asset(
                  'assets/images/divider.png',
                ),
                SizedBox(
                  height: 20.sp,
                ),
                apps(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row apps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        appList.length,
        (index) => InkWell(
          onTap: () {
            setState(() {
              selected = index;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            height: Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
            width: Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/box.png"), fit: BoxFit.fill),
            ),
            child: Center(
              child: Image.asset(
                appList[index]['image'],
                height: Get.width < 400 ? Get.width * 0.05 : Get.width * 0.05,
                width: Get.width < 400 ? Get.width * 0.05 : Get.width * 0.05,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 55.sp,
          width: 100.sp,
        ),
      ],
    );
  }
}
