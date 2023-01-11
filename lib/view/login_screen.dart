// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:max_supreme_flutter/common_widget/common_widget.dart';
// import 'package:max_supreme_flutter/constant/const.dart';
// import 'package:max_supreme_flutter/view/select_user_screen.dart';
// import 'package:sizer/sizer.dart';
// import 'package:get/get.dart';
// import 'login_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final login = TextEditingController();
//   final password = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CommonWidget.commonBackground(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CommonWidget.commonAppLogo(
//               height: 50.sp,
//               width: 140.sp,
//             ),
//             SizedBox(
//               height: 25.sp,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: Get.width * 0.20),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: Get.width * 0.15,
//                     child: Text(
//                       "Login",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 17.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: Get.width * 0.03,
//                   ),
//                   Expanded(
//                     child: Container(
//                       height: Get.height * 0.13,
//                       child: Center(
//                         child: TextFormField(
//                           style: TextStyle(color: Colors.white),
//                           controller: login,
//                           cursorColor: Colors.white,
//                           decoration: InputDecoration(
//                             contentPadding:
//                                 EdgeInsets.only(bottom: 7, left: 15),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15.sp,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: Get.width * 0.20),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: Get.width * 0.15,
//                     child: Text(
//                       "Password",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 17.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: Get.width * 0.03,
//                   ),
//                   Expanded(
//                     child: Container(
//                       height: Get.height * 0.13,
//                       child: Center(
//                         child: TextFormField(
//                           style: TextStyle(color: Colors.white),
//                           controller: password,
//                           cursorColor: Colors.white,
//                           decoration: InputDecoration(
//                             contentPadding:
//                                 EdgeInsets.only(bottom: 7, left: 15),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20.sp,
//             ),
//             InkWell(
//               onTap: () {
//                 Get.off(() => SelectUserScreen());
//               },
//               child: Container(
//                 height: Get.height * 0.13,
//                 width: Get.width * 0.15,
//                 decoration: BoxDecoration(
//                   color: primaryColor,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Submit",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
