import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:max_supreme_flutter/common_widget/common_widget.dart';
import 'package:max_supreme_flutter/view/apps_screen.dart';
import 'package:max_supreme_flutter/view/live_tv_screen.dart';
import 'package:max_supreme_flutter/view/shows_screen.dart';
import 'package:max_supreme_flutter/view/settings_screen.dart';
import 'package:sizer/sizer.dart';
import '../constant/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List options = [
    {
      'image': 'assets/images/live_tv.png',
      'title': "Live Tv",
    },
    {
      'image': 'assets/images/movies.png',
      'title': "Movies",
    },
    {
      'image': 'assets/images/dramas.png',
      'title': "Dramas",
    },
    {
      'image': 'assets/images/catch_up.png',
      'title': "Catch Up",
    },
    {
      'image': 'assets/images/epg.png',
      'title': "EPG",
    },
    {
      'image': 'assets/images/apps.png',
      'title': "Apps",
    },
    {
      'image': 'assets/images/setting.png',
      'title': "Settings",
    },
  ];

  List<String> banners = [
    'assets/images/kgf-banner.png',
    'assets/images/Banner-01.jpg',
    'assets/images/Banner-02.jpg',
    'assets/images/Banner-03.jpg',
    'assets/images/Banner-04.jpg',
  ];

  int selected = 0;
  int bannerSelected = 0;
  int i = 0;

  FocusNode? focusNode;
  FocusNode? focusNode1;
  FocusNode? focusNode2;
  FocusNode? focusNode3;
  FocusNode? focusNode4;
  FocusNode? focusNode5;
  FocusNode? focusNode6;
  FocusNode? focusNode7;

  setFirstFocus() {
    if (focusNode == null) {
      focusNode = FocusNode();
      focusNode1 = FocusNode();
      focusNode2 = FocusNode();
      focusNode3 = FocusNode();
      focusNode4 = FocusNode();
      focusNode5 = FocusNode();
      focusNode6 = FocusNode();
      focusNode7 = FocusNode();
      FocusScope.of(context).requestFocus(focusNode);
    }
  }

  goRight(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  goLeft(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  @override
  void dispose() {
    focusNode!.dispose();
    focusNode1!.dispose();
    focusNode2!.dispose();
    focusNode3!.dispose();
    focusNode4!.dispose();
    focusNode5!.dispose();
    focusNode6!.dispose();
    focusNode7!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setFirstFocus();
    return Scaffold(
      body: CommonWidget.commonBackground(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              children: [
                SizedBox(height: Get.height > 500 ? Get.height * 0.10 : 0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height:
                          Get.width < 400 ? Get.width / 4.9 : Get.width / 4.3,
                      width:
                          Get.width < 400 ? Get.width * 0.215 : Get.width / 1.5,
                      child: CarouselSlider(
                        items: List.generate(
                          banners.length,
                          (index) => Container(
                            height: Get.width < 400
                                ? Get.width / 4.9
                                : Get.width / 4.3,
                            width: Get.width < 400
                                ? Get.width / 2
                                : Get.width / 1.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(banners[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          initialPage: 0,
                          //enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Column(
                      children: [
                        CommonWidget.commonAppLogo(
                          height: Get.width < 400
                              ? Get.width * 0.04
                              : Get.width * 0.05,
                          width: Get.width < 400
                              ? Get.width * 0.12
                              : Get.width * 0.17,
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Image.asset(
                          'assets/images/divider2.png',
                          width: 150.sp,
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Container(
                          height: Get.width < 400
                              ? Get.width * 0.01
                              : Get.width * 0.03,
                          width: Get.width < 400
                              ? Get.width * 0.18
                              : Get.width * 0.24,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.sp,
                              ),
                              CircleAvatar(
                                radius: 6.sp,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'assets/images/user icon.png',
                                  height: 6.sp,
                                  width: 6.sp,
                                  color: primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: 6.sp,
                              ),
                              Text(
                                "Abhinav Sharma",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Container(
                          height: Get.width < 400
                              ? Get.width * 0.03
                              : Get.width * 0.06,
                          width: Get.width < 400
                              ? Get.width * 0.18
                              : Get.width * 0.24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                              image: AssetImage("assets/images/big_box.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Text(
                                "Machine ID of this device is LKF5SJ9HE0EYUW16PZ8. Contact to local vendor to activate this device.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Container(
                          height: Get.width < 400
                              ? Get.width * 0.04
                              : Get.width * 0.06,
                          width: Get.width < 400
                              ? Get.width * 0.18
                              : Get.width * 0.24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/weather_box.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                    height: Get.height > 500
                        ? Get.height * 0.12
                        : Get.height * 0.07),
                allOptions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget allOptions(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftIntent1(),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): RightIntent1(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): UpIntent1(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): DownIntent1(),
        LogicalKeySet(LogicalKeyboardKey.select): EnterIntent1(),
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
          onTap: () {
            setState(() {
              selected = 0;
            });
            Get.to(() => LiveTvScreen());

            // if (index == 1) {
            // } else if (index == 0) {
            //   Get.to(() => LiveTvScreen());
            // } else if (index == 5) {
            //   Get.to(() => AppsScreen());
            // } else if (index == 6) {
            //   Get.to(() => SettingsScreen());
            // }
          },
          child: Column(
            children: [
              Actions(
                actions: <Type, Action<Intent>>{
                  RightIntent1: CallbackAction(
                    onInvoke: (intent) => goRight(
                      context,
                      focusNode1!,
                    ),
                  ),
                  // LeftIntent1: CallbackAction(
                  //   onInvoke: (intent) => goLeft(
                  //     context,
                  //     _allNodes[i],
                  //   ),
                  // ),
                  EnterIntent1: CallbackAction(onInvoke: (intent) {
                    Get.to(() => LiveTvScreen());
                  }),
                },
                child: Focus(
                  focusNode: focusNode,
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    height:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    width:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(focusNode!.hasFocus
                              ? "assets/images/Rectangle7.png"
                              : "assets/images/box1_outlined.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/live_tv.png",
                          height: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                          width: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          "Live Tv",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              shadow(),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 1;
            });
            Get.to(() => ShowsScreen());

            // if (index == 1) {
            // } else if (index == 0) {
            //   Get.to(() => LiveTvScreen());
            // } else if (index == 5) {
            //   Get.to(() => AppsScreen());
            // } else if (index == 6) {
            //   Get.to(() => SettingsScreen());
            // }
          },
          child: Column(
            children: [
              Actions(
                actions: <Type, Action<Intent>>{
                  RightIntent1: CallbackAction(
                    onInvoke: (intent) => goRight(
                      context,
                      focusNode2!,
                    ),
                  ),
                  LeftIntent1: CallbackAction(
                    onInvoke: (intent) => goLeft(
                      context,
                      focusNode!,
                    ),
                  ),
                  EnterIntent1: CallbackAction(onInvoke: (intent) {
                    Get.to(() => ShowsScreen());
                  }),
                },
                child: Focus(
                  focusNode: focusNode1,
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    height:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    width:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(focusNode1!.hasFocus
                              ? "assets/images/Rectangle7.png"
                              : "assets/images/box1_outlined.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/movies.png",
                          height: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                          width: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          "Movies",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              shadow(),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 2;
            });
            //Get.to(() => ShowsScreen());

            // if (index == 1) {
            // } else if (index == 0) {
            //   Get.to(() => LiveTvScreen());
            // } else if (index == 5) {
            //   Get.to(() => AppsScreen());
            // } else if (index == 6) {
            //   Get.to(() => SettingsScreen());
            // }
          },
          child: Column(
            children: [
              Actions(
                actions: <Type, Action<Intent>>{
                  RightIntent1: CallbackAction(
                    onInvoke: (intent) => goRight(
                      context,
                      focusNode3!,
                    ),
                  ),
                  LeftIntent1: CallbackAction(
                    onInvoke: (intent) => goLeft(
                      context,
                      focusNode1!,
                    ),
                  ),
                  EnterIntent1: CallbackAction(onInvoke: (intent) {
                    // Get.to(() => ShowsScreen());
                  }),
                },
                child: Focus(
                  focusNode: focusNode2,
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    height:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    width:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(focusNode2!.hasFocus
                              ? "assets/images/Rectangle7.png"
                              : "assets/images/box1_outlined.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/dramas.png",
                          height: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                          width: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          "Dramas",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              shadow(),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 3;
            });
            //Get.to(() => ShowsScreen());

            // if (index == 1) {
            // } else if (index == 0) {
            //   Get.to(() => LiveTvScreen());
            // } else if (index == 5) {
            //   Get.to(() => AppsScreen());
            // } else if (index == 6) {
            //   Get.to(() => SettingsScreen());
            // }
          },
          child: Column(
            children: [
              Actions(
                actions: <Type, Action<Intent>>{
                  RightIntent1: CallbackAction(
                    onInvoke: (intent) => goRight(
                      context,
                      focusNode4!,
                    ),
                  ),
                  LeftIntent1: CallbackAction(
                    onInvoke: (intent) => goLeft(
                      context,
                      focusNode2!,
                    ),
                  ),
                  EnterIntent1: CallbackAction(onInvoke: (intent) {
                    //Get.to(() => ShowsScreen());
                  }),
                },
                child: Focus(
                  focusNode: focusNode3,
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    height:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    width:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(focusNode3!.hasFocus
                              ? "assets/images/Rectangle7.png"
                              : "assets/images/box1_outlined.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/catch_up.png",
                          height: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                          width: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          "Catch Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              shadow(),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 4;
            });
            //Get.to(() => ShowsScreen());

            // if (index == 1) {
            // } else if (index == 0) {
            //   Get.to(() => LiveTvScreen());
            // } else if (index == 5) {
            //   Get.to(() => AppsScreen());
            // } else if (index == 6) {
            //   Get.to(() => SettingsScreen());
            // }
          },
          child: Column(
            children: [
              Actions(
                actions: <Type, Action<Intent>>{
                  RightIntent1: CallbackAction(
                    onInvoke: (intent) => goRight(
                      context,
                      focusNode5!,
                    ),
                  ),
                  LeftIntent1: CallbackAction(
                    onInvoke: (intent) => goLeft(
                      context,
                      focusNode3!,
                    ),
                  ),
                  EnterIntent1: CallbackAction(onInvoke: (intent) {
                    //Get.to(() => ShowsScreen());
                  }),
                },
                child: Focus(
                  focusNode: focusNode4,
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    height:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    width:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(focusNode4!.hasFocus
                              ? "assets/images/Rectangle7.png"
                              : "assets/images/box1_outlined.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/epg.png",
                          height: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                          width: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          "EPG",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              shadow(),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 5;
            });
            Get.to(() => AppsScreen());
          },
          child: Column(
            children: [
              Actions(
                actions: <Type, Action<Intent>>{
                  RightIntent1: CallbackAction(
                    onInvoke: (intent) => goRight(
                      context,
                      focusNode6!,
                    ),
                  ),
                  LeftIntent1: CallbackAction(
                    onInvoke: (intent) => goLeft(
                      context,
                      focusNode4!,
                    ),
                  ),
                  EnterIntent1: CallbackAction(onInvoke: (intent) {
                    Get.to(() => AppsScreen());
                  }),
                },
                child: Focus(
                  focusNode: focusNode5,
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    height:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    width:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(focusNode5!.hasFocus
                              ? "assets/images/Rectangle7.png"
                              : "assets/images/box1_outlined.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/apps.png",
                          height: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                          width: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          "Apps",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              shadow(),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 6;
            });
            Get.to(() => SettingsScreen());
          },
          child: Column(
            children: [
              Actions(
                actions: <Type, Action<Intent>>{
                  // RightIntent1: CallbackAction(
                  //   onInvoke: (intent) => goRight(
                  //     context,
                  //     focusNode6!,
                  //   ),
                  // ),
                  LeftIntent1: CallbackAction(
                    onInvoke: (intent) => goLeft(
                      context,
                      focusNode5!,
                    ),
                  ),
                  EnterIntent1: CallbackAction(onInvoke: (intent) {
                    Get.to(() => SettingsScreen());
                  }),
                },
                child: Focus(
                  focusNode: focusNode6,
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    height:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    width:
                        Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(focusNode6!.hasFocus
                              ? "assets/images/Rectangle7.png"
                              : "assets/images/box1_outlined.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/setting.png",
                          height: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                          width: Get.width < 400
                              ? Get.width * 0.05
                              : Get.width * 0.05,
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              shadow(),
            ],
          ),
        ),
      ]),
    );
  }

  Container shadow() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Get.width < 400 ? Get.width * 0.002 : Get.width * 0.005,
      ),
      height: Get.width < 400 ? Get.width * 0.04 : Get.width * 0.06,
      width: Get.width < 400 ? Get.width * 0.10 : Get.width * 0.12,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/box1_shadow.png"),
            fit: BoxFit.fill),
      ),
    );
  }
}

class EnterIntent1 extends Intent {}

class DownIntent1 extends Intent {}

class UpIntent1 extends Intent {}

class RightIntent1 extends Intent {}

class LeftIntent1 extends Intent {}
