import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:max_supreme_flutter/common_widget/common_widget.dart';
import 'package:max_supreme_flutter/view/select_user_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    log('Width==>>${Get.width}');
    log('Height==>>${Get.height}');
    // Width==>>730.0
    // Height==>>360.0
    //Width==>>360.0
    //Height==>>592.0
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SelectUserScreen(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonWidget.commonBackground(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonWidget.commonAppLogo(
              height: 85.sp,
              width: 200.sp,
            ),
            SizedBox(
              height: 15.sp,
            ),
            Text(
              "(Machine ID: 70A6-A575-94D7-40D8)",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            )
          ],
        ),
      ),
    );
  }
}
