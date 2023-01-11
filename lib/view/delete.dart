// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:max_supreme_flutter/common_widget/common_widget.dart';
// import 'package:max_supreme_flutter/controller/handle_screen_controller.dart';
// import 'package:max_supreme_flutter/view/movies_screen.dart';
// import 'package:max_supreme_flutter/view/seasons_screen.dart';
// import 'package:max_supreme_flutter/view/web_series_screen.dart';
// import 'package:sizer/sizer.dart';
// import '../constant/const.dart';
// import 'package:get/get.dart';
// import 'episodes_screen.dart';
//
// class ShowsScreen extends StatefulWidget {
//   const ShowsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ShowsScreen> createState() => _ShowsScreenState();
// }
//
// class _ShowsScreenState extends State<ShowsScreen> {
//   int _selected = 0;
//
//   //List items = ['Movies', 'Web Series'];
//
//   HandleScreenController controller = Get.find();
//
//   List languages = [
//     'English',
//     'Hindi',
//     'Marathi',
//     'Gujarati',
//     'Nepali',
//     'Urdu',
//     'Kannad',
//     'Malayalam',
//   ];
//
//   int languageSelected = 0;
//
//   int i = 0;
//
//   FocusNode? _focusNode;
//   FocusNode? _focusNode1;
//
//   setFirstFocus() {
//     log("Hello");
//     if (_focusNode == null) {
//       log("Hello1");
//       _focusNode = FocusNode();
//       _focusNode1 = FocusNode();
//       FocusScope.of(context).requestFocus(_focusNode);
//     }
//   }
//
//   goUp(BuildContext context, FocusNode node, int index) {
//     FocusScope.of(context).requestFocus(node);
//     setState(() {});
//     _selected = index;
//   }
//
//   goDown(BuildContext context, FocusNode node, int index) {
//     FocusScope.of(context).requestFocus(node);
//     setState(() {});
//     _selected = index;
//   }
//
//   @override
//   void dispose() {
//     _focusNode!.dispose();
//     _focusNode1!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_focusNode == null) {
//       log("Hello2");
//       setFirstFocus();
//     }
//     return Scaffold(
//       //backgroundColor: primaryColor,
//       body: CommonWidget.commonBackground(
//         body: Shortcuts(
//           shortcuts: <LogicalKeySet, Intent>{
//             LogicalKeySet(LogicalKeyboardKey.arrowUp): UpIntent3(),
//             LogicalKeySet(LogicalKeyboardKey.arrowDown): DownIntent3(),
//             LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftIntent3(),
//             LogicalKeySet(LogicalKeyboardKey.arrowRight): RightIntent3(),
//             LogicalKeySet(LogicalKeyboardKey.select): EnterIntent3(),
//           },
//           child: GetBuilder<HandleScreenController>(
//             builder: (controller) => Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   height: double.infinity,
//                   width: Get.width < 400 ? Get.width * 0.18 : Get.width * 0.24,
//                   decoration: const BoxDecoration(color: Colors.black38),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 2.h,
//                       ),
//                       SafeArea(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 3.w),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Shows",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 13.sp),
//                               ),
//                               Image.asset(
//                                 'assets/images/search icon.png',
//                                 height: 13.sp,
//                                 width: 13.sp,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 150.sp,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 3.w, vertical: 3.h),
//                           child: Image.asset(
//                             'assets/images/divider.png',
//                           ),
//                         ),
//                       ),
//                       Column(children: [
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               _selected = 0;
//                             });
//                           },
//                           child: Column(
//                             children: [
//                               Actions(
//                                 actions: <Type, Action<Intent>>{
//                                   DownIntent3: CallbackAction(
//                                     onInvoke: (intent) =>
//                                         goDown(context, _focusNode1!, 1),
//                                   ),
//                                   // UpIntent3: CallbackAction(
//                                   //   onInvoke: (intent) => goUp(
//                                   //     context,
//                                   //     _allNodes[i],
//                                   //   ),
//                                   // ),
//                                 },
//                                 child: Focus(
//                                   focusNode: _focusNode,
//                                   child: Container(
//                                     height: 35.sp,
//                                     width: 150.sp,
//                                     decoration: BoxDecoration(
//                                       color:
//                                       _selected == 0 && _focusNode!.hasFocus
//                                           ? primaryColor
//                                           : Colors.transparent,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 4.w,
//                                         ),
//                                         Text(
//                                           "Movies",
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 13.sp),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Divider(
//                                 height: 0,
//                                 color: _selected == 0 ?? _focusNode1!.hasFocus
//                                     ? Colors.transparent
//                                     : primaryColor,
//                                 thickness:
//                                 _selected == 0 ?? _focusNode1!.hasFocus
//                                     ? 2
//                                     : 0,
//                               ),
//                             ],
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               _selected = 1;
//                             });
//                           },
//                           child: Column(
//                             children: [
//                               Actions(
//                                 actions: <Type, Action<Intent>>{
//                                   // DownIntent3: CallbackAction(
//                                   //   onInvoke: (intent) => goDown(
//                                   //     context,
//                                   //     focusNode1!,
//                                   //   ),
//                                   // ),
//                                   UpIntent3: CallbackAction(
//                                     onInvoke: (intent) =>
//                                         goUp(context, _focusNode!, 0),
//                                   ),
//                                 },
//                                 child: Focus(
//                                   focusNode: _focusNode1,
//                                   child: Container(
//                                     height: 35.sp,
//                                     width: 150.sp,
//                                     decoration: BoxDecoration(
//                                       color: _selected == 1 &&
//                                           _focusNode1!.hasFocus
//                                           ? primaryColor
//                                           : Colors.transparent,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 4.w,
//                                         ),
//                                         Text(
//                                           "Web Series",
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 13.sp),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Divider(
//                                 height: 0,
//                                 color: _selected == 1 ?? _focusNode1!.hasFocus
//                                     ? Colors.transparent
//                                     : primaryColor,
//                                 thickness:
//                                 _selected == 1 ?? _focusNode1!.hasFocus
//                                     ? 2
//                                     : 0,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.w),
//                   child: SafeArea(
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           top: Get.height > 500 ? Get.height * 0.05 : 0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ConstrainedBox(
//                             constraints: BoxConstraints(
//                                 maxWidth:
//                                 MediaQuery.of(context).size.width / 1.5),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   _selected == 0 ? "Movies" : "Web Series",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 13.sp),
//                                 ),
//                                 //Spacer(),
//                                 Image.asset(
//                                   'assets/images/logo.png',
//                                   height: Get.width < 400
//                                       ? Get.width * 0.05
//                                       : Get.width * 0.07,
//                                   width: Get.width < 400
//                                       ? Get.width * 0.12
//                                       : Get.width * 0.17,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.sp,
//                           ),
//                           SizedBox(
//                             width: Get.width < 400
//                                 ? Get.width / 1.8
//                                 : Get.width / 1.44,
//                             child: Image.asset(
//                               'assets/images/divider.png',
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.sp,
//                           ),
//                           SizedBox(
//                             width: Get.width < 400
//                                 ? Get.width / 1.8
//                                 : Get.width / 1.44,
//                             child: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: List.generate(
//                                   languages.length,
//                                       (index) => GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         languageSelected = index;
//                                       });
//                                     },
//                                     child: Container(
//                                       margin: EdgeInsets.only(
//                                         right: Get.width < 400
//                                             ? Get.width * 0.01
//                                             : Get.width * 0.02,
//                                       ),
//                                       padding:
//                                       EdgeInsets.symmetric(horizontal: 3.w),
//                                       child: Center(
//                                         child: Text(
//                                           languages[index],
//                                           style: TextStyle(
//                                               color: languageSelected == index
//                                                   ? Colors.white
//                                                   : Colors.white,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 9.sp),
//                                         ),
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: languageSelected == index
//                                             ? primaryColor
//                                             : Colors.black38,
//                                         borderRadius: BorderRadius.circular(20),
//                                       ),
//                                       height: Get.width < 400
//                                           ? Get.width * 0.02
//                                           : Get.width * 0.04,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.sp,
//                           ),
//                           _selected == 0
//                               ? MoviesScreen()
//                               : controller.isTapped == true
//                               ? SeasonsScreens(
//                             index: controller.screenSelected,
//                           )
//                               : controller.isTapped1 == true
//                               ? EpisodesScreens(
//                             index: controller.screenSelected,
//                           )
//                               : WebSeriesScreen(),
//                           SizedBox(
//                             height: 10.sp,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget header() {
//     return Container(
//       color: Colors.grey,
//       //width: 420.sp,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             _selected == 0 ? "Movies" : "Web Series",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 13.sp),
//           ),
//           // Spacer(),
//           Image.asset(
//             'assets/images/logo.png',
//             height: Get.width < 400 ? Get.width * 0.05 : Get.width * 0.07,
//             width: Get.width < 400 ? Get.width * 0.12 : Get.width * 0.17,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class EnterIntent3 extends Intent {}
//
// class DownIntent3 extends Intent {}
//
// class UpIntent3 extends Intent {}
//
// class RightIntent3 extends Intent {}
//
// class LeftIntent3 extends Intent {}
