// import 'package:flutter/material.dart';
// import 'package:max_supreme_flutter/controller/handle_screen_controller.dart';
// import 'package:sizer/sizer.dart';
// import 'package:get/get.dart';
//
// class WebSeriesScreen extends StatefulWidget {
//   const WebSeriesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<WebSeriesScreen> createState() => _WebSeriesScreenState();
// }
//
// class _WebSeriesScreenState extends State<WebSeriesScreen> {
//   HandleScreenController controller = Get.find();
//
//   int showSelected = 0;
//
//   List series = [
//     {
//       'image': "assets/images/series/claws.jpg",
//       'title': "Claws",
//     },
//     {
//       'image': "assets/images/series/fivebedroom.jpg",
//       'title': "Five Bedroom",
//     },
//     {
//       'image': "assets/images/series/Jett.jpg",
//       'title': "Jett",
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: Get.width < 400 ? Get.width / 2.3 : Get.width / 2,
//               child: GridView.builder(
//                 itemCount: series.length,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 5,
//                   mainAxisExtent: 65.sp,
//                   crossAxisSpacing: 15,
//                   mainAxisSpacing: 15,
//                 ),
//                 itemBuilder: (context, index) => GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showSelected = index;
//                     });
//                     controller.changeTapped(true);
//                     controller.changeScreen(index);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color: controller.screenSelected == index
//                               ? Color(0xffF9E20D)
//                               : Colors.transparent,
//                           width: 1.5),
//                       image: DecorationImage(
//                         image: AssetImage(
//                           series[index]['image'],
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: Get.width > 800 ? Get.width * 0.05 : Get.width * 0.06,
//             ),
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                   height: 100.sp,
//                   width: 80.sp,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(series[showSelected]['image']),
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -69.sp,
//                   child: Container(
//                     height: 70.sp,
//                     width: 80.sp,
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         image: AssetImage("assets/images/shadow2.png"),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -65.sp,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 5.sp),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           series[showSelected]['title'],
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 10.sp),
//                         ),
//                         Text(
//                           "2022   3h 7m ",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 8.sp),
//                         ),
//                         SizedBox(
//                           height: 3.sp,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "IMDB: ",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                             Text(
//                               "7.6/10",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 1,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "Type: ",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                             Text(
//                               "Movie",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 1,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "Release: ",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                             Text(
//                               "19 Oct 2001",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 1,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "Cast: ",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                             Text(
//                               "Angeliana",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 1,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Decription: ",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                             Text(
//                               "Abc",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 6.sp),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
