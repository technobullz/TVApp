import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_supreme_flutter/common_widget/common_widget.dart';
import 'package:max_supreme_flutter/constant/const.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class SelectUserScreen extends StatefulWidget {
  const SelectUserScreen({Key? key}) : super(key: key);

  @override
  State<SelectUserScreen> createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  List userList = [
    {
      'image': 'assets/images/user icon.png',
      'title': "User 1",
    },
    {
      'image': 'assets/images/user icon.png',
      'title': "User 2",
    },
    {
      'image': 'assets/images/user icon.png',
      'title': "User 3",
    },
    {
      'image': 'assets/images/add.png',
      'title': "Add New",
    },
    {
      'image': 'assets/images/add.png',
      'title': "Add New",
    },
  ];

  FocusNode? yesNode;
  FocusNode? noNode;

  setYesFocus() {
    if (yesNode == null) {
      yesNode = FocusNode();
      noNode = FocusNode();
      FocusScope.of(context).requestFocus(yesNode);
    }
  }

  goRight1(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  goLeft1(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  int selected = 0;

  FocusNode? focusNode;
  FocusNode? focusNode1;
  FocusNode? focusNode2;
  FocusNode? focusNode3;
  FocusNode? focusNode4;

  int i = 0;

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

  goRight(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  goLeft(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) {
        return Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftIntent5(),
            LogicalKeySet(LogicalKeyboardKey.arrowRight): RightIntent5(),
          },
          child: AlertDialog(
            title: const Text("Do you want to exit the app?"),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context, false);
                },
                child: Actions(
                  actions: <Type, Action<Intent>>{
                    RightIntent5: CallbackAction(
                      onInvoke: (intent) => goRight1(
                        context,
                        yesNode!,
                      ),
                    ),
                    // LeftIntent: CallbackAction(
                    //   onInvoke: (intent) => goLeft(
                    //     context,
                    //     focusNode!,
                    //   ),
                    // ),
                    EnterIntent5: CallbackAction(onInvoke: (intent) {
                      Navigator.pop(context, false);
                      //_allNodes[index].dispose();
                    }),
                  },
                  child: Focus(
                    focusNode: noNode,
                    child: Container(
                      color: noNode!.hasFocus
                          ? Colors.grey.shade200
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: const Text(
                          "NO",
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context, true);
                },
                child: Actions(
                  actions: <Type, Action<Intent>>{
                    // RightIntent5: CallbackAction(
                    //   onInvoke: (intent) => goRight(
                    //     context,
                    //     noNode!,
                    //   ),
                    // ),
                    LeftIntent5: CallbackAction(
                      onInvoke: (intent) => goLeft1(
                        context,
                        noNode!,
                      ),
                    ),
                    EnterIntent5: CallbackAction(onInvoke: (intent) {
                      Navigator.pop(context, true);
                      //_allNodes[index].dispose();
                    }),
                  },
                  child: Focus(
                    focusNode: yesNode,
                    child: Container(
                      color: yesNode!.hasFocus
                          ? Colors.grey.shade200
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: const Text(
                          "YES",
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });

  @override
  void dispose() {
    focusNode!.dispose();
    focusNode1!.dispose();
    focusNode2!.dispose();
    focusNode3!.dispose();
    focusNode4!.dispose();
    yesNode!.dispose();
    noNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (yesNode == null) {
      setYesFocus();
    }

    if (focusNode == null) {
      setFirstFocus();
    }

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
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
                    height: 50.sp,
                  ),
                  users(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget users() {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): RightIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): UpIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): DownIntent(),
        LogicalKeySet(LogicalKeyboardKey.select): EnterIntent(),
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
          onTap: () {
            setState(() {
              selected = 0;
            });
            Get.to(() => HomeScreen());
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              RightIntent: CallbackAction(
                onInvoke: (intent) => goRight(
                  context,
                  focusNode1!,
                ),
              ),
              // LeftIntent: CallbackAction(
              //   onInvoke: (intent) => goLeft(
              //     context,
              //     focusNode!,
              //   ),
              // ),
              EnterIntent: CallbackAction(onInvoke: (intent) {
                Get.off(() => HomeScreen());
                //_allNodes[index].dispose();
              }),
            },
            child: Focus(
              focusNode: focusNode,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                height: 78.sp,
                width: 78.sp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(focusNode!.hasFocus
                          ? "assets/images/Rectangle7.png"
                          : "assets/images/box.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/user icon.png",
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    Text(
                      'User 1',
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
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 1;
            });
            Get.to(() => HomeScreen());
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              RightIntent: CallbackAction(
                onInvoke: (intent) => goRight(
                  context,
                  focusNode2!,
                ),
              ),
              LeftIntent: CallbackAction(
                onInvoke: (intent) => goLeft(
                  context,
                  focusNode!,
                ),
              ),
              EnterIntent: CallbackAction(onInvoke: (intent) {
                Get.off(() => HomeScreen());
                //_allNodes[index].dispose();
              }),
            },
            child: Focus(
              focusNode: focusNode1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                height: 78.sp,
                width: 78.sp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(focusNode1!.hasFocus
                          ? "assets/images/Rectangle7.png"
                          : "assets/images/box.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/user icon.png",
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    Text(
                      'User 2',
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
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 2;
            });
            Get.to(() => HomeScreen());
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              RightIntent: CallbackAction(
                onInvoke: (intent) => goRight(
                  context,
                  focusNode3!,
                ),
              ),
              LeftIntent: CallbackAction(
                onInvoke: (intent) => goLeft(
                  context,
                  focusNode1!,
                ),
              ),
              EnterIntent: CallbackAction(onInvoke: (intent) {
                Get.off(() => HomeScreen());
                //_allNodes[index].dispose();
              }),
            },
            child: Focus(
              focusNode: focusNode2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                height: 78.sp,
                width: 78.sp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(focusNode2!.hasFocus
                          ? "assets/images/Rectangle7.png"
                          : "assets/images/box.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/user icon.png",
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    Text(
                      'User 3',
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
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 3;
            });
            Get.to(() => HomeScreen());
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              RightIntent: CallbackAction(
                onInvoke: (intent) => goRight(
                  context,
                  focusNode4!,
                ),
              ),
              LeftIntent: CallbackAction(
                onInvoke: (intent) => goLeft(
                  context,
                  focusNode2!,
                ),
              ),
              EnterIntent: CallbackAction(onInvoke: (intent) {
                Get.off(() => HomeScreen());
                //_allNodes[index].dispose();
              }),
            },
            child: Focus(
              focusNode: focusNode3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                height: 78.sp,
                width: 78.sp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(focusNode3!.hasFocus
                          ? "assets/images/Rectangle7.png"
                          : "assets/images/box.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/add.png",
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    Text(
                      'Add New',
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
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = 3;
            });
            Get.to(() => HomeScreen());
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              LeftIntent: CallbackAction(
                onInvoke: (intent) => goLeft(
                  context,
                  focusNode3!,
                ),
              ),
              EnterIntent: CallbackAction(onInvoke: (intent) {
                Get.off(() => HomeScreen());
                //_allNodes[index].dispose();
              }),
            },
            child: Focus(
              focusNode: focusNode4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                height: 78.sp,
                width: 78.sp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(focusNode4!.hasFocus
                          ? "assets/images/Rectangle7.png"
                          : "assets/images/box.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/add.png",
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    Text(
                      'Add New',
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
        ),
      ]),
    );
  }

  // Widget users() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: List.generate(
  //       userList.length,
  //       (index) => InkWell(
  //         //focusColor: Colors.red,
  //         onTap: () {
  //           setState(() {
  //             selected = index;
  //           });
  //           Get.to(() => HomeScreen());
  //         },
  //         child: Container(
  //           margin: EdgeInsets.symmetric(horizontal: 3.w),
  //           height: 78.sp,
  //           width: 78.sp,
  //           decoration: BoxDecoration(
  //             border: Border.all(color: Theme.of(context).focusColor),
  //             image: DecorationImage(
  //                 image: AssetImage("assets/images/box.png"), fit: BoxFit.fill),
  //           ),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Image.asset(
  //                 userList[index]['image'],
  //                 height: 30.sp,
  //                 width: 30.sp,
  //               ),
  //               SizedBox(
  //                 height: 6.sp,
  //               ),
  //               Text(
  //                 userList[index]['title'],
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 9.sp),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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

class EnterIntent extends Intent {}

class DownIntent extends Intent {}

class UpIntent extends Intent {}

class RightIntent extends Intent {}

class LeftIntent extends Intent {}

class RightIntent5 extends Intent {}

class LeftIntent5 extends Intent {}

class EnterIntent5 extends Intent {}
