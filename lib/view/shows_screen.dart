import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_supreme_flutter/common_widget/common_widget.dart';
import 'package:max_supreme_flutter/controller/handle_screen_controller.dart';
import 'package:max_supreme_flutter/view/movies_screen.dart';
import 'package:max_supreme_flutter/view/play_video_screen.dart';
import 'package:max_supreme_flutter/view/seasons_screen.dart';
import 'package:max_supreme_flutter/view/web_series_screen.dart';
import 'package:sizer/sizer.dart';
import '../constant/const.dart';
import 'package:get/get.dart';
import 'Movies2.dart';
import 'episodes_screen.dart';

class ShowsScreen extends StatefulWidget {
  const ShowsScreen({Key? key}) : super(key: key);

  @override
  State<ShowsScreen> createState() => _ShowsScreenState();
}

class _ShowsScreenState extends State<ShowsScreen> {
  int _selected = 0;

  //List items = ['Movies', 'Web Series'];

  HandleScreenController controller = Get.find();

  // List languages = [
  //   'English',
  //   'Hindi',
  //   'Marathi',
  //   'Gujarati',
  //   'Nepali',
  //   'Urdu',
  //   'Kannad',
  //   'Malayalam',
  // ];

  int languageSelected = 0;

  int i = 0;

  FocusNode? _focusNode;
  FocusNode? _focusNode1;

  setFirstFocus() {
    log("Hello");
    if (_focusNode == null) {
      log("Hello1");
      _focusNode = FocusNode();
      _focusNode1 = FocusNode();
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  goUp(BuildContext context, FocusNode node, int index) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
    _selected = index;
  }

  goDown(BuildContext context, FocusNode node, int index) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
    _selected = index;
  }

  goRight(BuildContext context, FocusNode node, int index) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
    _selected = index;
  }

  @override
  void dispose() {
    _focusNode!.dispose();
    _focusNode1!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_focusNode == null) {
      log("Hello2");
      setFirstFocus();
    }
    return Scaffold(
      //backgroundColor: primaryColor,
      body: CommonWidget.commonBackground(
        body: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.arrowUp): UpIntent3(),
            LogicalKeySet(LogicalKeyboardKey.arrowDown): DownIntent3(),
            LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftIntent3(),
            LogicalKeySet(LogicalKeyboardKey.arrowRight): RightIntent3(),
            LogicalKeySet(LogicalKeyboardKey.select): EnterIntent3(),
          },
          child: GetBuilder<HandleScreenController>(
            builder: (controller) => Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: double.infinity,
                  width: Get.width < 400 ? Get.width * 0.18 : Get.width * 0.24,
                  decoration: const BoxDecoration(color: Colors.black38),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Movies",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp),
                              ),
                              Image.asset(
                                'assets/images/search icon.png',
                                height: 13.sp,
                                width: 13.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150.sp,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 3.h),
                          child: Image.asset(
                            'assets/images/divider.png',
                          ),
                        ),
                      ),
                      Container(
                        height: 35.sp,
                        width: 150.sp,
                        decoration: BoxDecoration(
                          color: primaryColor,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "Movies",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ),
                      // Column(children: [
                      //   InkWell(
                      //     onTap: () {
                      //       setState(() {
                      //         _selected = 0;
                      //       });
                      //     },
                      //     child: Column(
                      //       children: [
                      //         Actions(
                      //           actions: <Type, Action<Intent>>{
                      //             DownIntent3: CallbackAction(
                      //               onInvoke: (intent) =>
                      //                   goDown(context, _focusNode1!, 1),
                      //             ),
                      //             RightIntent3: CallbackAction(
                      //               onInvoke: (intent) =>
                      //                   goRight(context, _focusNode1!, 1),
                      //             ),
                      //             // UpIntent3: CallbackAction(
                      //             //   onInvoke: (intent) => goUp(
                      //             //     context,
                      //             //     _allNodes[i],
                      //             //   ),
                      //             // ),
                      //           },
                      //           child: Focus(
                      //             focusNode: _focusNode,
                      //             child: Container(
                      //               height: 35.sp,
                      //               width: 150.sp,
                      //               decoration: BoxDecoration(
                      //                 color:
                      //                     _selected == 0 && _focusNode!.hasFocus
                      //                         ? primaryColor
                      //                         : Colors.transparent,
                      //               ),
                      //               child: Row(
                      //                 children: [
                      //                   SizedBox(
                      //                     width: 4.w,
                      //                   ),
                      //                   Text(
                      //                     "Movies",
                      //                     style: TextStyle(
                      //                         color: Colors.white,
                      //                         fontWeight: FontWeight.w500,
                      //                         fontSize: 13.sp),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         Divider(
                      //           height: 0,
                      //           color: _selected == 0 ?? _focusNode1!.hasFocus
                      //               ? Colors.transparent
                      //               : primaryColor,
                      //           thickness:
                      //               _selected == 0 ?? _focusNode1!.hasFocus
                      //                   ? 2
                      //                   : 0,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   InkWell(
                      //     onTap: () {
                      //       setState(() {
                      //         _selected = 1;
                      //       });
                      //     },
                      //     child: Column(
                      //       children: [
                      //         Actions(
                      //           actions: <Type, Action<Intent>>{
                      //             RightIntent3: CallbackAction(
                      //               onInvoke: (intent) =>
                      //                   goRight(context, _focusNode1!, 1),
                      //             ),
                      //             UpIntent3: CallbackAction(
                      //               onInvoke: (intent) =>
                      //                   goUp(context, _focusNode!, 0),
                      //             ),
                      //           },
                      //           child: Focus(
                      //             focusNode: _focusNode1,
                      //             child: Container(
                      //               height: 35.sp,
                      //               width: 150.sp,
                      //               decoration: BoxDecoration(
                      //                 color: _selected == 1 &&
                      //                         _focusNode1!.hasFocus
                      //                     ? primaryColor
                      //                     : Colors.transparent,
                      //               ),
                      //               child: Row(
                      //                 children: [
                      //                   SizedBox(
                      //                     width: 4.w,
                      //                   ),
                      //                   Text(
                      //                     "Web Series",
                      //                     style: TextStyle(
                      //                         color: Colors.white,
                      //                         fontWeight: FontWeight.w500,
                      //                         fontSize: 13.sp),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         Divider(
                      //           height: 0,
                      //           color: _selected == 1 ?? _focusNode1!.hasFocus
                      //               ? Colors.transparent
                      //               : primaryColor,
                      //           thickness:
                      //               _selected == 1 ?? _focusNode1!.hasFocus
                      //                   ? 2
                      //                   : 0,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ])
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Get.height > 500 ? Get.height * 0.05 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width / 1.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selected == 0 ? "Movies" : "Web Series",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp),
                                ),
                                //Spacer(),
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: Get.width < 400
                                      ? Get.width * 0.05
                                      : Get.width * 0.07,
                                  width: Get.width < 400
                                      ? Get.width * 0.12
                                      : Get.width * 0.17,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          SizedBox(
                            width: Get.width < 400
                                ? Get.width / 1.8
                                : Get.width / 1.44,
                            child: Image.asset(
                              'assets/images/divider.png',
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          // SizedBox(
                          //   width: Get.width < 400
                          //       ? Get.width / 1.8
                          //       : Get.width / 1.44,
                          //   child: SingleChildScrollView(
                          //     scrollDirection: Axis.horizontal,
                          //     child: Row(
                          //       children: List.generate(
                          //         languages.length,
                          //         (index) => GestureDetector(
                          //           onTap: () {
                          //             setState(() {
                          //               languageSelected = index;
                          //             });
                          //           },
                          //           child: Container(
                          //             margin: EdgeInsets.only(
                          //               right: Get.width < 400
                          //                   ? Get.width * 0.01
                          //                   : Get.width * 0.02,
                          //             ),
                          //             padding:
                          //                 EdgeInsets.symmetric(horizontal: 3.w),
                          //             child: Center(
                          //               child: Text(
                          //                 languages[index],
                          //                 style: TextStyle(
                          //                     color: languageSelected == index
                          //                         ? Colors.white
                          //                         : Colors.white,
                          //                     fontWeight: FontWeight.w500,
                          //                     fontSize: 9.sp),
                          //               ),
                          //             ),
                          //             decoration: BoxDecoration(
                          //               color: languageSelected == index
                          //                   ? primaryColor
                          //                   : Colors.black38,
                          //               borderRadius: BorderRadius.circular(20),
                          //             ),
                          //             height: Get.width < 400
                          //                 ? Get.width * 0.02
                          //                 : Get.width * 0.04,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 10.sp,
                          // ),
                          //MoviesScreen(),
                          Movies2(),
                          // _selected == 0
                          //     ? MoviesScreen()
                          //     : controller.isTapped == true
                          //         ? SeasonsScreens(
                          //             index: controller.screenSelected,
                          //           )
                          //         : controller.isTapped1 == true
                          //             ? EpisodesScreens(
                          //                 index: controller.screenSelected,
                          //               )
                          //             : WebSeriesScreen(),
                          SizedBox(
                            height: 10.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      color: Colors.grey,
      //width: 420.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _selected == 0 ? "Movies" : "Web Series",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp),
          ),
          // Spacer(),
          Image.asset(
            'assets/images/logo.png',
            height: Get.width < 400 ? Get.width * 0.05 : Get.width * 0.07,
            width: Get.width < 400 ? Get.width * 0.12 : Get.width * 0.17,
          ),
        ],
      ),
    );
  }
}

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  int showSelected = 0;

  List movies = [
    {
      'image': "assets/images/black_widow.png",
      'title': "Black Widow",
    },
    {
      'image': "assets/images/shows/walking_dead.png",
      'title': "The Walking Dead",
    },
    {
      'image': "assets/images/shows/crown.png",
      'title': "The Crown",
    },
    {
      'image': "assets/images/shows/breaking_bad.png",
      'title': "Breaking Bad",
    },
    {
      'image': "assets/images/shows/got.png",
      'title': "Game of Thrones",
    },
    {
      'image': "assets/images/shows/orange_black.png",
      'title': "Orange Black",
    },
    {
      'image': "assets/images/shows/stramger_things.png",
      'title': "Stranger Things",
    },
    {
      'image': "assets/images/shows/schitt_creek.png",
      'title': "Schitt Creek",
    },
    {
      'image': "assets/images/shows/fargo.png",
      'title': "Fargo",
    },
    {
      'image': "assets/images/black_widow.png",
      'title': "Black Widow",
    },
    {
      'image': "assets/images/shows/walking_dead.png",
      'title': "The Walking Dead",
    },
    {
      'image': "assets/images/shows/crown.png",
      'title': "The Crown",
    },
    {
      'image': "assets/images/shows/breaking_bad.png",
      'title': "Breaking Bad",
    },
    {
      'image': "assets/images/shows/got.png",
      'title': "Game of Thrones",
    },
    {
      'image': "assets/images/shows/orange_black.png",
      'title': "Orange Black",
    },
    {
      'image': "assets/images/shows/stramger_things.png",
      'title': "Stranger Things",
    },
    {
      'image': "assets/images/shows/schitt_creek.png",
      'title': "Schitt Creek",
    },
    {
      'image': "assets/images/shows/fargo.png",
      'title': "Fargo",
    },
    {
      'image': "assets/images/black_widow.png",
      'title': "Black Widow",
    },
    {
      'image': "assets/images/shows/walking_dead.png",
      'title': "The Walking Dead",
    },
    {
      'image': "assets/images/shows/crown.png",
      'title': "The Crown",
    },
    {
      'image': "assets/images/shows/breaking_bad.png",
      'title': "Breaking Bad",
    },
    {
      'image': "assets/images/shows/got.png",
      'title': "Game of Thrones",
    },
    {
      'image': "assets/images/shows/orange_black.png",
      'title': "Orange Black",
    },
    {
      'image': "assets/images/shows/stramger_things.png",
      'title': "Stranger Things",
    },
    {
      'image': "assets/images/shows/schitt_creek.png",
      'title': "Schitt Creek",
    },
    {
      'image': "assets/images/shows/fargo.png",
      'title': "Fargo",
    },
    {
      'image': "assets/images/black_widow.png",
      'title': "Black Widow",
    },
    {
      'image': "assets/images/shows/walking_dead.png",
      'title': "The Walking Dead",
    },
    {
      'image': "assets/images/shows/crown.png",
      'title': "The Crown",
    },
    {
      'image': "assets/images/shows/breaking_bad.png",
      'title': "Breaking Bad",
    },
    {
      'image': "assets/images/shows/got.png",
      'title': "Game of Thrones",
    },
    {
      'image': "assets/images/shows/orange_black.png",
      'title': "Orange Black",
    },
    {
      'image': "assets/images/shows/stramger_things.png",
      'title': "Stranger Things",
    },
    {
      'image': "assets/images/shows/schitt_creek.png",
      'title': "Schitt Creek",
    },
    {
      'image': "assets/images/shows/fargo.png",
      'title': "Fargo",
    },
  ];

  final List<FocusNode> _allNodes =
      List<FocusNode>.generate(36, (int index) => FocusNode());

  int i = 0;

  setFirstFocus() {
    FocusScope.of(context).requestFocus(_allNodes.first);
  }

  goRight(BuildContext context, FocusNode node, int index) {
    FocusScope.of(context).requestFocus(node);
    if (i >= 0 && i < 35) {
      i++;
    }
    setState(() {});
    showSelected = index;
  }

  goLeft(BuildContext context, FocusNode node, int index) {
    FocusScope.of(context).requestFocus(node);
    if (i <= 35 && i > 0) {
      i--;
    }
    setState(() {});
    showSelected = index;
  }

  @override
  void dispose() {
    _allNodes[0].dispose();
    _allNodes[1].dispose();
    _allNodes[2].dispose();
    _allNodes[3].dispose();
    _allNodes[4].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setFirstFocus();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height > 500 ? Get.height / 1.6 : Get.height / 1.3,
              //height: 150,
              width: Get.width < 400 ? Get.width / 2.3 : Get.width / 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      itemCount: movies.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisExtent: Get.width < 400
                            ? Get.width * 0.09
                            : Get.width * 0.11,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            showSelected = index;
                          });
                          Get.to(() => ChewieDemo());
                        },
                        child: Actions(
                          actions: <Type, Action<Intent>>{
                            RightIntent3: CallbackAction(
                              onInvoke: (intent) =>
                                  goRight(context, _allNodes[i], i),
                            ),
                            LeftIntent3: CallbackAction(
                              onInvoke: (intent) =>
                                  goLeft(context, _allNodes[i], i),
                            ),
                            EnterIntent3: CallbackAction(onInvoke: (intent) {
                              Get.off(() => ChewieDemo());
                            }),
                          },
                          child: Focus(
                            focusNode: _allNodes[index],
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: _allNodes[index].hasFocus &&
                                            showSelected == index
                                        ? const Color(0xffF9E20D)
                                        : Colors.transparent,
                                    width: 1.5),
                                image: DecorationImage(
                                  image: AssetImage(
                                    movies[index]['image'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width > 800 ? Get.width * 0.04 : Get.width * 0.06,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 100.sp,
                  width: 80.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(movies[showSelected]['image']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  bottom: -100.sp,
                  child: Container(
                    height: 100.sp,
                    width: 80.sp,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/shadow2.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -66.sp,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movies[showSelected]['title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp),
                        ),
                        Text(
                          "2022   3h 7m ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 8.sp),
                        ),
                        SizedBox(
                          height: 3.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              "IMDB: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "7.6/10",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              "Type: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "Movie",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              "Release: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "19 Oct 2001",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              "Cast: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "Madhvan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Decription: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "Abc",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class WebSeriesScreen extends StatefulWidget {
  const WebSeriesScreen({Key? key}) : super(key: key);

  @override
  State<WebSeriesScreen> createState() => _WebSeriesScreenState();
}

class _WebSeriesScreenState extends State<WebSeriesScreen> {
  HandleScreenController controller = Get.find();

  int showSelected = 0;

  List series = [
    {
      'image': "assets/images/series/claws.jpg",
      'title': "Claws",
    },
    {
      'image': "assets/images/series/fivebedroom.jpg",
      'title': "Five Bedroom",
    },
    {
      'image': "assets/images/series/Jett.jpg",
      'title': "Jett",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width < 400 ? Get.width / 2.3 : Get.width / 2,
              child: GridView.builder(
                itemCount: series.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisExtent: 65.sp,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      showSelected = index;
                    });
                    controller.changeTapped(true);
                    controller.changeScreen(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.screenSelected == index
                              ? Color(0xffF9E20D)
                              : Colors.transparent,
                          width: 1.5),
                      image: DecorationImage(
                        image: AssetImage(
                          series[index]['image'],
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width > 800 ? Get.width * 0.05 : Get.width * 0.06,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 100.sp,
                  width: 80.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(series[showSelected]['image']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  bottom: -69.sp,
                  child: Container(
                    height: 75.sp,
                    width: 80.sp,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/shadow2.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -65.sp,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          series[showSelected]['title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp),
                        ),
                        Text(
                          "2022   3h 7m ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 8.sp),
                        ),
                        SizedBox(
                          height: 3.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              "IMDB: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "7.6/10",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              "Type: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "Movie",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              "Release: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "19 Oct 2001",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              "Cast: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "Angeliana",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Decription: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                            Text(
                              "Abc",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 6.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class EnterIntent3 extends Intent {}

class DownIntent3 extends Intent {}

class UpIntent3 extends Intent {}

class RightIntent3 extends Intent {}

class LeftIntent3 extends Intent {}
