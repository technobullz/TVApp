import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_supreme_flutter/common_widget/common_widget.dart';
import 'package:sizer/sizer.dart';
import '../constant/const.dart';
import 'package:get/get.dart';

class LiveTvScreen extends StatefulWidget {
  const LiveTvScreen({Key? key}) : super(key: key);

  @override
  State<LiveTvScreen> createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends State<LiveTvScreen> {
  int selected = 0;
  int showSelected = 0;

  List items = [
    'Marathi',
    'USA',
    'Nepal',
    'English',
    'Infotainment',
  ];

  int languageSelected = 0;

  int i = 0;

  FocusNode? focusNode;
  FocusNode? focusNode1;
  FocusNode? focusNode2;
  FocusNode? focusNode3;
  FocusNode? focusNode4;

  setFirstFocus() {
    if (focusNode == null) {
      focusNode = FocusNode();
      focusNode1 = FocusNode();
      focusNode2 = FocusNode();
      focusNode3 = FocusNode();
      focusNode4 = FocusNode();

      FocusScope.of(context).requestFocus(focusNode);
    }
  }

  goUp(BuildContext context, FocusNode node, int index) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
    selected = index;
  }

  goDown(BuildContext context, FocusNode node, int index) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
    selected = index;
  }

  @override
  void dispose() {
    focusNode!.dispose();
    focusNode1!.dispose();
    focusNode2!.dispose();
    focusNode3!.dispose();
    focusNode4!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (focusNode == null) {
      setFirstFocus();
    }
    return Scaffold(
      body: CommonWidget.commonBackground(
        body: Row(
          children: [
            Container(
              height: double.infinity,
              width: 150.sp,
              decoration: BoxDecoration(color: Colors.black38),
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
                            "Live TV",
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                      child: Image.asset(
                        'assets/images/divider.png',
                      ),
                    ),
                  ),
                  Shortcuts(
                    shortcuts: <LogicalKeySet, Intent>{
                      LogicalKeySet(LogicalKeyboardKey.arrowUp): UpIntent4(),
                      LogicalKeySet(LogicalKeyboardKey.arrowDown):
                          DownIntent4(),
                    },
                    child: Column(children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Actions(
                              actions: <Type, Action<Intent>>{
                                DownIntent4: CallbackAction(
                                  onInvoke: (intent) =>
                                      goDown(context, focusNode1!, 1),
                                ),
                                // UpIntent3: CallbackAction(
                                //   onInvoke: (intent) => goUp(
                                //     context,
                                //     _allNodes[i],
                                //   ),
                                // ),
                              },
                              child: Focus(
                                focusNode: focusNode,
                                child: Container(
                                  height: 35.sp,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    color: selected == 0 && focusNode!.hasFocus
                                        ? primaryColor
                                        : Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "Marathi",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: selected == 0 ?? focusNode!.hasFocus
                                  ? Colors.transparent
                                  : primaryColor,
                              thickness:
                                  selected == 0 ?? focusNode!.hasFocus ? 2 : 0,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Actions(
                              actions: <Type, Action<Intent>>{
                                DownIntent4: CallbackAction(
                                  onInvoke: (intent) =>
                                      goDown(context, focusNode2!, 2),
                                ),
                                UpIntent4: CallbackAction(
                                  onInvoke: (intent) =>
                                      goUp(context, focusNode!, 0),
                                ),
                              },
                              child: Focus(
                                focusNode: focusNode1,
                                child: Container(
                                  height: 35.sp,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    color: selected == 1 || focusNode1!.hasFocus
                                        ? primaryColor
                                        : Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "USA",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: selected == 1 || focusNode1!.hasFocus
                                  ? Colors.transparent
                                  : primaryColor,
                              thickness:
                                  selected == 1 || focusNode1!.hasFocus ? 2 : 0,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = 2;
                          });
                        },
                        child: Column(
                          children: [
                            Actions(
                              actions: <Type, Action<Intent>>{
                                DownIntent4: CallbackAction(
                                  onInvoke: (intent) =>
                                      goDown(context, focusNode3!, 3),
                                ),
                                UpIntent4: CallbackAction(
                                  onInvoke: (intent) =>
                                      goUp(context, focusNode1!, 1),
                                ),
                              },
                              child: Focus(
                                focusNode: focusNode2,
                                child: Container(
                                  height: 35.sp,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    color: selected == 2 || focusNode2!.hasFocus
                                        ? primaryColor
                                        : Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "Nepal",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: selected == 2 || focusNode2!.hasFocus
                                  ? Colors.transparent
                                  : primaryColor,
                              thickness:
                                  selected == 2 || focusNode2!.hasFocus ? 2 : 0,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Actions(
                              actions: <Type, Action<Intent>>{
                                DownIntent4: CallbackAction(
                                  onInvoke: (intent) =>
                                      goDown(context, focusNode4!, 4),
                                ),
                                UpIntent4: CallbackAction(
                                  onInvoke: (intent) =>
                                      goUp(context, focusNode2!, 2),
                                ),
                              },
                              child: Focus(
                                focusNode: focusNode3,
                                child: Container(
                                  height: 35.sp,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    color: selected == 3 || focusNode3!.hasFocus
                                        ? primaryColor
                                        : Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "English",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: selected == 3 || focusNode3!.hasFocus
                                  ? Colors.transparent
                                  : primaryColor,
                              thickness:
                                  selected == 3 || focusNode3!.hasFocus ? 2 : 0,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = 4;
                          });
                        },
                        child: Column(
                          children: [
                            Actions(
                              actions: <Type, Action<Intent>>{
                                UpIntent4: CallbackAction(
                                  onInvoke: (intent) =>
                                      goUp(context, focusNode3!, 3),
                                ),
                              },
                              child: Focus(
                                focusNode: focusNode4,
                                child: Container(
                                  height: 35.sp,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    color: selected == 4 || focusNode4!.hasFocus
                                        ? primaryColor
                                        : Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "Infotainment",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: selected == 4 || focusNode4!.hasFocus
                                  ? Colors.transparent
                                  : primaryColor,
                              thickness:
                                  selected == 4 || focusNode4!.hasFocus ? 2 : 0,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
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
                      header(),
                      SizedBox(
                        height: 10.sp,
                      ),
                      SizedBox(
                        width: 420.sp,
                        child: Image.asset(
                          'assets/images/divider.png',
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 300.sp,
                                child: GridView.builder(
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    mainAxisExtent: 55.sp,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                  ),
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showSelected = index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // border: Border.all(
                                        //     color: showSelected == index
                                        //         ? Colors.white
                                        //         : Colors.transparent,
                                        //     width: 1.5),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/colors.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return SizedBox(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              items[selected],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp),
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 35.sp,
              width: 100.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class EnterIntent4 extends Intent {}

class DownIntent4 extends Intent {}

class UpIntent4 extends Intent {}

class RightIntent4 extends Intent {}

class LeftIntent4 extends Intent {}
