import 'package:flutter/material.dart';
import 'package:max_supreme_flutter/view/play_video_screen.dart';
import 'package:max_supreme_flutter/view/shows_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

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
              height: Get.height > 500 ? Get.height / 1.6 : Get.height / 1.6,
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
                                        ? Color(0xffF9E20D)
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

// class EnterIntent2 extends Intent {}
//
// class RightIntent3 extends Intent {}
//
// class LeftIntent2 extends Intent {}
//
// // class UpIntent2 extends Intent {}
// //
// // class DownIntent2 extends Intent {}
